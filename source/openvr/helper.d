module openvr.helper;

import openvr.api;

/** Returns true if the tracked controller role is allowed to be a hand */
pragma(inline, true) bool IsRoleAllowedAsHand(ETrackedControllerRole eRole)
{
	switch (eRole) with (ETrackedControllerRole)
	{
	case Invalid:
	case LeftHand:
	case RightHand:
		return true;
	default:
		return false;
	}
}

pragma(inline, true) ulong ButtonMaskFromId(EVRButtonId id)
{
	return 1UL << id;
}

/** Compositor frame timing reprojection flags. */

/// This flag indicates the async reprojection mode is active,
/// but does not indicate if reprojection actually happened or not.
/// Use the ReprojectionReason flags above to check if reprojection
/// was actually applied (i.e. scene texture was reused).
/// NumFramePresents > 1 also indicates the scene texture was reused,
/// and also the number of times that it was presented in total.
enum uint VRCompositor_ReprojectionReason_Cpu = 0x01;
enum uint VRCompositor_ReprojectionReason_Gpu = 0x02;
enum uint VRCompositor_ReprojectionAsync = 0x04;

/// This flag indicates whether or not motion smoothing was triggered for this frame
enum uint VRCompositor_ReprojectionMotion = 0x08;

/// The runtime may predict more than one frame (up to four) ahead if
/// it detects the application is taking too long to render. These two
/// bits will contain the count of additional frames (normally zero).
/// Use the VR_COMPOSITOR_ADDITIONAL_PREDICTED_FRAMES macro to read from
/// the latest frame timing entry.
enum uint VRCompositor_PredictionMask = 0x30;

/// Number of frames the compositor is throttling the application.
/// Use the VR_COMPOSITOR_NUMBER_OF_THROTTLED_FRAMES macro to read from
/// the latest frame timing entry.
enum uint VRCompositor_ThrottleMask = 0xC0;

enum VR_COMPOSITOR_ADDITIONAL_PREDICTED_FRAMES(alias timing) = (((timing)
			.m_nReprojectionFlags & vr.VRCompositor_PredictionMask) >> 4);
enum VR_COMPOSITOR_NUMBER_OF_THROTTLED_FRAMES(alias timing) = (((timing)
			.m_nReprojectionFlags & vr.VRCompositor_ThrottleMask) >> 6);

/** These flags will be set on DriverDirectMode_FrameTiming::m_nReprojectionFlags when IVRDriverDirectModeComponent::GetFrameTiming is called for drivers to optionally respond to. */
enum uint VRCompositor_ReprojectionMotion_Enabled = 0x100; /// Motion Smoothing is enabled in the UI for the currently running application
enum uint VRCompositor_ReprojectionMotion_ForcedOn = 0x200; /// Motion Smoothing is forced on in the UI for the currently running application
enum uint VRCompositor_ReprojectionMotion_AppThrottled = 0x400; /// Application is requesting throttling via ForceInterleavedReprojectionOn

/** Returns the current IVRHeadsetView pointer or NULL the interface could not be found. */
extern (C) IVRHeadsetView VRHeadsetView();

/** Returns true if there is an HMD attached. This check is as lightweight as possible and
* can be called outside of VR_Init/VR_Shutdown. It should be used when an application wants
* to know if initializing VR is a possibility but isn't ready to take that step yet.
*/
extern (C) bool VR_IsHmdPresent();

/** Returns true if the OpenVR runtime is installed. */
extern (C) bool VR_IsRuntimeInstalled();

/** Returns where the OpenVR runtime is installed. */
extern (C) bool VR_GetRuntimePath(char* pchPathBuffer, uint unBufferSize,
		uint* punRequiredBufferSize);

/** Returns the name of the enum value for an EVRInitError. This function may be called outside of VR_Init()/VR_Shutdown(). */
extern (C) const(char)* VR_GetVRInitErrorAsSymbol(EVRInitError error);

/** Returns an English string for an EVRInitError. Applications should call VR_GetVRInitErrorAsSymbol instead and
* use that as a key to look up their own localized error message. This function may be called outside of VR_Init()/VR_Shutdown(). */
extern (C) const(char)* VR_GetVRInitErrorAsEnglishDescription(EVRInitError error);

/** Returns the interface of the specified version. This method must be called after VR_Init. The
* pointer returned is valid until VR_Shutdown is called.
*/
extern (C) void* VR_GetGenericInterface(const(char)* pchInterfaceVersion, EVRInitError* peError);

/** Returns whether the interface of the specified version exists.
*/
extern (C) bool VR_IsInterfaceVersionValid(const(char)* pchInterfaceVersion);

/** Returns a token that represents whether the VR interface handles need to be reloaded */
extern (C) uint VR_GetInitToken();

extern (C) uint VR_InitInternal2(EVRInitError* peError,
		EVRApplicationType eApplicationType, const(char)* pStartupInfo);
extern (C) void VR_ShutdownInternal();

extern (C++, vr)
{

	/** Finds the active installation of the VR API and initializes it. The provided path must be absolute
* or relative to the current working directory. These are the local install versions of the equivalent
* functions in steamvr.h and will work without a local Steam install.
*
* This path is to the "root" of the VR API install. That's the directory with
* the "drivers" directory and a platform (i.e. "win32") directory in it, not the directory with the DLL itself.
*
* pStartupInfo is reserved for future use.
*/
	pragma(inline, true) IVRSystem VR_Init(EVRInitError* peError,
			EVRApplicationType eApplicationType, const(char)* pStartupInfo = null);

	/** unloads vrclient.dll. Any interface pointers from the interface are
* invalid after this point */
	pragma(inline, true) void VR_Shutdown();

	pragma(inline, true) ref uint VRToken()
	{
		static uint token;
		return token;
	}

	class COpenVRContext
	{
	public:
		this()
		{
			Clear();
		}

		pragma(inline, true) void Clear()
		{
			m_pVRSystem = null;
			m_pVRChaperone = null;
			m_pVRChaperoneSetup = null;
			m_pVRCompositor = null;
			m_pVROverlay = null;
			m_pVROverlayView = null;
			m_pVRHeadsetView = null;
			m_pVRRenderModels = null;
			m_pVRExtendedDisplay = null;
			m_pVRSettings = null;
			m_pVRApplications = null;
			m_pVRTrackedCamera = null;
			m_pVRResources = null;
			m_pVRScreenshots = null;
			m_pVRDriverManager = null;
			m_pVRInput = null;
			m_pVRIOBuffer = null;
			m_pVRSpatialAnchors = null;
			m_pVRNotifications = null;
			m_pVRDebug = null;
		}

		pragma(inline, true) void CheckClear()
		{
			if (VRToken() != VR_GetInitToken())
			{
				Clear();
				VRToken() = VR_GetInitToken();
			}
		}

		IVRSystem VRSystem()
		{
			CheckClear();
			if (m_pVRSystem is null)
			{
				EVRInitError eError;
				m_pVRSystem = cast(IVRSystem) VR_GetGenericInterface(IVRSystem_Version,
						&eError);
			}
			return m_pVRSystem;
		}

		IVRChaperone VRChaperone()
		{
			CheckClear();
			if (m_pVRChaperone is null)
			{
				EVRInitError eError;
				m_pVRChaperone = cast(IVRChaperone) VR_GetGenericInterface(
						IVRChaperone_Version, &eError);
			}
			return m_pVRChaperone;
		}

		IVRChaperoneSetup VRChaperoneSetup()
		{
			CheckClear();
			if (m_pVRChaperoneSetup is null)
			{
				EVRInitError eError;
				m_pVRChaperoneSetup = cast(IVRChaperoneSetup) VR_GetGenericInterface(
						IVRChaperoneSetup_Version, &eError);
			}
			return m_pVRChaperoneSetup;
		}

		IVRCompositor VRCompositor()
		{
			CheckClear();
			if (m_pVRCompositor is null)
			{
				EVRInitError eError;
				m_pVRCompositor = cast(IVRCompositor) VR_GetGenericInterface(
						IVRCompositor_Version, &eError);
			}
			return m_pVRCompositor;
		}

		IVROverlay VROverlay()
		{
			CheckClear();
			if (m_pVROverlay is null)
			{
				EVRInitError eError;
				m_pVROverlay = cast(IVROverlay) VR_GetGenericInterface(
						IVROverlay_Version, &eError);
			}
			return m_pVROverlay;
		}

		IVROverlayView VROverlayView()
		{
			CheckClear();
			if (m_pVROverlayView is null)
			{
				EVRInitError eError;
				m_pVROverlayView = cast(IVROverlayView) VR_GetGenericInterface(
						IVROverlayView_Version, &eError);
			}
			return m_pVROverlayView;
		}

		IVRHeadsetView VRHeadsetView()
		{
			CheckClear();
			if (m_pVRHeadsetView is null)
			{
				EVRInitError eError;
				m_pVRHeadsetView = cast(IVRHeadsetView) VR_GetGenericInterface(
						IVRHeadsetView_Version, &eError);
			}
			return m_pVRHeadsetView;
		}

		IVRResources VRResources()
		{
			CheckClear();
			if (m_pVRResources is null)
			{
				EVRInitError eError;
				m_pVRResources = cast(IVRResources) VR_GetGenericInterface(
						IVRResources_Version, &eError);
			}
			return m_pVRResources;
		}

		IVRScreenshots VRScreenshots()
		{
			CheckClear();
			if (m_pVRScreenshots is null)
			{
				EVRInitError eError;
				m_pVRScreenshots = cast(IVRScreenshots) VR_GetGenericInterface(
						IVRScreenshots_Version, &eError);
			}
			return m_pVRScreenshots;
		}

		IVRRenderModels VRRenderModels()
		{
			CheckClear();
			if (m_pVRRenderModels is null)
			{
				EVRInitError eError;
				m_pVRRenderModels = cast(IVRRenderModels) VR_GetGenericInterface(
						IVRRenderModels_Version, &eError);
			}
			return m_pVRRenderModels;
		}

		IVRExtendedDisplay VRExtendedDisplay()
		{
			CheckClear();
			if (m_pVRExtendedDisplay is null)
			{
				EVRInitError eError;
				m_pVRExtendedDisplay = cast(IVRExtendedDisplay) VR_GetGenericInterface(
						IVRExtendedDisplay_Version, &eError);
			}
			return m_pVRExtendedDisplay;
		}

		IVRSettings VRSettings()
		{
			CheckClear();
			if (m_pVRSettings is null)
			{
				EVRInitError eError;
				m_pVRSettings = cast(IVRSettings) VR_GetGenericInterface(
						IVRSettings_Version, &eError);
			}
			return m_pVRSettings;
		}

		IVRApplications VRApplications()
		{
			CheckClear();
			if (m_pVRApplications is null)
			{
				EVRInitError eError;
				m_pVRApplications = cast(IVRApplications) VR_GetGenericInterface(
						IVRApplications_Version, &eError);
			}
			return m_pVRApplications;
		}

		IVRTrackedCamera VRTrackedCamera()
		{
			CheckClear();
			if (m_pVRTrackedCamera is null)
			{
				EVRInitError eError;
				m_pVRTrackedCamera = cast(IVRTrackedCamera) VR_GetGenericInterface(
						IVRTrackedCamera_Version, &eError);
			}
			return m_pVRTrackedCamera;
		}

		IVRDriverManager VRDriverManager()
		{
			CheckClear();
			if (!m_pVRDriverManager)
			{
				EVRInitError eError;
				m_pVRDriverManager = cast(IVRDriverManager) VR_GetGenericInterface(
						IVRDriverManager_Version, &eError);
			}
			return m_pVRDriverManager;
		}

		IVRInput VRInput()
		{
			CheckClear();
			if (!m_pVRInput)
			{
				EVRInitError eError;
				m_pVRInput = cast(IVRInput) VR_GetGenericInterface(IVRInput_Version,
						&eError);
			}
			return m_pVRInput;
		}

		IVRIOBuffer VRIOBuffer()
		{
			if (!m_pVRIOBuffer)
			{
				EVRInitError eError;
				m_pVRIOBuffer = cast(IVRIOBuffer) VR_GetGenericInterface(
						IVRIOBuffer_Version, &eError);
			}
			return m_pVRIOBuffer;
		}

		IVRSpatialAnchors VRSpatialAnchors()
		{
			CheckClear();
			if (!m_pVRSpatialAnchors)
			{
				EVRInitError eError;
				m_pVRSpatialAnchors = cast(IVRSpatialAnchors) VR_GetGenericInterface(
						IVRSpatialAnchors_Version, &eError);
			}
			return m_pVRSpatialAnchors;
		}

		IVRDebug VRDebug()
		{
			CheckClear();
			if (!m_pVRDebug)
			{
				EVRInitError eError;
				m_pVRDebug = cast(IVRDebug) VR_GetGenericInterface(IVRDebug_Version,
						&eError);
			}
			return m_pVRDebug;
		}

		IVRNotifications VRNotifications()
		{
			CheckClear();
			if (!m_pVRNotifications)
			{
				EVRInitError eError;
				m_pVRNotifications = cast(IVRNotifications) VR_GetGenericInterface(
						IVRNotifications_Version, &eError);
			}
			return m_pVRNotifications;
		}

	private:
		IVRSystem m_pVRSystem;
		IVRChaperone m_pVRChaperone;
		IVRChaperoneSetup m_pVRChaperoneSetup;
		IVRCompositor m_pVRCompositor;
		IVRHeadsetView m_pVRHeadsetView;
		IVROverlay m_pVROverlay;
		IVROverlayView m_pVROverlayView;
		IVRResources m_pVRResources;
		IVRRenderModels m_pVRRenderModels;
		IVRExtendedDisplay m_pVRExtendedDisplay;
		IVRSettings m_pVRSettings;
		IVRApplications m_pVRApplications;
		IVRTrackedCamera m_pVRTrackedCamera;
		IVRScreenshots m_pVRScreenshots;
		IVRDriverManager m_pVRDriverManager;
		IVRInput m_pVRInput;
		IVRIOBuffer m_pVRIOBuffer;
		IVRSpatialAnchors m_pVRSpatialAnchors;
		IVRDebug m_pVRDebug;
		IVRNotifications m_pVRNotifications;
	}

	pragma(inline, true) ref COpenVRContext OpenVRInternal_ModuleContext()
	{
		static COpenVRContext ctx = null;
		if (ctx is null)
			ctx = new COpenVRContext();
		return ctx;
	}

	pragma(inline, true) IVRSystem VRSystem()
	{
		return OpenVRInternal_ModuleContext().VRSystem();
	}

	pragma(inline, true) IVRChaperone VRChaperone()
	{
		return OpenVRInternal_ModuleContext().VRChaperone();
	}

	pragma(inline, true) IVRChaperoneSetup VRChaperoneSetup()
	{
		return OpenVRInternal_ModuleContext().VRChaperoneSetup();
	}

	pragma(inline, true) IVRCompositor VRCompositor()
	{
		return OpenVRInternal_ModuleContext().VRCompositor();
	}

	pragma(inline, true) IVROverlay VROverlay()
	{
		return OpenVRInternal_ModuleContext().VROverlay();
	}

	pragma(inline, true) IVROverlayView VROverlayView()
	{
		return OpenVRInternal_ModuleContext().VROverlayView();
	}

	pragma(inline, true) IVRHeadsetView VRHeadsetView()
	{
		return OpenVRInternal_ModuleContext().VRHeadsetView();
	}

	pragma(inline, true) IVRScreenshots VRScreenshots()
	{
		return OpenVRInternal_ModuleContext().VRScreenshots();
	}

	pragma(inline, true) IVRRenderModels VRRenderModels()
	{
		return OpenVRInternal_ModuleContext().VRRenderModels();
	}

	pragma(inline, true) IVRApplications VRApplications()
	{
		return OpenVRInternal_ModuleContext().VRApplications();
	}

	pragma(inline, true) IVRSettings VRSettings()
	{
		return OpenVRInternal_ModuleContext().VRSettings();
	}

	pragma(inline, true) IVRResources VRResources()
	{
		return OpenVRInternal_ModuleContext().VRResources();
	}

	pragma(inline, true) IVRExtendedDisplay VRExtendedDisplay()
	{
		return OpenVRInternal_ModuleContext().VRExtendedDisplay();
	}

	pragma(inline, true) IVRTrackedCamera VRTrackedCamera()
	{
		return OpenVRInternal_ModuleContext().VRTrackedCamera();
	}

	pragma(inline, true) IVRDriverManager VRDriverManager()
	{
		return OpenVRInternal_ModuleContext().VRDriverManager();
	}

	pragma(inline, true) IVRInput VRInput()
	{
		return OpenVRInternal_ModuleContext().VRInput();
	}

	pragma(inline, true) IVRIOBuffer VRIOBuffer()
	{
		return OpenVRInternal_ModuleContext().VRIOBuffer();
	}

	pragma(inline, true) IVRSpatialAnchors VRSpatialAnchors()
	{
		return OpenVRInternal_ModuleContext().VRSpatialAnchors();
	}

	pragma(inline, true) IVRNotifications VRNotifications()
	{
		return OpenVRInternal_ModuleContext().VRNotifications();
	}

	pragma(inline, true) IVRDebug VRDebug()
	{
		return OpenVRInternal_ModuleContext().VRDebug();
	}

	/** Finds the active installation of vrclient.dll and initializes it */
	pragma(inline, true) IVRSystem VR_Init(EVRInitError* peError,
			EVRApplicationType eApplicationType, const(char)* pStartupInfo)
	{
		IVRSystem pVRSystem = null;

		EVRInitError eError;
		VRToken() = VR_InitInternal2(&eError, eApplicationType, pStartupInfo);
		COpenVRContext* ctx = &OpenVRInternal_ModuleContext();
		ctx.Clear();

		if (eError == EVRInitError.None)
		{
			if (VR_IsInterfaceVersionValid(IVRSystem_Version))
			{
				pVRSystem = VRSystem();
			}
			else
			{
				VR_ShutdownInternal();
				eError = EVRInitError.Init_InterfaceNotFound;
			}
		}

		if (peError)
			*peError = eError;
		return pVRSystem;
	}

	/** unloads vrclient.dll. Any interface pointers from the interface are
* invalid after this point */
	pragma(inline, true) void VR_Shutdown()
	{
		VR_ShutdownInternal();
	}

}
