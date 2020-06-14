// close-to-no-modifications port of the hellovr_opengl example from Valve
//
// port of https://github.com/ValveSoftware/openvr/blob/3a010f0f668d8de59fcba75b14e08a6a08ec68a0/samples/hellovr_opengl/hellovr_opengl_main.cpp
//
// Uses gl3n as math library, imageformats to load pngs and bindbc opengl & sdl for libraries
// std::string and std::vector types replaced with D string and arrays
// printf/dprintf calls replaced with writeln

import std.conv;
import std.stdio;
import std.stdio : stderr;
import std.string;

import core.thread;
import core.time;

import bindbc.opengl;
import bindbc.sdl;
import gl3n.linalg;
import imageformats;

import openvr;

enum GL_TEXTURE_MAX_ANISOTROPY_EXT = 0x84FE;
enum GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT = 0x84FF;

class CGLRenderModel
{
	this(string sRenderModelName)
	{
		m_sModelName = sRenderModelName;
	}

	~this()
	{
		cleanup();
	}

	bool bInit(const ref RenderModel_t vrModel, const ref RenderModel_TextureMap_t vrDiffuseTexture)
	{
		// create and bind a VAO to hold state for this model
		glGenVertexArrays( 1, &m_glVertArray );
		glBindVertexArray( m_glVertArray );

		// Populate a vertex buffer
		glGenBuffers( 1, &m_glVertBuffer );
		glBindBuffer( GL_ARRAY_BUFFER, m_glVertBuffer );
		glBufferData( GL_ARRAY_BUFFER, RenderModel_Vertex_t.sizeof * vrModel.unVertexCount, vrModel.rVertexData, GL_STATIC_DRAW );

		// Identify the components in the vertex buffer
		glEnableVertexAttribArray( 0 );
		glVertexAttribPointer( 0, 3, GL_FLOAT, GL_FALSE, RenderModel_Vertex_t.sizeof, cast(void *)RenderModel_Vertex_t.vPosition.offsetof );
		glEnableVertexAttribArray( 1 );
		glVertexAttribPointer( 1, 3, GL_FLOAT, GL_FALSE, RenderModel_Vertex_t.sizeof, cast(void *)RenderModel_Vertex_t.vNormal.offsetof );
		glEnableVertexAttribArray( 2 );
		glVertexAttribPointer( 2, 2, GL_FLOAT, GL_FALSE, RenderModel_Vertex_t.sizeof, cast(void *)RenderModel_Vertex_t.rfTextureCoord.offsetof );

		// Create and populate the index buffer
		glGenBuffers( 1, &m_glIndexBuffer );
		glBindBuffer( GL_ELEMENT_ARRAY_BUFFER, m_glIndexBuffer );
		glBufferData( GL_ELEMENT_ARRAY_BUFFER, ushort.sizeof * vrModel.unTriangleCount * 3, vrModel.rIndexData, GL_STATIC_DRAW );

		glBindVertexArray( 0 );

		// create and populate the texture
		glGenTextures(1, &m_glTexture );
		glBindTexture( GL_TEXTURE_2D, m_glTexture );

		glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, vrDiffuseTexture.unWidth, vrDiffuseTexture.unHeight,
			0, GL_RGBA, GL_UNSIGNED_BYTE, vrDiffuseTexture.rubTextureMapData );

		// If this renders black ask McJohn what's wrong.
		glGenerateMipmap(GL_TEXTURE_2D);

		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR );

		GLfloat fLargest;
		glGetFloatv( GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT, &fLargest );
		glTexParameterf( GL_TEXTURE_2D, GL_TEXTURE_MAX_ANISOTROPY_EXT, fLargest );

		glBindTexture( GL_TEXTURE_2D, 0 );

		m_unVertexCount = vrModel.unTriangleCount * 3;

		return true;
	}

	void cleanup()
	{
		if( m_glVertBuffer )
		{
			glDeleteBuffers(1, &m_glIndexBuffer);
			glDeleteVertexArrays( 1, &m_glVertArray );
			glDeleteBuffers(1, &m_glVertBuffer);
			m_glIndexBuffer = 0;
			m_glVertArray = 0;
			m_glVertBuffer = 0;
		}
	}

	void draw()
	{
		glBindVertexArray( m_glVertArray );

		glActiveTexture( GL_TEXTURE0 );
		glBindTexture( GL_TEXTURE_2D, m_glTexture );

		glDrawElements( GL_TRIANGLES, m_unVertexCount, GL_UNSIGNED_SHORT, null );

		glBindVertexArray( 0 );
	}

	string getName() const
	{
		return m_sModelName;
	}

private:
	GLuint m_glVertBuffer;
	GLuint m_glIndexBuffer;
	GLuint m_glVertArray;
	GLuint m_glTexture;
	GLsizei m_unVertexCount;
	string m_sModelName;
}

class MainApplication
{
private: 
	bool m_bDebugOpenGL = false;
	bool m_bVerbose = false;
	bool m_bPerf = false;
	bool m_bVblank = false;
	bool m_bGlFinishHack = true;

	IVRSystem m_pHMD = null;
	string m_strDriver;
	string m_strDisplay;
	TrackedDevicePose_t[k_unMaxTrackedDeviceCount] m_rTrackedDevicePose;
	mat4[k_unMaxTrackedDeviceCount] m_rmat4DevicePose;
	
	struct ControllerInfo_t
	{
		VRInputValueHandle_t m_source = k_ulInvalidInputValueHandle;
		VRActionHandle_t m_actionPose = k_ulInvalidActionHandle;
		VRActionHandle_t m_actionHaptic = k_ulInvalidActionHandle;
		mat4 m_rmat4Pose;
		CGLRenderModel m_pRenderModel = null;
		string m_sRenderModelName;
		bool m_bShowController;
	}

	enum EHand
	{
		Left = 0,
		Right = 1,
	}

	ControllerInfo_t[2] m_rHand;

private: // SDL bookkeeping
	SDL_Window* m_pCompanionWindow = null;
	uint m_nCompanionWindowWidth = 640;
	uint m_nCompanionWindowHeight = 320;

	SDL_GLContext m_pContext = null;

private: // OpenGL bookkeeping
	int m_iTrackedControllerCount = 0;
	int m_iTrackedControllerCount_Last = -1;
	int m_iValidPoseCount = 0;
	int m_iValidPoseCount_Last = -1;
	bool m_bShowCubes = true;
	vec2 m_vAnalogValue;

	string m_strPoseClasses = "";                          // what classes we saw poses for this frame
	char[k_unMaxTrackedDeviceCount] m_rDevClassChar = 0;   // for each device, a character representing its class

	int m_iSceneVolumeWidth;
	int m_iSceneVolumeHeight;
	int m_iSceneVolumeDepth;
	float m_fScaleSpacing = 0;
	float m_fScale = 0;
	
	int m_iSceneVolumeInit = 20; // if you want something other than the default 20x20x20
	
	float m_fNearClip = 0;
	float m_fFarClip = 0;

	GLuint m_iTexture;

	size_t m_uiVertcount;

	GLuint m_glSceneVertBuffer;
	GLuint m_unSceneVAO;
	GLuint m_unCompanionWindowVAO;
	GLuint m_glCompanionWindowIDVertBuffer;
	GLuint m_glCompanionWindowIDIndexBuffer;
	uint m_uiCompanionWindowIndexSize;

	GLuint m_glControllerVertBuffer = 0;
	GLuint m_unControllerVAO = 0;
	uint m_uiControllerVertcount;

	mat4 m_mat4HMDPose;
	mat4 m_mat4eyePosLeft;
	mat4 m_mat4eyePosRight;

	mat4 m_mat4ProjectionCenter;
	mat4 m_mat4ProjectionLeft;
	mat4 m_mat4ProjectionRight;

	struct VertexDataScene
	{
		vec3 position;
		vec2 texCoord;
	}

	struct VertexDataWindow
	{
		vec2 position;
		vec2 texCoord;
	}

	GLuint m_unSceneProgramID = 0;
	GLuint m_unCompanionWindowProgramID = 0;
	GLuint m_unControllerTransformProgramID = 0;
	GLuint m_unRenderModelProgramID = 0;

	GLint m_nSceneMatrixLocation = -1;
	GLint m_nControllerMatrixLocation = -1;
	GLint m_nRenderModelMatrixLocation = -1;

	struct FramebufferDesc
	{
		GLuint m_nDepthBufferId;
		GLuint m_nRenderTextureId;
		GLuint m_nRenderFramebufferId;
		GLuint m_nResolveTextureId;
		GLuint m_nResolveFramebufferId;
	}

	FramebufferDesc leftEyeDesc;
	FramebufferDesc rightEyeDesc;

	bool createFrameBuffer( int nWidth, int nHeight, FramebufferDesc* framebufferDesc );
	
	uint m_nRenderWidth;
	uint m_nRenderHeight;

	CGLRenderModel[] m_vecRenderModels;

	VRActionHandle_t m_actionHideCubes = k_ulInvalidActionHandle;
	VRActionHandle_t m_actionHideThisController = k_ulInvalidActionHandle;
	VRActionHandle_t m_actionTriggerHaptic = k_ulInvalidActionHandle;
	VRActionHandle_t m_actionAnalongInput = k_ulInvalidActionHandle;

	VRActionSetHandle_t m_actionsetDemo = k_ulInvalidActionSetHandle;

public:

	this(string[] args)
	{
		assert(m_iSceneVolumeInit != 0);
		foreach (arg; args)
		{
			if( arg == "-gldebug" )
			{
				m_bDebugOpenGL = true;
			}
			else if( arg == "-verbose" )
			{
				m_bVerbose = true;
			}
			else if( arg == "-novblank" )
			{
				m_bVblank = false;
			}
			else if( arg == "-noglfinishhack" )
			{
				m_bGlFinishHack = false;
			}
			else if ( arg.startsWith("-cubevolume=") )
			{
				m_iSceneVolumeInit = arg["-cubevolume=".length .. $].to!int;
				assert(m_iSceneVolumeInit > 0, " cubevolume must be at least 1");
			}
		}
	}

	bool bInit()
	{
		SDLSupport ret = loadSDL();
		if (ret != sdlSupport)
		{
			writeln("Failed to load SDL: ", ret);
			return false;
		}

		if (SDL_Init(SDL_INIT_VIDEO | SDL_INIT_TIMER) < 0)
		{
			writeln("Failed to initialize SDL: ", SDL_GetError().to!string);
			return false;
		}

		EVRInitError vrError = EVRInitError.None;
		m_pHMD = VR_Init(&vrError, EVRApplicationType.VRApplication_Scene);

		if (vrError != EVRInitError.None)
		{
			writeln("Failed to init VR runtime: ", VR_GetVRInitErrorAsEnglishDescription(vrError).to!string);
			return false;
		}

		int nWindowPosX = 700;
		int nWindowPosY = 100;
		SDL_WindowFlags unWindowFlags = SDL_WINDOW_OPENGL | SDL_WINDOW_SHOWN;

		SDL_GL_SetAttribute( SDL_GL_CONTEXT_MAJOR_VERSION, 4 );
		SDL_GL_SetAttribute( SDL_GL_CONTEXT_MINOR_VERSION, 1 );
		//SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_COMPATIBILITY );
		SDL_GL_SetAttribute( SDL_GL_CONTEXT_PROFILE_MASK, SDL_GL_CONTEXT_PROFILE_CORE );

		SDL_GL_SetAttribute( SDL_GL_MULTISAMPLEBUFFERS, 0 );
		SDL_GL_SetAttribute( SDL_GL_MULTISAMPLESAMPLES, 0 );
		if (m_bDebugOpenGL) SDL_GL_SetAttribute( SDL_GL_CONTEXT_FLAGS, SDL_GL_CONTEXT_DEBUG_FLAG );

		m_pCompanionWindow = SDL_CreateWindow("hellovr".toStringz,
			nWindowPosX, nWindowPosY,
			m_nCompanionWindowWidth, m_nCompanionWindowHeight,
			unWindowFlags
		);

		if (m_pCompanionWindow is null)
		{
			writeln("Window could not be created! SDL Error: ", SDL_GetError().to!string);
			return false;
		}

		m_pContext = SDL_GL_CreateContext(m_pCompanionWindow);
		if (m_pContext is null)
		{
			writeln("OpenGL context could not be created! SDL Error: ", SDL_GetError().to!string);
			return false;
		}

		GLSupport glVersion = loadOpenGL();
		if (glVersion != glSupport)
		{
			writeln("Failed to load OpenGL: ", ret);
			return false;
		}
		// glGetError(); // possibly needed to clear errors

		if ( SDL_GL_SetSwapInterval( m_bVblank ? 1 : 0 ) < 0 )
		{
			stderr.writeln("Warning: Unable to set VSync! SDL Error: ", SDL_GetError().to!string);
		}

		m_strDriver = "No Driver";
		m_strDisplay = "No Display";

		m_strDriver = getTrackedDeviceString( k_unTrackedDeviceIndex_Hmd,
			TrackedDeviceProperty.Prop_TrackingSystemName_String );
		m_strDisplay = getTrackedDeviceString( k_unTrackedDeviceIndex_Hmd,
			TrackedDeviceProperty.Prop_SerialNumber_String );

		string strWindowTitle = "hellovr - " ~ m_strDriver ~ " " ~ m_strDisplay;
		SDL_SetWindowTitle(m_pCompanionWindow, strWindowTitle.toStringz());

		// cube array
		m_iSceneVolumeWidth = m_iSceneVolumeInit;
		m_iSceneVolumeHeight = m_iSceneVolumeInit;
		m_iSceneVolumeDepth = m_iSceneVolumeInit;

		m_fScale = 1.0f;
		m_fScaleSpacing = 4.0f;

		m_fNearClip = 0.1f;
		m_fFarClip = 30.0f;

		m_iTexture = 0;
		m_uiVertcount = 0;

		if (!bInitGL())
		{
			printf("Unable to initialize OpenGL!");
			return false;
		}

		if (!bInitCompositor())
		{
			printf("Failed to initialize VR Compositor!");
			return false;
		}

		VRInput.SetActionManifestPath("./hellovr_actions.json");

		VRInput.GetActionHandle("/actions/demo/in/HideCubes", &m_actionHideCubes);
		VRInput.GetActionHandle("/actions/demo/in/HideThisController", &m_actionHideThisController);
		VRInput.GetActionHandle("/actions/demo/in/TriggerHaptic", &m_actionTriggerHaptic);
		VRInput.GetActionHandle("/actions/demo/in/AnalogInput", &m_actionAnalongInput);

		VRInput.GetActionSetHandle("/actions/demo", &m_actionsetDemo);

		VRInput.GetActionHandle("/actions/demo/out/Haptic_Left", &m_rHand[EHand.Left].m_actionHaptic);
		VRInput.GetInputSourceHandle("/user/hand/left", &m_rHand[EHand.Left].m_source);
		VRInput.GetActionHandle("/actions/demo/in/Hand_Left", &m_rHand[EHand.Left].m_actionPose);

		VRInput.GetActionHandle("/actions/demo/out/Haptic_Right", &m_rHand[EHand.Right].m_actionHaptic);
		VRInput.GetInputSourceHandle("/user/hand/right", &m_rHand[EHand.Right].m_source);
		VRInput.GetActionHandle("/actions/demo/in/Hand_Right", &m_rHand[EHand.Right].m_actionPose);

		return true;
	}

	//-----------------------------------------------------------------------------
	// Purpose: Initialize OpenGL. Returns true if OpenGL has been successfully
	//          initialized, false if shaders could not be created.
	//          If failure occurred in a module other than shaders, the function
	//          may return true or throw an error. 
	//-----------------------------------------------------------------------------
	bool bInitGL()
	{
		if (m_bDebugOpenGL)
		{
			glDebugMessageCallback(&glDebugHandler, null);
			glDebugMessageControl(GL_DONT_CARE, GL_DONT_CARE, GL_DONT_CARE, 0, null, GL_TRUE);
			glEnable(GL_DEBUG_OUTPUT_SYNCHRONOUS);
		}

		if (!createAllShaders())
			return false;

		setupTexturemaps();
		setupScene();
		setupCameras();
		setupStereoRenderTargets();
		setupCompanionWindow();

		return true;
	}

	//-----------------------------------------------------------------------------
	// Purpose: Initialize Compositor. Returns true if the compositor was
	//          successfully initialized, false otherwise.
	//-----------------------------------------------------------------------------
	bool bInitCompositor()
	{
		if (!VRCompositor())
		{
			writeln("Compositor initialization failed. See log file for details");
			return false;
		}

		return true;
	}

	void shutdown()
	{
		if (m_pHMD)
		{
			VR_Shutdown();
			m_pHMD = null;
		}

		if (m_pContext)
		{
			if (m_bDebugOpenGL)
			{
				glDebugMessageControl(GL_DONT_CARE, GL_DONT_CARE, GL_DONT_CARE, 0, null, GL_FALSE);
				glDebugMessageCallback(null, null);
			}

			glDeleteBuffers(1, &m_glSceneVertBuffer);

			if (m_unSceneProgramID)
			{
				glDeleteProgram( m_unSceneProgramID );
			}
			if (m_unControllerTransformProgramID)
			{
				glDeleteProgram( m_unControllerTransformProgramID );
			}
			if (m_unRenderModelProgramID)
			{
				glDeleteProgram( m_unRenderModelProgramID );
			}
			if (m_unCompanionWindowProgramID)
			{
				glDeleteProgram( m_unCompanionWindowProgramID );
			}

			glDeleteRenderbuffers( 1, &leftEyeDesc.m_nDepthBufferId );
			glDeleteTextures( 1, &leftEyeDesc.m_nRenderTextureId );
			glDeleteFramebuffers( 1, &leftEyeDesc.m_nRenderFramebufferId );
			glDeleteTextures( 1, &leftEyeDesc.m_nResolveTextureId );
			glDeleteFramebuffers( 1, &leftEyeDesc.m_nResolveFramebufferId );

			glDeleteRenderbuffers( 1, &rightEyeDesc.m_nDepthBufferId );
			glDeleteTextures( 1, &rightEyeDesc.m_nRenderTextureId );
			glDeleteFramebuffers( 1, &rightEyeDesc.m_nRenderFramebufferId );
			glDeleteTextures( 1, &rightEyeDesc.m_nResolveTextureId );
			glDeleteFramebuffers( 1, &rightEyeDesc.m_nResolveFramebufferId );

			if( m_unCompanionWindowVAO != 0 )
			{
				glDeleteVertexArrays( 1, &m_unCompanionWindowVAO );
			}
			if( m_unSceneVAO != 0 )
			{
				glDeleteVertexArrays( 1, &m_unSceneVAO );
			}
			if( m_unControllerVAO != 0 )
			{
				glDeleteVertexArrays( 1, &m_unControllerVAO );
			}
		}

		if (m_pCompanionWindow)
		{
			SDL_DestroyWindow(m_pCompanionWindow);
			m_pCompanionWindow = null;
		}

		SDL_Quit();
	}

	//-----------------------------------------------------------------------------
	// Purpose: Compiles a GL shader program and returns the handle. Returns 0 if
	//			the shader couldn't be compiled for some reason.
	//-----------------------------------------------------------------------------
	GLuint compileGLShader( string sShaderName, string sVertexShader, string sFragmentShader )
	{
		GLuint unProgramID = glCreateProgram();
		auto pchShaderName = &sShaderName[0];
		auto pchVertexShader = &sVertexShader[0];
		auto pchFragmentShader = &sFragmentShader[0];

		GLuint nSceneVertexShader = glCreateShader(GL_VERTEX_SHADER);
		glShaderSource( nSceneVertexShader, 1, &pchVertexShader, null);
		glCompileShader( nSceneVertexShader );

		GLint vShaderCompiled = GL_FALSE;
		glGetShaderiv( nSceneVertexShader, GL_COMPILE_STATUS, &vShaderCompiled);
		if ( vShaderCompiled != GL_TRUE)
		{
			writefln("%s - Unable to compile vertex shader %d!", pchShaderName, nSceneVertexShader);
			glDeleteProgram( unProgramID );
			glDeleteShader( nSceneVertexShader );
			return 0;
		}
		glAttachShader( unProgramID, nSceneVertexShader);
		glDeleteShader( nSceneVertexShader ); // the program hangs onto this once it's attached

		GLuint  nSceneFragmentShader = glCreateShader(GL_FRAGMENT_SHADER);
		glShaderSource( nSceneFragmentShader, 1, &pchFragmentShader, null);
		glCompileShader( nSceneFragmentShader );

		GLint fShaderCompiled = GL_FALSE;
		glGetShaderiv( nSceneFragmentShader, GL_COMPILE_STATUS, &fShaderCompiled);
		if (fShaderCompiled != GL_TRUE)
		{
			writefln("%s - Unable to compile fragment shader %d!", pchShaderName, nSceneFragmentShader );
			glDeleteProgram( unProgramID );
			glDeleteShader( nSceneFragmentShader );
			return 0;	
		}

		glAttachShader( unProgramID, nSceneFragmentShader );
		glDeleteShader( nSceneFragmentShader ); // the program hangs onto this once it's attached

		glLinkProgram( unProgramID );

		GLint programSuccess = GL_TRUE;
		glGetProgramiv( unProgramID, GL_LINK_STATUS, &programSuccess);
		if ( programSuccess != GL_TRUE )
		{
			writefln("%s - Error linking program %d!", pchShaderName, unProgramID);
			glDeleteProgram( unProgramID );
			return 0;
		}

		glUseProgram( unProgramID );
		glUseProgram( 0 );

		return unProgramID;
	}

	//-----------------------------------------------------------------------------
	// Purpose: Creates all the shaders used by HelloVR SDL
	//-----------------------------------------------------------------------------
	bool createAllShaders()
	{
		m_unSceneProgramID = compileGLShader( 
			"Scene",

			// Vertex Shader
			`#version 410
			uniform mat4 matrix;
			layout(location = 0) in vec4 position;
			layout(location = 1) in vec2 v2UVcoordsIn;
			layout(location = 2) in vec3 v3NormalIn;
			out vec2 v2UVcoords;
			void main()
			{
				v2UVcoords = v2UVcoordsIn;
				gl_Position = matrix * position;
			}`,

			// Fragment Shader
			`#version 410 core
			uniform sampler2D mytexture;
			in vec2 v2UVcoords;
			out vec4 outputColor;
			void main()
			{
				outputColor = texture(mytexture, v2UVcoords);
			}`
			);
		m_nSceneMatrixLocation = glGetUniformLocation( m_unSceneProgramID, "matrix" );
		if( m_nSceneMatrixLocation == -1 )
		{
			writeln("Unable to find matrix uniform in scene shader");
			return false;
		}

		m_unControllerTransformProgramID = compileGLShader(
			"Controller",

			// vertex shader
			`#version 410
			uniform mat4 matrix;
			layout(location = 0) in vec4 position;
			layout(location = 1) in vec3 v3ColorIn;
			out vec4 v4Color;
			void main()
			{
				v4Color.xyz = v3ColorIn; v4Color.a = 1.0;
				gl_Position = matrix * position;
			}`,

			// fragment shader
			`#version 410
			in vec4 v4Color;
			out vec4 outputColor;
			void main()
			{
				outputColor = v4Color;
			}`
			);
		m_nControllerMatrixLocation = glGetUniformLocation( m_unControllerTransformProgramID, "matrix" );
		if( m_nControllerMatrixLocation == -1 )
		{
			writeln( "Unable to find matrix uniform in controller shader" );
			return false;
		}

		m_unRenderModelProgramID = compileGLShader( 
			"render model",

			// vertex shader
			`#version 410
			uniform mat4 matrix;
			layout(location = 0) in vec4 position;
			layout(location = 1) in vec3 v3NormalIn;
			layout(location = 2) in vec2 v2TexCoordsIn;
			out vec2 v2TexCoord;
			void main()
			{
				v2TexCoord = v2TexCoordsIn;
				gl_Position = matrix * vec4(position.xyz, 1);
			}`,

			//fragment shader
			`#version 410 core
			uniform sampler2D diffuse;
			in vec2 v2TexCoord;
			out vec4 outputColor;
			void main()
			{
				outputColor = texture( diffuse, v2TexCoord);
			}`
			);
		m_nRenderModelMatrixLocation = glGetUniformLocation( m_unRenderModelProgramID, "matrix" );
		if( m_nRenderModelMatrixLocation == -1 )
		{
			writeln("Unable to find matrix uniform in render model shader");
			return false;
		}

		m_unCompanionWindowProgramID = compileGLShader(
			"CompanionWindow",

			// vertex shader
			`#version 410 core
			layout(location = 0) in vec4 position;
			layout(location = 1) in vec2 v2UVIn;
			noperspective out vec2 v2UV;
			void main()
			{
				v2UV = v2UVIn;
				gl_Position = position;
			}`,

			// fragment shader
			`#version 410 core
			uniform sampler2D mytexture;
			noperspective in vec2 v2UV;
			out vec4 outputColor;
			void main()
			{
				outputColor = texture(mytexture, v2UV);
			}`
			);

		return m_unSceneProgramID != 0 
			&& m_unControllerTransformProgramID != 0
			&& m_unRenderModelProgramID != 0
			&& m_unCompanionWindowProgramID != 0;
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	bool setupTexturemaps()
	{
		string path = "./cube_texture.png";
		auto image = read_image(path, ColFmt.RGBA);
		assert(image.pixels.length = image.w * image.h * 4);

		glGenTextures(1, &m_iTexture );
		glBindTexture( GL_TEXTURE_2D, m_iTexture );

		glTexImage2D( GL_TEXTURE_2D, 0, GL_RGBA, image.w, image.h,
			0, GL_RGBA, GL_UNSIGNED_BYTE, &image.pixels[0] );

		glGenerateMipmap(GL_TEXTURE_2D);

		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR_MIPMAP_LINEAR );

		GLfloat fLargest;
		glGetFloatv(GL_MAX_TEXTURE_MAX_ANISOTROPY_EXT, &fLargest);
		glTexParameterf(GL_TEXTURE_2D, GL_TEXTURE_MAX_ANISOTROPY_EXT, fLargest);
			
		glBindTexture( GL_TEXTURE_2D, 0 );

		return ( m_iTexture != 0 );
	}

	//-----------------------------------------------------------------------------
	// Purpose: create a sea of cubes
	//-----------------------------------------------------------------------------
	void setupScene()
	{
		if (!m_pHMD)
			return;

		float[] vertdataarray;
		mat4 matScale = mat4.scaling(m_fScale, m_fScale, m_fScale);
		mat4 matTransform = mat4.translation(
			-( cast(float)m_iSceneVolumeWidth * m_fScaleSpacing ) * 0.5f,
			-( cast(float)m_iSceneVolumeHeight * m_fScaleSpacing ) * 0.5f,
			-( cast(float)m_iSceneVolumeDepth * m_fScaleSpacing ) * 0.5f);

		mat4 mat = matScale * matTransform;

		for( int z = 0; z < m_iSceneVolumeDepth; z++ )
		{
			for( int y = 0; y < m_iSceneVolumeHeight; y++ )
			{
				for( int x = 0; x < m_iSceneVolumeWidth; x++ )
				{
					addCubeToScene( mat, vertdataarray );
					mat = mat.translate( m_fScaleSpacing, 0, 0 );
				}
				mat = mat.translate( -(cast(float)m_iSceneVolumeWidth) * m_fScaleSpacing, m_fScaleSpacing, 0 );
			}
			mat = mat.translate( 0, -(cast(float)m_iSceneVolumeHeight) * m_fScaleSpacing, m_fScaleSpacing );
		}
		m_uiVertcount = vertdataarray.length / 5;

		glGenVertexArrays( 1, &m_unSceneVAO );
		glBindVertexArray( m_unSceneVAO );

		glGenBuffers( 1, &m_glSceneVertBuffer );
		glBindBuffer( GL_ARRAY_BUFFER, m_glSceneVertBuffer );
		glBufferData( GL_ARRAY_BUFFER, float.sizeof * vertdataarray.length, &vertdataarray[0], GL_STATIC_DRAW);

		GLsizei stride = VertexDataScene.sizeof;
		uint* offset = cast(uint*)0;

		glEnableVertexAttribArray( 0 );
		glVertexAttribPointer( 0, 3, GL_FLOAT, GL_FALSE, stride, offset);

		offset += vec3.sizeof;
		glEnableVertexAttribArray( 1 );
		glVertexAttribPointer( 1, 2, GL_FLOAT, GL_FALSE, stride, offset);

		glBindVertexArray( 0 );
		glDisableVertexAttribArray(0);
		glDisableVertexAttribArray(1);
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void addCubeVertex( float x, float y, float z, float u, float v, ref float[] vertdata )
	{
		vertdata ~= x;
		vertdata ~= y;
		vertdata ~= z;
		vertdata ~= u;
		vertdata ~= v;
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void addCubeToScene( mat4 mat, ref float[] vertdata )
	{
		// mat4 mat( outermat.data() );

		vec4 A = mat * vec4( 0, 0, 0, 1 );
		vec4 B = mat * vec4( 1, 0, 0, 1 );
		vec4 C = mat * vec4( 1, 1, 0, 1 );
		vec4 D = mat * vec4( 0, 1, 0, 1 );
		vec4 E = mat * vec4( 0, 0, 1, 1 );
		vec4 F = mat * vec4( 1, 0, 1, 1 );
		vec4 G = mat * vec4( 1, 1, 1, 1 );
		vec4 H = mat * vec4( 0, 1, 1, 1 );

		// triangles instead of quads
		addCubeVertex( E.x, E.y, E.z, 0, 1, vertdata ); //Front
		addCubeVertex( F.x, F.y, F.z, 1, 1, vertdata );
		addCubeVertex( G.x, G.y, G.z, 1, 0, vertdata );
		addCubeVertex( G.x, G.y, G.z, 1, 0, vertdata );
		addCubeVertex( H.x, H.y, H.z, 0, 0, vertdata );
		addCubeVertex( E.x, E.y, E.z, 0, 1, vertdata );

		addCubeVertex( B.x, B.y, B.z, 0, 1, vertdata ); //Back
		addCubeVertex( A.x, A.y, A.z, 1, 1, vertdata );
		addCubeVertex( D.x, D.y, D.z, 1, 0, vertdata );
		addCubeVertex( D.x, D.y, D.z, 1, 0, vertdata );
		addCubeVertex( C.x, C.y, C.z, 0, 0, vertdata );
		addCubeVertex( B.x, B.y, B.z, 0, 1, vertdata );

		addCubeVertex( H.x, H.y, H.z, 0, 1, vertdata ); //Top
		addCubeVertex( G.x, G.y, G.z, 1, 1, vertdata );
		addCubeVertex( C.x, C.y, C.z, 1, 0, vertdata );
		addCubeVertex( C.x, C.y, C.z, 1, 0, vertdata );
		addCubeVertex( D.x, D.y, D.z, 0, 0, vertdata );
		addCubeVertex( H.x, H.y, H.z, 0, 1, vertdata );

		addCubeVertex( A.x, A.y, A.z, 0, 1, vertdata ); //Bottom
		addCubeVertex( B.x, B.y, B.z, 1, 1, vertdata );
		addCubeVertex( F.x, F.y, F.z, 1, 0, vertdata );
		addCubeVertex( F.x, F.y, F.z, 1, 0, vertdata );
		addCubeVertex( E.x, E.y, E.z, 0, 0, vertdata );
		addCubeVertex( A.x, A.y, A.z, 0, 1, vertdata );

		addCubeVertex( A.x, A.y, A.z, 0, 1, vertdata ); //Left
		addCubeVertex( E.x, E.y, E.z, 1, 1, vertdata );
		addCubeVertex( H.x, H.y, H.z, 1, 0, vertdata );
		addCubeVertex( H.x, H.y, H.z, 1, 0, vertdata );
		addCubeVertex( D.x, D.y, D.z, 0, 0, vertdata );
		addCubeVertex( A.x, A.y, A.z, 0, 1, vertdata );

		addCubeVertex( F.x, F.y, F.z, 0, 1, vertdata ); //Right
		addCubeVertex( B.x, B.y, B.z, 1, 1, vertdata );
		addCubeVertex( C.x, C.y, C.z, 1, 0, vertdata );
		addCubeVertex( C.x, C.y, C.z, 1, 0, vertdata );
		addCubeVertex( G.x, G.y, G.z, 0, 0, vertdata );
		addCubeVertex( F.x, F.y, F.z, 0, 1, vertdata );
	}

	//-----------------------------------------------------------------------------
	// Purpose: Draw all of the controllers as X/Y/Z lines
	//-----------------------------------------------------------------------------
	void renderControllerAxes()
	{
		// Don't attempt to update controllers if input is not available
		if( !m_pHMD.IsInputAvailable() )
			return;

		float[] vertdataarray;

		m_uiControllerVertcount = 0;
		m_iTrackedControllerCount = 0;

		foreach (eHand; [EHand.Left, EHand.Right])
		{
			if ( !m_rHand[eHand].m_bShowController )
				continue;

			const mat4 mat = m_rHand[eHand].m_rmat4Pose;

			vec4 center = mat * vec4( 0, 0, 0, 1 );

			for ( int i = 0; i < 3; ++i )
			{
				auto color = vec3( 0, 0, 0 );
				auto point = vec4( 0, 0, 0, 1 );
				point.vector[i] += 0.05f;  // offset in X, Y, Z
				color.vector[i] = 1.0;  // R, G, B
				point = mat * point;
				vertdataarray ~= center.x;
				vertdataarray ~= center.y;
				vertdataarray ~= center.z;

				vertdataarray ~= color.x;
				vertdataarray ~= color.y;
				vertdataarray ~= color.z;
			
				vertdataarray ~= point.x;
				vertdataarray ~= point.y;
				vertdataarray ~= point.z;
			
				vertdataarray ~= color.x;
				vertdataarray ~= color.y;
				vertdataarray ~= color.z;
			
				m_uiControllerVertcount += 2;
			}

			vec4 start = mat * vec4( 0, 0, -0.02f, 1 );
			vec4 end = mat * vec4( 0, 0, -39.0f, 1 );
			vec3 color = vec3( .92f, .92f, .71f );

			vertdataarray ~= start.x;
			vertdataarray ~= start.y;
			vertdataarray ~= start.z;
			vertdataarray ~= color.x;
			vertdataarray ~= color.y;
			vertdataarray ~= color.z;

			vertdataarray ~= end.x;
			vertdataarray ~= end.y;
			vertdataarray ~= end.z;
			vertdataarray ~= color.x;
			vertdataarray ~= color.y;
			vertdataarray ~= color.z;
			m_uiControllerVertcount += 2;
		}

		// Setup the VAO the first time through.
		if ( m_unControllerVAO == 0 )
		{
			glGenVertexArrays( 1, &m_unControllerVAO );
			glBindVertexArray( m_unControllerVAO );

			glGenBuffers( 1, &m_glControllerVertBuffer );
			glBindBuffer( GL_ARRAY_BUFFER, m_glControllerVertBuffer );

			GLuint stride = 2 * 3 * float.sizeof;
			uint* offset = cast(uint*)0;

			glEnableVertexAttribArray( 0 );
			glVertexAttribPointer( 0, 3, GL_FLOAT, GL_FALSE, stride, offset);

			offset += vec3.sizeof;
			glEnableVertexAttribArray( 1 );
			glVertexAttribPointer( 1, 3, GL_FLOAT, GL_FALSE, stride, offset);

			glBindVertexArray( 0 );
		}

		glBindBuffer( GL_ARRAY_BUFFER, m_glControllerVertBuffer );

		// set vertex data if we have some
		if( vertdataarray.length > 0 )
		{
			//$ TODO: Use glBufferSubData for this...
			glBufferData( GL_ARRAY_BUFFER, float.sizeof * vertdataarray.length, &vertdataarray[0], GL_STREAM_DRAW );
		}
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void setupCameras()
	{
		m_mat4ProjectionLeft = getHMDMatrixProjectionEye( EVREye.Eye_Left );
		m_mat4ProjectionRight = getHMDMatrixProjectionEye( EVREye.Eye_Right );
		m_mat4eyePosLeft = getHMDMatrixPoseEye( EVREye.Eye_Left );
		m_mat4eyePosRight = getHMDMatrixPoseEye( EVREye.Eye_Right );
	}

	//-----------------------------------------------------------------------------
	// Purpose: Creates a frame buffer. Returns true if the buffer was set up.
	//          Returns false if the setup failed.
	//-----------------------------------------------------------------------------
	bool createFrameBuffer( int nWidth, int nHeight, ref FramebufferDesc framebufferDesc )
	{
		glGenFramebuffers(1, &framebufferDesc.m_nRenderFramebufferId );
		glBindFramebuffer(GL_FRAMEBUFFER, framebufferDesc.m_nRenderFramebufferId);

		glGenRenderbuffers(1, &framebufferDesc.m_nDepthBufferId);
		glBindRenderbuffer(GL_RENDERBUFFER, framebufferDesc.m_nDepthBufferId);
		glRenderbufferStorageMultisample(GL_RENDERBUFFER, 4, GL_DEPTH_COMPONENT, nWidth, nHeight );
		glFramebufferRenderbuffer(GL_FRAMEBUFFER, GL_DEPTH_ATTACHMENT, GL_RENDERBUFFER,	framebufferDesc.m_nDepthBufferId );

		glGenTextures(1, &framebufferDesc.m_nRenderTextureId );
		glBindTexture(GL_TEXTURE_2D_MULTISAMPLE, framebufferDesc.m_nRenderTextureId );
		glTexImage2DMultisample(GL_TEXTURE_2D_MULTISAMPLE, 4, GL_RGBA8, nWidth, nHeight, true);
		glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D_MULTISAMPLE, framebufferDesc.m_nRenderTextureId, 0);

		glGenFramebuffers(1, &framebufferDesc.m_nResolveFramebufferId );
		glBindFramebuffer(GL_FRAMEBUFFER, framebufferDesc.m_nResolveFramebufferId);

		glGenTextures(1, &framebufferDesc.m_nResolveTextureId );
		glBindTexture(GL_TEXTURE_2D, framebufferDesc.m_nResolveTextureId );
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR);
		glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_MAX_LEVEL, 0);
		glTexImage2D(GL_TEXTURE_2D, 0, GL_RGBA8, nWidth, nHeight, 0, GL_RGBA, GL_UNSIGNED_BYTE, null);
		glFramebufferTexture2D(GL_FRAMEBUFFER, GL_COLOR_ATTACHMENT0, GL_TEXTURE_2D, framebufferDesc.m_nResolveTextureId, 0);

		// check FBO status
		GLenum status = glCheckFramebufferStatus(GL_FRAMEBUFFER);
		if (status != GL_FRAMEBUFFER_COMPLETE)
		{
			return false;
		}

		glBindFramebuffer( GL_FRAMEBUFFER, 0 );

		return true;
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	bool setupStereoRenderTargets()
	{
		if ( !m_pHMD )
			return false;

		m_pHMD.GetRecommendedRenderTargetSize( &m_nRenderWidth, &m_nRenderHeight );

		createFrameBuffer( m_nRenderWidth, m_nRenderHeight, leftEyeDesc );
		createFrameBuffer( m_nRenderWidth, m_nRenderHeight, rightEyeDesc );
		
		return true;
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void setupCompanionWindow()
	{
		if ( !m_pHMD )
			return;

		VertexDataWindow[] vVerts;

		// left eye verts
		vVerts ~= VertexDataWindow( vec2(-1, -1), vec2(0, 1));
		vVerts ~= VertexDataWindow( vec2(0, -1), vec2(1, 1));
		vVerts ~= VertexDataWindow( vec2(-1, 1), vec2(0, 0));
		vVerts ~= VertexDataWindow( vec2(0, 1), vec2(1, 0));

		// right eye verts
		vVerts ~= VertexDataWindow( vec2(0, -1), vec2(0, 1));
		vVerts ~= VertexDataWindow( vec2(1, -1), vec2(1, 1));
		vVerts ~= VertexDataWindow( vec2(0, 1), vec2(0, 0));
		vVerts ~= VertexDataWindow( vec2(1, 1), vec2(1, 0));

		GLushort[12] vIndices = [ 0, 1, 3,   0, 3, 2,   4, 5, 7,   4, 7, 6 ];
		m_uiCompanionWindowIndexSize = vIndices.length;

		glGenVertexArrays( 1, &m_unCompanionWindowVAO );
		glBindVertexArray( m_unCompanionWindowVAO );

		glGenBuffers( 1, &m_glCompanionWindowIDVertBuffer );
		glBindBuffer( GL_ARRAY_BUFFER, m_glCompanionWindowIDVertBuffer );
		glBufferData( GL_ARRAY_BUFFER, vVerts.length*VertexDataWindow.sizeof, &vVerts[0], GL_STATIC_DRAW );

		glGenBuffers( 1, &m_glCompanionWindowIDIndexBuffer );
		glBindBuffer( GL_ELEMENT_ARRAY_BUFFER, m_glCompanionWindowIDIndexBuffer );
		glBufferData( GL_ELEMENT_ARRAY_BUFFER, m_uiCompanionWindowIndexSize*GLushort.sizeof, &vIndices[0], GL_STATIC_DRAW );

		glEnableVertexAttribArray( 0 );
		glVertexAttribPointer(0, 2, GL_FLOAT, GL_FALSE, VertexDataWindow.sizeof, cast(void*)VertexDataWindow.position.offsetof );

		glEnableVertexAttribArray( 1 );
		glVertexAttribPointer(1, 2, GL_FLOAT, GL_FALSE, VertexDataWindow.sizeof, cast(void*)VertexDataWindow.texCoord.offsetof );

		glBindVertexArray( 0 );

		glDisableVertexAttribArray(0);
		glDisableVertexAttribArray(1);

		glBindBuffer(GL_ARRAY_BUFFER, 0);
		glBindBuffer(GL_ELEMENT_ARRAY_BUFFER, 0);
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void renderStereoTargets()
	{
		glClearColor( 0.0f, 0.0f, 0.0f, 1.0f );
		glEnable( GL_MULTISAMPLE );

		// Left Eye
		glBindFramebuffer( GL_FRAMEBUFFER, leftEyeDesc.m_nRenderFramebufferId );
		glViewport(0, 0, m_nRenderWidth, m_nRenderHeight );
		renderScene( EVREye.Eye_Left );
		glBindFramebuffer( GL_FRAMEBUFFER, 0 );
		
		glDisable( GL_MULTISAMPLE );
			
		glBindFramebuffer(GL_READ_FRAMEBUFFER, leftEyeDesc.m_nRenderFramebufferId);
		glBindFramebuffer(GL_DRAW_FRAMEBUFFER, leftEyeDesc.m_nResolveFramebufferId );

		glBlitFramebuffer( 0, 0, m_nRenderWidth, m_nRenderHeight, 0, 0, m_nRenderWidth, m_nRenderHeight, 
			GL_COLOR_BUFFER_BIT,
			GL_LINEAR );

		glBindFramebuffer(GL_READ_FRAMEBUFFER, 0);
		glBindFramebuffer(GL_DRAW_FRAMEBUFFER, 0 );	

		glEnable( GL_MULTISAMPLE );

		// Right Eye
		glBindFramebuffer( GL_FRAMEBUFFER, rightEyeDesc.m_nRenderFramebufferId );
		glViewport(0, 0, m_nRenderWidth, m_nRenderHeight );
		renderScene( EVREye.Eye_Right );
		glBindFramebuffer( GL_FRAMEBUFFER, 0 );
		
		glDisable( GL_MULTISAMPLE );

		glBindFramebuffer(GL_READ_FRAMEBUFFER, rightEyeDesc.m_nRenderFramebufferId );
		glBindFramebuffer(GL_DRAW_FRAMEBUFFER, rightEyeDesc.m_nResolveFramebufferId );
		
		glBlitFramebuffer( 0, 0, m_nRenderWidth, m_nRenderHeight, 0, 0, m_nRenderWidth, m_nRenderHeight, 
			GL_COLOR_BUFFER_BIT,
			GL_LINEAR  );

		glBindFramebuffer(GL_READ_FRAMEBUFFER, 0);
		glBindFramebuffer(GL_DRAW_FRAMEBUFFER, 0 );
	}

	//-----------------------------------------------------------------------------
	// Purpose: Renders a scene with respect to nEye.
	//-----------------------------------------------------------------------------
	void renderScene( EVREye nEye )
	{
		glClear(GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT);
		glEnable(GL_DEPTH_TEST);

		if( m_bShowCubes )
		{
			glUseProgram( m_unSceneProgramID );
			glUniformMatrix4fv( m_nSceneMatrixLocation, 1, GL_TRUE, getCurrentViewProjectionMatrix( nEye ).value_ptr );
			glBindVertexArray( m_unSceneVAO );
			glBindTexture( GL_TEXTURE_2D, m_iTexture );
			glDrawArrays( GL_TRIANGLES, 0, cast(int)m_uiVertcount );
			glBindVertexArray( 0 );
		}

		bool bIsInputAvailable = m_pHMD.IsInputAvailable();

		if( bIsInputAvailable )
		{
			// draw the controller axis lines
			glUseProgram( m_unControllerTransformProgramID );
			glUniformMatrix4fv( m_nControllerMatrixLocation, 1, GL_TRUE, getCurrentViewProjectionMatrix( nEye ).value_ptr );
			glBindVertexArray( m_unControllerVAO );
			glDrawArrays( GL_LINES, 0, m_uiControllerVertcount );
			glBindVertexArray( 0 );
		}

		// ----- Render Model rendering -----
		glUseProgram( m_unRenderModelProgramID );

		foreach ( eHand; [EHand.Left, EHand.Right] )
		{
			if ( !m_rHand[eHand].m_bShowController || !m_rHand[eHand].m_pRenderModel )
				continue;

			const mat4 matDeviceToTracking = m_rHand[eHand].m_rmat4Pose;
			mat4 matMVP = getCurrentViewProjectionMatrix( nEye ) * matDeviceToTracking;
			glUniformMatrix4fv( m_nRenderModelMatrixLocation, 1, GL_TRUE, matMVP.value_ptr );

			m_rHand[eHand].m_pRenderModel.draw();
		}

		glUseProgram( 0 );
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void renderCompanionWindow()
	{
		glDisable(GL_DEPTH_TEST);
		glViewport( 0, 0, m_nCompanionWindowWidth, m_nCompanionWindowHeight );

		glBindVertexArray( m_unCompanionWindowVAO );
		glUseProgram( m_unCompanionWindowProgramID );

		// render left eye (first half of index array )
		glBindTexture(GL_TEXTURE_2D, leftEyeDesc.m_nResolveTextureId );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
		glDrawElements( GL_TRIANGLES, m_uiCompanionWindowIndexSize/2, GL_UNSIGNED_SHORT, null );

		// render right eye (second half of index array )
		glBindTexture(GL_TEXTURE_2D, rightEyeDesc.m_nResolveTextureId  );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MAG_FILTER, GL_LINEAR );
		glTexParameteri( GL_TEXTURE_2D, GL_TEXTURE_MIN_FILTER, GL_LINEAR );
		glDrawElements( GL_TRIANGLES, m_uiCompanionWindowIndexSize/2, GL_UNSIGNED_SHORT, cast(void*)m_uiCompanionWindowIndexSize );

		glBindVertexArray( 0 );
		glUseProgram( 0 );
	}

	//-----------------------------------------------------------------------------
	// Purpose: Gets a Matrix Projection Eye with respect to nEye.
	//-----------------------------------------------------------------------------
	mat4 getHMDMatrixProjectionEye( EVREye nEye )
	{
		if ( !m_pHMD )
			return mat4.identity;

		HmdMatrix44_t mat = m_pHMD.GetProjectionMatrix( nEye, m_fNearClip, m_fFarClip );

		return convertSteamVRMatrixToMatrix4(mat);
	}

	//-----------------------------------------------------------------------------
	// Purpose: Gets an HMDMatrixPoseEye with respect to nEye.
	//-----------------------------------------------------------------------------
	mat4 getHMDMatrixPoseEye( EVREye nEye )
	{
		if ( !m_pHMD )
			return mat4.identity;

		HmdMatrix34_t matEyeRight = m_pHMD.GetEyeToHeadTransform( nEye );

		return convertSteamVRMatrixToMatrix4(matEyeRight).inverse();
	}

	//-----------------------------------------------------------------------------
	// Purpose: Gets a Current View Projection Matrix with respect to nEye,
	//          which may be an Eye_Left or an Eye_Right.
	//-----------------------------------------------------------------------------
	mat4 getCurrentViewProjectionMatrix( EVREye nEye )
	{
		mat4 matMVP;
		if( nEye == EVREye.Eye_Left )
		{
			matMVP = m_mat4ProjectionLeft * m_mat4eyePosLeft * m_mat4HMDPose;
		}
		else if( nEye == EVREye.Eye_Right )
		{
			matMVP = m_mat4ProjectionRight * m_mat4eyePosRight *  m_mat4HMDPose;
		}

		return matMVP;
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void updateHMDMatrixPose()
	{
		if ( !m_pHMD )
			return;

		VRCompositor().WaitGetPoses(&m_rTrackedDevicePose[0], m_rTrackedDevicePose.length, null, 0 );

		m_iValidPoseCount = 0;
		m_strPoseClasses = "";
		for ( int nDevice = 0; nDevice < k_unMaxTrackedDeviceCount; ++nDevice )
		{
			if ( m_rTrackedDevicePose[nDevice].bPoseIsValid )
			{
				m_iValidPoseCount++;
				m_rmat4DevicePose[nDevice] = convertSteamVRMatrixToMatrix4( m_rTrackedDevicePose[nDevice].mDeviceToAbsoluteTracking );
				if (m_rDevClassChar[nDevice]==0)
				{
					switch (m_pHMD.GetTrackedDeviceClass(nDevice))
					{
					case ETrackedDeviceClass.Controller:        m_rDevClassChar[nDevice] = 'C'; break;
					case ETrackedDeviceClass.HMD:               m_rDevClassChar[nDevice] = 'H'; break;
					case ETrackedDeviceClass.Invalid:           m_rDevClassChar[nDevice] = 'I'; break;
					case ETrackedDeviceClass.GenericTracker:    m_rDevClassChar[nDevice] = 'G'; break;
					case ETrackedDeviceClass.TrackingReference: m_rDevClassChar[nDevice] = 'T'; break;
					default:                                    m_rDevClassChar[nDevice] = '?'; break;
					}
				}
				m_strPoseClasses ~= m_rDevClassChar[nDevice];
			}
		}

		if ( m_rTrackedDevicePose[k_unTrackedDeviceIndex_Hmd].bPoseIsValid )
		{
			m_mat4HMDPose = m_rmat4DevicePose[k_unTrackedDeviceIndex_Hmd];
			m_mat4HMDPose.invert();
		}
	}

	//-----------------------------------------------------------------------------
	// Purpose: Finds a render model we've already loaded or loads a new one
	//-----------------------------------------------------------------------------
	CGLRenderModel findOrLoadRenderModel( string pchRenderModelName )
	{
		CGLRenderModel pRenderModel = null;
		foreach (i; m_vecRenderModels)
		{
			if( i.getName() == pchRenderModelName )
			{
				pRenderModel = i;
				break;
			}
		}

		auto pchRenderModelNamez = pchRenderModelName.toStringz;

		// load the model if we didn't find one
		if( !pRenderModel )
		{
			RenderModel_t* pModel;
			EVRRenderModelError error;
			while (true)
			{
				error = VRRenderModels().LoadRenderModel_Async( pchRenderModelNamez, &pModel );
				if ( error != EVRRenderModelError.Loading )
					break;

				Thread.sleep(1.msecs);
			}

			if ( error != EVRRenderModelError.None )
			{
				writefln( "Unable to load render model %s - %s", pchRenderModelName, VRRenderModels().GetRenderModelErrorNameFromEnum( error ) );
				return null;
			}

			RenderModel_TextureMap_t* pTexture;
			while (true)
			{
				error = VRRenderModels().LoadTexture_Async( pModel.diffuseTextureId, &pTexture );
				if ( error != EVRRenderModelError.Loading )
					break;

				Thread.sleep(1.msecs);
			}

			if ( error != EVRRenderModelError.None )
			{
				writefln( "Unable to load render texture id:%d for render model %s", pModel.diffuseTextureId, pchRenderModelName );
				VRRenderModels().FreeRenderModel( pModel );
				return null; // move on to the next tracked device
			}

			pRenderModel = new CGLRenderModel( pchRenderModelName );
			if ( !pRenderModel.bInit( *pModel, *pTexture ) )
			{
				writefln( "Unable to create GL model from render model %s", pchRenderModelName );
				destroy(pRenderModel);
				pRenderModel = null;
			}
			else
			{
				m_vecRenderModels ~= pRenderModel;
			}
			VRRenderModels().FreeRenderModel( pModel );
			VRRenderModels().FreeTexture( pTexture );
		}
		return pRenderModel;
	}

	//-----------------------------------------------------------------------------
	// Purpose: Converts a SteamVR matrix to our local matrix class
	//-----------------------------------------------------------------------------
	mat4 convertSteamVRMatrixToMatrix4( const ref HmdMatrix34_t matPose )
	{
		return mat4(
			matPose.m[0][0], matPose.m[0][1], matPose.m[0][2], matPose.m[0][3],
			matPose.m[1][0], matPose.m[1][1], matPose.m[1][2], matPose.m[1][3],
			matPose.m[2][0], matPose.m[2][1], matPose.m[2][2], matPose.m[2][3],
			0, 0, 0, 1.0f
		);
	}

	/// ditto
	mat4 convertSteamVRMatrixToMatrix4( const ref HmdMatrix44_t matPose )
	{
		return mat4(
			matPose.m[0][0], matPose.m[0][1], matPose.m[0][2], matPose.m[0][3],
			matPose.m[1][0], matPose.m[1][1], matPose.m[1][2], matPose.m[1][3],
			matPose.m[2][0], matPose.m[2][1], matPose.m[2][2], matPose.m[2][3],
			matPose.m[3][0], matPose.m[3][1], matPose.m[3][2], matPose.m[3][3]
		);
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	bool handleInput()
	{
		SDL_Event sdlEvent;
		bool bRet = false;

		while ( SDL_PollEvent( &sdlEvent ) != 0 )
		{
			if ( sdlEvent.type == SDL_QUIT )
			{
				bRet = true;
			}
			else if ( sdlEvent.type == SDL_KEYDOWN )
			{
				if ( sdlEvent.key.keysym.sym == SDLK_ESCAPE 
					|| sdlEvent.key.keysym.sym == SDLK_q )
				{
					bRet = true;
				}
				if( sdlEvent.key.keysym.sym == SDLK_c )
				{
					m_bShowCubes = !m_bShowCubes;
				}
			}
		}

		// Process SteamVR events
		VREvent_t event;
		while( m_pHMD.PollNextEvent( &event, event.sizeof ) )
		{
			processVREvent( event );
		}

		// Process SteamVR action state
		// UpdateActionState is called each frame to update the state of the actions themselves. The application
		// controls which action sets are active with the provided array of VRActiveActionSet_t structs.
		VRActiveActionSet_t actionSet;
		actionSet.ulActionSet = m_actionsetDemo;
		VRInput().UpdateActionState( &actionSet, actionSet.sizeof, 1 );

		m_bShowCubes = !getDigitalActionState( m_actionHideCubes );

		VRInputValueHandle_t ulHapticDevice;
		if ( getDigitalActionRisingEdge( m_actionTriggerHaptic, &ulHapticDevice ) )
		{
			if ( ulHapticDevice == m_rHand[EHand.Left].m_source )
			{
				VRInput().TriggerHapticVibrationAction( m_rHand[EHand.Left].m_actionHaptic, 0, 1, 4.0f, 1.0f, k_ulInvalidInputValueHandle );
			}
			if ( ulHapticDevice == m_rHand[EHand.Right].m_source )
			{
				VRInput().TriggerHapticVibrationAction( m_rHand[EHand.Right].m_actionHaptic, 0, 1, 4.0f, 1.0f, k_ulInvalidInputValueHandle );
			}
		}

		InputAnalogActionData_t analogData;
		if ( VRInput().GetAnalogActionData( m_actionAnalongInput, &analogData, analogData.sizeof, k_ulInvalidInputValueHandle ) == EVRInputError.None && analogData.bActive )
		{
			m_vAnalogValue = vec2(analogData.x, analogData.y);
		}

		m_rHand[EHand.Left].m_bShowController = true;
		m_rHand[EHand.Right].m_bShowController = true;

		VRInputValueHandle_t ulHideDevice;
		if ( getDigitalActionState( m_actionHideThisController, &ulHideDevice ) )
		{
			if ( ulHideDevice == m_rHand[EHand.Left].m_source )
			{
				m_rHand[EHand.Left].m_bShowController = false;
			}
			if ( ulHideDevice == m_rHand[EHand.Right].m_source )
			{
				m_rHand[EHand.Right].m_bShowController = false;
			}
		}

		foreach (eHand; [EHand.Left, EHand.Right])
		{
			InputPoseActionData_t poseData;
			if ( VRInput().GetPoseActionDataForNextFrame( m_rHand[eHand].m_actionPose, ETrackingUniverseOrigin.TrackingUniverseStanding, &poseData, poseData.sizeof, k_ulInvalidInputValueHandle ) != EVRInputError.None
				|| !poseData.bActive || !poseData.pose.bPoseIsValid )
			{
				m_rHand[eHand].m_bShowController = false;
			}
			else
			{
				m_rHand[eHand].m_rmat4Pose = convertSteamVRMatrixToMatrix4( poseData.pose.mDeviceToAbsoluteTracking );

				InputOriginInfo_t originInfo;
				if ( VRInput().GetOriginTrackedDeviceInfo( poseData.activeOrigin, &originInfo, originInfo.sizeof ) == EVRInputError.None 
					&& originInfo.trackedDeviceIndex != k_unTrackedDeviceIndexInvalid )
				{
					string sRenderModelName = getTrackedDeviceString( originInfo.trackedDeviceIndex, ETrackedDeviceProperty.Prop_RenderModelName_String );
					if ( sRenderModelName != m_rHand[eHand].m_sRenderModelName )
					{
						m_rHand[eHand].m_pRenderModel = findOrLoadRenderModel( sRenderModelName );
						m_rHand[eHand].m_sRenderModelName = sRenderModelName;
					}
				}
			}
		}

		return bRet;
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void runMainLoop()
	{
		bool bQuit = false;

		SDL_StartTextInput();
		SDL_ShowCursor( SDL_DISABLE );

		while ( !bQuit )
		{
			bQuit = handleInput();

			renderFrame();
		}

		SDL_StopTextInput();
	}

	//-----------------------------------------------------------------------------
	// Purpose:
	//-----------------------------------------------------------------------------
	void renderFrame()
	{
		// for now as fast as possible
		if ( m_pHMD )
		{
			renderControllerAxes();
			renderStereoTargets();
			renderCompanionWindow();

			Texture_t leftEyeTexture = Texture_t(cast(void*)leftEyeDesc.m_nResolveTextureId, ETextureType.OpenGL, EColorSpace.Gamma);
			VRCompositor().Submit(EVREye.Eye_Left, &leftEyeTexture, null, EVRSubmitFlags.Submit_Default );
			Texture_t rightEyeTexture = Texture_t(cast(void*)rightEyeDesc.m_nResolveTextureId, ETextureType.OpenGL, EColorSpace.Gamma);
			VRCompositor().Submit(EVREye.Eye_Right, &rightEyeTexture, null, EVRSubmitFlags.Submit_Default );
		}

		if ( m_bVblank && m_bGlFinishHack )
		{
			//$ HACKHACK. From gpuview profiling, it looks like there is a bug where two renders and a present
			// happen right before and after the vsync causing all kinds of jittering issues. This glFinish()
			// appears to clear that up. Temporary fix while I try to get nvidia to investigate this problem.
			// 1/29/2014 mikesart
			glFinish();
		}

		// SwapWindow
		{
			SDL_GL_SwapWindow( m_pCompanionWindow );
		}

		// Clear
		{
			// We want to make sure the glFinish waits for the entire present to complete, not just the submission
			// of the command. So, we do a clear here right here so the glFinish will wait fully for the swap.
			glClearColor( 0, 0, 0, 1 );
			glClear( GL_COLOR_BUFFER_BIT | GL_DEPTH_BUFFER_BIT );
		}

		// Flush and wait for swap.
		if ( m_bVblank )
		{
			glFlush();
			glFinish();
		}

		// Spew out the controller and pose count whenever they change.
		if ( m_iTrackedControllerCount != m_iTrackedControllerCount_Last || m_iValidPoseCount != m_iValidPoseCount_Last )
		{
			m_iValidPoseCount_Last = m_iValidPoseCount;
			m_iTrackedControllerCount_Last = m_iTrackedControllerCount;
			
			writefln( "PoseCount:%d(%s) Controllers:%d", m_iValidPoseCount, m_strPoseClasses, m_iTrackedControllerCount );
		}

		updateHMDMatrixPose();
	}

	//-----------------------------------------------------------------------------
	// Purpose: Processes a single VR event
	//-----------------------------------------------------------------------------
	void processVREvent( const ref VREvent_t event )
	{
		switch( event.eventType )
		{
		case EVREventType.VREvent_TrackedDeviceDeactivated:
			{
				writefln( "Device %u detached.", event.trackedDeviceIndex );
			}
			break;
		case EVREventType.VREvent_TrackedDeviceUpdated:
			{
				writefln( "Device %u updated.", event.trackedDeviceIndex );
			}
			break;
		default:
			break;
		}
	}
}

//-----------------------------------------------------------------------------
// Purpose: Outputs the string in message to debugging output.
//          All other parameters are ignored.
//          Does not return any meaningful value or reference.
//-----------------------------------------------------------------------------
extern(C) void glDebugHandler(GLenum source, GLenum type, GLuint id, GLenum severity,
	GLsizei length, const(char)* message, const(void)* userParam) nothrow
{
	import core.stdc.stdio : printf; // for nothrow

	printf("GL Error: %s\n", message);
}


//-----------------------------------------------------------------------------
// Purpose: Helper to get a string from a tracked device property and turn it
//			into a std::string
//-----------------------------------------------------------------------------
string getTrackedDeviceString(TrackedDeviceIndex_t unDevice,
		TrackedDeviceProperty prop)
{
	char[128] buf = 0;
	TrackedPropertyError err;
	uint len = VRSystem.GetStringTrackedDeviceProperty(unDevice, prop,
		buf.ptr, buf.length, &err);
	if (err != ETrackedPropertyError.TrackedProp_Success)
	{
		return "Failed to get string: " ~ err.to!string;
	}
	else
	{
		return buf[0 .. len].idup;
	}
}

//---------------------------------------------------------------------------------------------------------------------
// Purpose: Returns true if the action is active and its state is true
//---------------------------------------------------------------------------------------------------------------------
bool getDigitalActionState(VRActionHandle_t action, VRInputValueHandle_t* pDevicePath = null )
{
	InputDigitalActionData_t actionData;
	VRInput.GetDigitalActionData(action, &actionData, actionData.sizeof, k_ulInvalidInputValueHandle );
	if (pDevicePath)
	{
		*pDevicePath = k_ulInvalidInputValueHandle;
		if (actionData.bActive)
		{
			InputOriginInfo_t originInfo;
			if (EVRInputError.None == VRInput.GetOriginTrackedDeviceInfo(actionData.activeOrigin, &originInfo, originInfo.sizeof))
			{
				*pDevicePath = originInfo.devicePath;
			}
		}
	}
	return actionData.bActive && actionData.bState;
}

//---------------------------------------------------------------------------------------------------------------------
// Purpose: Returns true if the action is active and had a rising edge
//---------------------------------------------------------------------------------------------------------------------
bool getDigitalActionRisingEdge(VRActionHandle_t action, VRInputValueHandle_t* pDevicePath = null )
{
	InputDigitalActionData_t actionData;
	VRInput.GetDigitalActionData(action, &actionData, actionData.sizeof, k_ulInvalidInputValueHandle );
	if (pDevicePath)
	{
		*pDevicePath = k_ulInvalidInputValueHandle;
		if (actionData.bActive)
		{
			InputOriginInfo_t originInfo;
			if (EVRInputError.None == VRInput.GetOriginTrackedDeviceInfo(actionData.activeOrigin, &originInfo, originInfo.sizeof))
			{
				*pDevicePath = originInfo.devicePath;
			}
		}
	}
	return actionData.bActive && actionData.bChanged && actionData.bState;
}

int main(string[] args)
{
	auto app = new MainApplication(args);
	scope (exit)
		app.shutdown();

	if (!app.bInit())
		return 1;

	app.runMainLoop();

	return 0;
}
