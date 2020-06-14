//
// THIS FILE IS AUTO GENERATED
//    DO NOT MANUALLY EDIT!
//
/// Automatically generated C++ API bindings
module openvr.api;

import openvr.vk_stub;
import openvr.dx_stub;

extern(C++, vr):

/// A handle for a spatial anchor.  This handle is only valid during the session it was created in.
/// Anchors that live beyond one session should be saved by their string descriptors.
alias SpatialAnchorHandle_t = uint;
alias glSharedTextureHandle_t = void*; /// Handle to a shared texture (HANDLE on Windows obtained using OpenSharedResource).
alias glInt_t = int; ///
alias glUInt_t = uint; ///
alias SharedTextureHandle_t = ulong; ///
alias DriverId_t = uint; ///
alias TrackedDeviceIndex_t = uint; /// Used to pass device IDs to API calls
alias WebConsoleHandle_t = ulong; ///
alias PropertyContainerHandle_t = ulong; /// Refers to a single container of properties
alias PropertyTypeTag_t = uint; ///
alias DriverHandle_t = PropertyContainerHandle_t; ///
alias VRActionHandle_t = ulong; ///
alias VRActionSetHandle_t = ulong; ///
alias VRInputValueHandle_t = ulong; ///
alias VRComponentProperties = uint; ///
alias VRControllerState_t = VRControllerState001_t; ///
alias VROverlayHandle_t = ulong; /// used to refer to a single VR overlay
alias BoneIndex_t = int; /// Type used for referring to bones by their index
alias TrackedCameraHandle_t = ulong; ///
alias ScreenshotHandle_t = uint; ///
/// Session unique texture identifier. Rendermodels which share the same texture will have the same id.
/// IDs <0 denote the texture is not present
alias TextureID_t = int;
alias VRNotificationId = uint; ///
alias IOBufferHandle_t = ulong; ///
alias VrProfilerEventHandle_t = ulong; /// Handle for vr profiler events
alias HmdError = EVRInitError; ///
alias Hmd_Eye = EVREye; ///
alias ColorSpace = EColorSpace; ///
alias HmdTrackingResult = ETrackingResult; ///
alias TrackedDeviceClass = ETrackedDeviceClass; ///
alias TrackingUniverseOrigin = ETrackingUniverseOrigin; ///
alias TrackedDeviceProperty = ETrackedDeviceProperty; ///
alias TrackedPropertyError = ETrackedPropertyError; ///
alias VRSubmitFlags_t = EVRSubmitFlags; ///
alias VRState_t = EVRState; ///
alias CollisionBoundsStyle_t = ECollisionBoundsStyle; ///
alias VROverlayError = EVROverlayError; ///
alias VRFirmwareError = EVRFirmwareError; ///
alias VRCompositorError = EVRCompositorError; ///
alias VRScreenshotsError = EVRScreenshotError; ///

///
enum EVREye
{
	Eye_Left = 0, ///
	Eye_Right = 1, ///
}

///
enum ETextureType
{
	Invalid = -1, ///
	DirectX = 0, ///
	OpenGL = 1, ///
	Vulkan = 2, ///
	IOSurface = 3, ///
	DirectX12 = 4, ///
	DXGISharedHandle = 5, ///
	Metal = 6, ///
}

///
enum EColorSpace
{
	Auto = 0, ///
	Gamma = 1, ///
	Linear = 2, ///
}

///
enum ETrackingResult
{
	Uninitialized = 1, ///
	Calibrating_InProgress = 100, ///
	Calibrating_OutOfRange = 101, ///
	Running_OK = 200, ///
	Running_OutOfRange = 201, ///
	Fallback_RotationOnly = 300, ///
}

/// Describes what kind of object is being tracked at a given ID
enum ETrackedDeviceClass
{
	Invalid = 0, /// Describes what kind of object is being tracked at a given ID
	HMD = 1, /// Describes what kind of object is being tracked at a given ID
	Controller = 2, /// Describes what kind of object is being tracked at a given ID
	GenericTracker = 3, /// Describes what kind of object is being tracked at a given ID
	TrackingReference = 4, /// Describes what kind of object is being tracked at a given ID
	DisplayRedirect = 5, /// Describes what kind of object is being tracked at a given ID
	Max = 6, /// Describes what kind of object is being tracked at a given ID
}

/// Describes what specific role associated with a tracked device
enum ETrackedControllerRole
{
	Invalid = 0, /// Describes what specific role associated with a tracked device
	LeftHand = 1, /// Describes what specific role associated with a tracked device
	RightHand = 2, /// Describes what specific role associated with a tracked device
	OptOut = 3, /// Describes what specific role associated with a tracked device
	Treadmill = 4, /// Describes what specific role associated with a tracked device
	Stylus = 5, /// Describes what specific role associated with a tracked device
	Max = 5, /// Describes what specific role associated with a tracked device
}

/// Identifies which style of tracking origin the application wants to use for the poses it is requesting
enum ETrackingUniverseOrigin
{
	TrackingUniverseSeated = 0, /// Identifies which style of tracking origin the application wants to use for the poses it is requesting
	TrackingUniverseStanding = 1, /// Identifies which style of tracking origin the application wants to use for the poses it is requesting
	TrackingUniverseRawAndUncalibrated = 2, /// Identifies which style of tracking origin the application wants to use for the poses it is requesting
}

///
enum EAdditionalRadioFeatures
{
	None = 0, ///
	HTCLinkBox = 1, ///
	InternalDongle = 2, ///
	ExternalDongle = 4, ///
}

/// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
enum ETrackedDeviceProperty
{
	Prop_Invalid = 0, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_TrackingSystemName_String = 1000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ModelNumber_String = 1001, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_SerialNumber_String = 1002, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_RenderModelName_String = 1003, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_WillDriftInYaw_Bool = 1004, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ManufacturerName_String = 1005, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_TrackingFirmwareVersion_String = 1006, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HardwareRevision_String = 1007, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_AllWirelessDongleDescriptions_String = 1008, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ConnectedWirelessDongle_String = 1009, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DeviceIsWireless_Bool = 1010, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DeviceIsCharging_Bool = 1011, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DeviceBatteryPercentage_Float = 1012, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_StatusDisplayTransform_Matrix34 = 1013, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Firmware_UpdateAvailable_Bool = 1014, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Firmware_ManualUpdate_Bool = 1015, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Firmware_ManualUpdateURL_String = 1016, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HardwareRevision_Uint64 = 1017, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_FirmwareVersion_Uint64 = 1018, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_FPGAVersion_Uint64 = 1019, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_VRCVersion_Uint64 = 1020, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_RadioVersion_Uint64 = 1021, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DongleVersion_Uint64 = 1022, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_BlockServerShutdown_Bool = 1023, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CanUnifyCoordinateSystemWithHmd_Bool = 1024, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ContainsProximitySensor_Bool = 1025, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DeviceProvidesBatteryStatus_Bool = 1026, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DeviceCanPowerOff_Bool = 1027, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Firmware_ProgrammingTarget_String = 1028, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DeviceClass_Int32 = 1029, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HasCamera_Bool = 1030, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverVersion_String = 1031, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Firmware_ForceUpdateRequired_Bool = 1032, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ViveSystemButtonFixRequired_Bool = 1033, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ParentDriver_Uint64 = 1034, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ResourceRoot_String = 1035, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_RegisteredDeviceType_String = 1036, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_InputProfilePath_String = 1037, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NeverTracked_Bool = 1038, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NumCameras_Int32 = 1039, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraFrameLayout_Int32 = 1040, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraStreamFormat_Int32 = 1041, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_AdditionalDeviceSettingsPath_String = 1042, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Identifiable_Bool = 1043, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_BootloaderVersion_Uint64 = 1044, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_AdditionalSystemReportData_String = 1045, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CompositeFirmwareVersion_String = 1046, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Firmware_RemindUpdate_Bool = 1047, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_PeripheralApplicationVersion_Uint64 = 1048, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ManufacturerSerialNumber_String = 1049, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ComputedSerialNumber_String = 1050, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_EstimatedDeviceFirstUseTime_Int32 = 1051, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ReportsTimeSinceVSync_Bool = 2000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_SecondsFromVsyncToPhotons_Float = 2001, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayFrequency_Float = 2002, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_UserIpdMeters_Float = 2003, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CurrentUniverseId_Uint64 = 2004, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_PreviousUniverseId_Uint64 = 2005, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayFirmwareVersion_Uint64 = 2006, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_IsOnDesktop_Bool = 2007, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCType_Int32 = 2008, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCOffset_Float = 2009, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCScale_Float = 2010, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_EdidVendorID_Int32 = 2011, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCImageLeft_String = 2012, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCImageRight_String = 2013, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayGCBlackClamp_Float = 2014, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_EdidProductID_Int32 = 2015, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraToHeadTransform_Matrix34 = 2016, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayGCType_Int32 = 2017, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayGCOffset_Float = 2018, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayGCScale_Float = 2019, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayGCPrescale_Float = 2020, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayGCImage_String = 2021, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_LensCenterLeftU_Float = 2022, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_LensCenterLeftV_Float = 2023, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_LensCenterRightU_Float = 2024, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_LensCenterRightV_Float = 2025, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_UserHeadToEyeDepthMeters_Float = 2026, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraFirmwareVersion_Uint64 = 2027, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraFirmwareDescription_String = 2028, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayFPGAVersion_Uint64 = 2029, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayBootloaderVersion_Uint64 = 2030, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayHardwareVersion_Uint64 = 2031, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_AudioFirmwareVersion_Uint64 = 2032, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraCompatibilityMode_Int32 = 2033, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ScreenshotHorizontalFieldOfViewDegrees_Float = 2034, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ScreenshotVerticalFieldOfViewDegrees_Float = 2035, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplaySuppressed_Bool = 2036, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayAllowNightMode_Bool = 2037, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCImageWidth_Int32 = 2038, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCImageHeight_Int32 = 2039, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCImageNumChannels_Int32 = 2040, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMCImageData_Binary = 2041, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_SecondsFromPhotonsToVblank_Float = 2042, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverDirectModeSendsVsyncEvents_Bool = 2043, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayDebugMode_Bool = 2044, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_GraphicsAdapterLuid_Uint64 = 2045, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverProvidedChaperonePath_String = 2048, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ExpectedTrackingReferenceCount_Int32 = 2049, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ExpectedControllerCount_Int32 = 2050, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathControllerLeftDeviceOff_String = 2051, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathControllerRightDeviceOff_String = 2052, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathTrackingReferenceDeviceOff_String = 2053, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DoNotApplyPrediction_Bool = 2054, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraToHeadTransforms_Matrix34_Array = 2055, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DistortionMeshResolution_Int32 = 2056, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverIsDrawingControllers_Bool = 2057, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestsApplicationPause_Bool = 2058, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestsReducedRendering_Bool = 2059, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_MinimumIpdStepMeters_Float = 2060, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_AudioBridgeFirmwareVersion_Uint64 = 2061, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ImageBridgeFirmwareVersion_Uint64 = 2062, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ImuToHeadTransform_Matrix34 = 2063, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ImuFactoryGyroBias_Vector3 = 2064, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ImuFactoryGyroScale_Vector3 = 2065, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ImuFactoryAccelerometerBias_Vector3 = 2066, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ImuFactoryAccelerometerScale_Vector3 = 2067, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ConfigurationIncludesLighthouse20Features_Bool = 2069, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_AdditionalRadioFeatures_Uint64 = 2070, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraWhiteBalance_Vector4_Array = 2071, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraDistortionFunction_Int32_Array = 2072, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraDistortionCoefficients_Float_Array = 2073, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ExpectedControllerType_String = 2074, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HmdTrackingStyle_Int32 = 2075, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverProvidedChaperoneVisibility_Bool = 2076, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HmdColumnCorrectionSettingPrefix_String = 2077, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CameraSupportsCompatibilityModes_Bool = 2078, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayAvailableFrameRates_Float_Array = 2080, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplaySupportsMultipleFramerates_Bool = 2081, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayColorMultLeft_Vector3 = 2082, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayColorMultRight_Vector3 = 2083, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplaySupportsRuntimeFramerateChange_Bool = 2084, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplaySupportsAnalogGain_Bool = 2085, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMinAnalogGain_Float = 2086, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayMaxAnalogGain_Float = 2087, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DashboardScale_Float = 2091, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_IpdUIRangeMinMeters_Float = 2100, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_IpdUIRangeMaxMeters_Float = 2101, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraCorrectionMode_Int32 = 2200, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraFeather_InnerLeft_Int32 = 2201, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraFeather_InnerRight_Int32 = 2202, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraFeather_InnerTop_Int32 = 2203, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraFeather_InnerBottom_Int32 = 2204, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraFeather_OuterLeft_Int32 = 2205, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraFeather_OuterRight_Int32 = 2206, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraFeather_OuterTop_Int32 = 2207, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DriverRequestedMuraFeather_OuterBottom_Int32 = 2208, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Audio_DefaultPlaybackDeviceId_String = 2300, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Audio_DefaultRecordingDeviceId_String = 2301, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Audio_DefaultPlaybackDeviceVolume_Float = 2302, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_AttachedDeviceId_String = 3000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_SupportedButtons_Uint64 = 3001, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Axis0Type_Int32 = 3002, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Axis1Type_Int32 = 3003, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Axis2Type_Int32 = 3004, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Axis3Type_Int32 = 3005, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Axis4Type_Int32 = 3006, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ControllerRoleHint_Int32 = 3007, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_FieldOfViewLeftDegrees_Float = 4000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_FieldOfViewRightDegrees_Float = 4001, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_FieldOfViewTopDegrees_Float = 4002, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_FieldOfViewBottomDegrees_Float = 4003, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_TrackingRangeMinimumMeters_Float = 4004, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_TrackingRangeMaximumMeters_Float = 4005, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ModeLabel_String = 4006, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_CanWirelessIdentify_Bool = 4007, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_Nonce_Int32 = 4008, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_IconPathName_String = 5000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceOff_String = 5001, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceSearching_String = 5002, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceSearchingAlert_String = 5003, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceReady_String = 5004, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceReadyAlert_String = 5005, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceNotReady_String = 5006, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceStandby_String = 5007, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceAlertLow_String = 5008, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_NamedIconPathDeviceStandbyAlert_String = 5009, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayHiddenArea_Binary_Start = 5100, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_DisplayHiddenArea_Binary_End = 5150, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ParentContainer = 5151, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_OverrideContainer_Uint64 = 5152, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_UserConfigPath_String = 6000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_InstallPath_String = 6001, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HasDisplayComponent_Bool = 6002, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HasControllerComponent_Bool = 6003, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HasCameraComponent_Bool = 6004, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HasDriverDirectModeComponent_Bool = 6005, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HasVirtualDisplayComponent_Bool = 6006, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_HasSpatialAnchorsSupport_Bool = 6007, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ControllerType_String = 7000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_ControllerHandSelectionPriority_Int32 = 7002, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_VendorSpecific_Reserved_Start = 10000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_VendorSpecific_Reserved_End = 10999, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
	Prop_TrackedDeviceProperty_Max = 1000000, /// Each entry in this enum represents a property that can be retrieved about a tracked device. Many fields are only valid for one ETrackedDeviceClass.
}

/// Used to return errors that occur when reading properties.
enum ETrackedPropertyError
{
	TrackedProp_Success = 0, /// Used to return errors that occur when reading properties.
	TrackedProp_WrongDataType = 1, /// Used to return errors that occur when reading properties.
	TrackedProp_WrongDeviceClass = 2, /// Used to return errors that occur when reading properties.
	TrackedProp_BufferTooSmall = 3, /// Used to return errors that occur when reading properties.
	TrackedProp_UnknownProperty = 4, /// Used to return errors that occur when reading properties.
	TrackedProp_InvalidDevice = 5, /// Used to return errors that occur when reading properties.
	TrackedProp_CouldNotContactServer = 6, /// Used to return errors that occur when reading properties.
	TrackedProp_ValueNotProvidedByDevice = 7, /// Used to return errors that occur when reading properties.
	TrackedProp_StringExceedsMaximumLength = 8, /// Used to return errors that occur when reading properties.
	TrackedProp_NotYetAvailable = 9, /// Used to return errors that occur when reading properties.
	TrackedProp_PermissionDenied = 10, /// Used to return errors that occur when reading properties.
	TrackedProp_InvalidOperation = 11, /// Used to return errors that occur when reading properties.
	TrackedProp_CannotWriteToWildcards = 12, /// Used to return errors that occur when reading properties.
	TrackedProp_IPCReadFailure = 13, /// Used to return errors that occur when reading properties.
	TrackedProp_OutOfMemory = 14, /// Used to return errors that occur when reading properties.
	TrackedProp_InvalidContainer = 15, /// Used to return errors that occur when reading properties.
}

/// Used to drive certain text in the UI when talking about the tracking system for the HMD
enum EHmdTrackingStyle
{
	Unknown = 0, /// Used to drive certain text in the UI when talking about the tracking system for the HMD
	Lighthouse = 1, /// Used to drive certain text in the UI when talking about the tracking system for the HMD
	OutsideInCameras = 2, /// Used to drive certain text in the UI when talking about the tracking system for the HMD
	InsideOutCameras = 3, /// Used to drive certain text in the UI when talking about the tracking system for the HMD
}

/// Allows the application to control how scene textures are used by the compositor when calling Submit.
enum EVRSubmitFlags
{
	Submit_Default = 0, /// Allows the application to control how scene textures are used by the compositor when calling Submit.
	Submit_LensDistortionAlreadyApplied = 1, /// Allows the application to control how scene textures are used by the compositor when calling Submit.
	Submit_GlRenderBuffer = 2, /// Allows the application to control how scene textures are used by the compositor when calling Submit.
	Submit_Reserved = 4, /// Allows the application to control how scene textures are used by the compositor when calling Submit.
	Submit_TextureWithPose = 8, /// Allows the application to control how scene textures are used by the compositor when calling Submit.
	Submit_TextureWithDepth = 16, /// Allows the application to control how scene textures are used by the compositor when calling Submit.
	Submit_FrameDiscontinuty = 32, /// Allows the application to control how scene textures are used by the compositor when calling Submit.
}

/// Status of the overall system or tracked objects
enum EVRState
{
	Undefined = -1, /// Status of the overall system or tracked objects
	Off = 0, /// Status of the overall system or tracked objects
	Searching = 1, /// Status of the overall system or tracked objects
	Searching_Alert = 2, /// Status of the overall system or tracked objects
	Ready = 3, /// Status of the overall system or tracked objects
	Ready_Alert = 4, /// Status of the overall system or tracked objects
	NotReady = 5, /// Status of the overall system or tracked objects
	Standby = 6, /// Status of the overall system or tracked objects
	Ready_Alert_Low = 7, /// Status of the overall system or tracked objects
}

/// The types of events that could be posted (and what the parameters mean for each event type)
enum EVREventType
{
	VREvent_None = 0, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedDeviceActivated = 100, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedDeviceDeactivated = 101, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedDeviceUpdated = 102, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedDeviceUserInteractionStarted = 103, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedDeviceUserInteractionEnded = 104, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_IpdChanged = 105, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_EnterStandbyMode = 106, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_LeaveStandbyMode = 107, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedDeviceRoleChanged = 108, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_WatchdogWakeUpRequested = 109, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_LensDistortionChanged = 110, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_PropertyChanged = 111, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_WirelessDisconnect = 112, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_WirelessReconnect = 113, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ButtonPress = 200, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ButtonUnpress = 201, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ButtonTouch = 202, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ButtonUntouch = 203, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Modal_Cancel = 257, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_MouseMove = 300, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_MouseButtonDown = 301, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_MouseButtonUp = 302, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_FocusEnter = 303, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_FocusLeave = 304, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ScrollDiscrete = 305, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TouchPadMove = 306, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_OverlayFocusChanged = 307, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ReloadOverlays = 308, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ScrollSmooth = 309, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_LockMousePosition = 310, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_UnlockMousePosition = 311, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_InputFocusCaptured = 400, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_InputFocusReleased = 401, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SceneApplicationChanged = 404, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SceneFocusChanged = 405, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_InputFocusChanged = 406, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SceneApplicationUsingWrongGraphicsAdapter = 408, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ActionBindingReloaded = 409, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_HideRenderModels = 410, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ShowRenderModels = 411, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SceneApplicationStateChanged = 412, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ConsoleOpened = 420, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ConsoleClosed = 421, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_OverlayShown = 500, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_OverlayHidden = 501, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_DashboardActivated = 502, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_DashboardDeactivated = 503, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_DashboardRequested = 505, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ResetDashboard = 506, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ImageLoaded = 508, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ShowKeyboard = 509, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_HideKeyboard = 510, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_OverlayGamepadFocusGained = 511, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_OverlayGamepadFocusLost = 512, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_OverlaySharedTextureChanged = 513, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ScreenshotTriggered = 516, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ImageFailed = 517, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_DashboardOverlayCreated = 518, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SwitchGamepadFocus = 519, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_RequestScreenshot = 520, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ScreenshotTaken = 521, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ScreenshotFailed = 522, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SubmitScreenshotToDashboard = 523, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ScreenshotProgressToDashboard = 524, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_PrimaryDashboardDeviceChanged = 525, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_RoomViewShown = 526, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_RoomViewHidden = 527, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ShowUI = 528, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ShowDevTools = 529, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Notification_Shown = 600, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Notification_Hidden = 601, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Notification_BeginInteraction = 602, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Notification_Destroyed = 603, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Quit = 700, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ProcessQuit = 701, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_QuitAcknowledged = 703, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_DriverRequestedQuit = 704, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_RestartRequested = 705, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ChaperoneDataHasChanged = 800, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ChaperoneUniverseHasChanged = 801, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ChaperoneTempDataHasChanged = 802, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ChaperoneSettingsHaveChanged = 803, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SeatedZeroPoseReset = 804, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ChaperoneFlushCache = 805, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ChaperoneRoomSetupStarting = 806, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ChaperoneRoomSetupFinished = 807, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_AudioSettingsHaveChanged = 820, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_BackgroundSettingHasChanged = 850, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_CameraSettingsHaveChanged = 851, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ReprojectionSettingHasChanged = 852, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ModelSkinSettingsHaveChanged = 853, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_EnvironmentSettingsHaveChanged = 854, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_PowerSettingsHaveChanged = 855, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_EnableHomeAppSettingsHaveChanged = 856, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SteamVRSectionSettingChanged = 857, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_LighthouseSectionSettingChanged = 858, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_NullSectionSettingChanged = 859, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_UserInterfaceSectionSettingChanged = 860, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_NotificationsSectionSettingChanged = 861, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_KeyboardSectionSettingChanged = 862, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_PerfSectionSettingChanged = 863, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_DashboardSectionSettingChanged = 864, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_WebInterfaceSectionSettingChanged = 865, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackersSectionSettingChanged = 866, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_LastKnownSectionSettingChanged = 867, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_DismissedWarningsSectionSettingChanged = 868, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_GpuSpeedSectionSettingChanged = 869, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_WindowsMRSectionSettingChanged = 870, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_OtherSectionSettingChanged = 871, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_StatusUpdate = 900, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_WebInterface_InstallDriverCompleted = 950, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_MCImageUpdated = 1000, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_FirmwareUpdateStarted = 1100, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_FirmwareUpdateFinished = 1101, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_KeyboardClosed = 1200, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_KeyboardCharInput = 1201, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_KeyboardDone = 1202, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ApplicationListUpdated = 1303, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ApplicationMimeTypeLoad = 1304, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ProcessConnected = 1306, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_ProcessDisconnected = 1307, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_ChaperoneBoundsShown = 1410, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_ChaperoneBoundsHidden = 1411, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_DisplayDisconnected = 1412, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_DisplayReconnected = 1413, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_HDCPError = 1414, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_ApplicationNotResponding = 1415, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_ApplicationResumed = 1416, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_OutOfVideoMemory = 1417, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_DisplayModeNotSupported = 1418, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Compositor_StageOverrideReady = 1419, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedCamera_StartVideoStream = 1500, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedCamera_StopVideoStream = 1501, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedCamera_PauseVideoStream = 1502, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedCamera_ResumeVideoStream = 1503, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_TrackedCamera_EditingSurface = 1550, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_PerformanceTest_EnableCapture = 1600, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_PerformanceTest_DisableCapture = 1601, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_PerformanceTest_FidelityLevel = 1602, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_MessageOverlay_Closed = 1650, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_MessageOverlayCloseRequested = 1651, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_HapticVibration = 1700, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_BindingLoadFailed = 1701, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_BindingLoadSuccessful = 1702, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_ActionManifestReloaded = 1703, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_ActionManifestLoadFailed = 1704, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_ProgressUpdate = 1705, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_TrackerActivated = 1706, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_BindingsUpdated = 1707, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Input_BindingSubscriptionChanged = 1708, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SpatialAnchors_PoseUpdated = 1800, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SpatialAnchors_DescriptorUpdated = 1801, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SpatialAnchors_RequestPoseUpdate = 1802, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SpatialAnchors_RequestDescriptorUpdate = 1803, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_SystemReport_Started = 1900, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Monitor_ShowHeadsetView = 2000, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_Monitor_HideHeadsetView = 2001, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_VendorSpecific_Reserved_Start = 10000, /// The types of events that could be posted (and what the parameters mean for each event type)
	VREvent_VendorSpecific_Reserved_End = 19999, /// The types of events that could be posted (and what the parameters mean for each event type)
}

/// Level of Hmd activity
/// UserInteraction_Timeout means the device is in the process of timing out.
/// InUse = ( k_EDeviceActivityLevel_UserInteraction || k_EDeviceActivityLevel_UserInteraction_Timeout )
/// VREvent_TrackedDeviceUserInteractionStarted fires when the devices transitions from Standby -> UserInteraction or Idle -> UserInteraction.
/// VREvent_TrackedDeviceUserInteractionEnded fires when the devices transitions from UserInteraction_Timeout -> Idle
enum EDeviceActivityLevel
{
	/// Level of Hmd activity
	/// UserInteraction_Timeout means the device is in the process of timing out.
	/// InUse = ( k_EDeviceActivityLevel_UserInteraction || k_EDeviceActivityLevel_UserInteraction_Timeout )
	/// VREvent_TrackedDeviceUserInteractionStarted fires when the devices transitions from Standby -> UserInteraction or Idle -> UserInteraction.
	/// VREvent_TrackedDeviceUserInteractionEnded fires when the devices transitions from UserInteraction_Timeout -> Idle
	k_EDeviceActivityLevel_Unknown = -1,
	/// Level of Hmd activity
	/// UserInteraction_Timeout means the device is in the process of timing out.
	/// InUse = ( k_EDeviceActivityLevel_UserInteraction || k_EDeviceActivityLevel_UserInteraction_Timeout )
	/// VREvent_TrackedDeviceUserInteractionStarted fires when the devices transitions from Standby -> UserInteraction or Idle -> UserInteraction.
	/// VREvent_TrackedDeviceUserInteractionEnded fires when the devices transitions from UserInteraction_Timeout -> Idle
	k_EDeviceActivityLevel_Idle = 0,
	/// Level of Hmd activity
	/// UserInteraction_Timeout means the device is in the process of timing out.
	/// InUse = ( k_EDeviceActivityLevel_UserInteraction || k_EDeviceActivityLevel_UserInteraction_Timeout )
	/// VREvent_TrackedDeviceUserInteractionStarted fires when the devices transitions from Standby -> UserInteraction or Idle -> UserInteraction.
	/// VREvent_TrackedDeviceUserInteractionEnded fires when the devices transitions from UserInteraction_Timeout -> Idle
	k_EDeviceActivityLevel_UserInteraction = 1,
	/// Level of Hmd activity
	/// UserInteraction_Timeout means the device is in the process of timing out.
	/// InUse = ( k_EDeviceActivityLevel_UserInteraction || k_EDeviceActivityLevel_UserInteraction_Timeout )
	/// VREvent_TrackedDeviceUserInteractionStarted fires when the devices transitions from Standby -> UserInteraction or Idle -> UserInteraction.
	/// VREvent_TrackedDeviceUserInteractionEnded fires when the devices transitions from UserInteraction_Timeout -> Idle
	k_EDeviceActivityLevel_UserInteraction_Timeout = 2,
	/// Level of Hmd activity
	/// UserInteraction_Timeout means the device is in the process of timing out.
	/// InUse = ( k_EDeviceActivityLevel_UserInteraction || k_EDeviceActivityLevel_UserInteraction_Timeout )
	/// VREvent_TrackedDeviceUserInteractionStarted fires when the devices transitions from Standby -> UserInteraction or Idle -> UserInteraction.
	/// VREvent_TrackedDeviceUserInteractionEnded fires when the devices transitions from UserInteraction_Timeout -> Idle
	k_EDeviceActivityLevel_Standby = 3,
	/// Level of Hmd activity
	/// UserInteraction_Timeout means the device is in the process of timing out.
	/// InUse = ( k_EDeviceActivityLevel_UserInteraction || k_EDeviceActivityLevel_UserInteraction_Timeout )
	/// VREvent_TrackedDeviceUserInteractionStarted fires when the devices transitions from Standby -> UserInteraction or Idle -> UserInteraction.
	/// VREvent_TrackedDeviceUserInteractionEnded fires when the devices transitions from UserInteraction_Timeout -> Idle
	k_EDeviceActivityLevel_Idle_Timeout = 4,
}

/// VR controller button and axis IDs
enum EVRButtonId
{
	k_EButton_System = 0, /// VR controller button and axis IDs
	k_EButton_ApplicationMenu = 1, /// VR controller button and axis IDs
	k_EButton_Grip = 2, /// VR controller button and axis IDs
	k_EButton_DPad_Left = 3, /// VR controller button and axis IDs
	k_EButton_DPad_Up = 4, /// VR controller button and axis IDs
	k_EButton_DPad_Right = 5, /// VR controller button and axis IDs
	k_EButton_DPad_Down = 6, /// VR controller button and axis IDs
	k_EButton_A = 7, /// VR controller button and axis IDs
	k_EButton_ProximitySensor = 31, /// VR controller button and axis IDs
	k_EButton_Axis0 = 32, /// VR controller button and axis IDs
	k_EButton_Axis1 = 33, /// VR controller button and axis IDs
	k_EButton_Axis2 = 34, /// VR controller button and axis IDs
	k_EButton_Axis3 = 35, /// VR controller button and axis IDs
	k_EButton_Axis4 = 36, /// VR controller button and axis IDs
	k_EButton_SteamVR_Touchpad = 32, /// VR controller button and axis IDs
	k_EButton_SteamVR_Trigger = 33, /// VR controller button and axis IDs
	k_EButton_Dashboard_Back = 2, /// VR controller button and axis IDs
	k_EButton_IndexController_A = 2, /// VR controller button and axis IDs
	k_EButton_IndexController_B = 1, /// VR controller button and axis IDs
	k_EButton_IndexController_JoyStick = 35, /// VR controller button and axis IDs
	k_EButton_Max = 64, /// VR controller button and axis IDs
}

/// used for simulated mouse events in overlay space
enum EVRMouseButton
{
	Left = 1, /// used for simulated mouse events in overlay space
	Right = 2, /// used for simulated mouse events in overlay space
	Middle = 4, /// used for simulated mouse events in overlay space
}

///
enum EShowUIType
{
	ShowUI_ControllerBinding = 0, ///
	ShowUI_ManageTrackers = 1, ///
	ShowUI_Pairing = 3, ///
	ShowUI_Settings = 4, ///
	ShowUI_DebugCommands = 5, ///
	ShowUI_FullControllerBinding = 6, ///
	ShowUI_ManageDrivers = 7, ///
}

///
enum EHDCPError
{
	None = 0, ///
	LinkLost = 1, ///
	Tampered = 2, ///
	DeviceRevoked = 3, ///
	Unknown = 4, ///
}

///
enum EVRComponentProperty
{
	IsStatic = 1, ///
	IsVisible = 2, ///
	IsTouched = 4, ///
	IsPressed = 8, ///
	IsScrolled = 16, ///
	IsHighlighted = 32, ///
}

///
enum EVRInputError
{
	None = 0, ///
	NameNotFound = 1, ///
	WrongType = 2, ///
	InvalidHandle = 3, ///
	InvalidParam = 4, ///
	NoSteam = 5, ///
	MaxCapacityReached = 6, ///
	IPCError = 7, ///
	NoActiveActionSet = 8, ///
	InvalidDevice = 9, ///
	InvalidSkeleton = 10, ///
	InvalidBoneCount = 11, ///
	InvalidCompressedData = 12, ///
	NoData = 13, ///
	BufferTooSmall = 14, ///
	MismatchedActionManifest = 15, ///
	MissingSkeletonData = 16, ///
	InvalidBoneIndex = 17, ///
	InvalidPriority = 18, ///
	PermissionDenied = 19, ///
	InvalidRenderModel = 20, ///
}

///
enum EVRSpatialAnchorError
{
	Success = 0, ///
	Internal = 1, ///
	UnknownHandle = 2, ///
	ArrayTooSmall = 3, ///
	InvalidDescriptorChar = 4, ///
	NotYetAvailable = 5, ///
	NotAvailableInThisUniverse = 6, ///
	PermanentlyUnavailable = 7, ///
	WrongDriver = 8, ///
	DescriptorTooLong = 9, ///
	Unknown = 10, ///
	NoRoomCalibration = 11, ///
	InvalidArgument = 12, ///
	UnknownDriver = 13, ///
}

///
enum EHiddenAreaMeshType
{
	k_eHiddenAreaMesh_Standard = 0, ///
	k_eHiddenAreaMesh_Inverse = 1, ///
	k_eHiddenAreaMesh_LineLoop = 2, ///
	k_eHiddenAreaMesh_Max = 3, ///
}

/// Identifies what kind of axis is on the controller at index n. Read this type with pVRSystem->Get( nControllerDeviceIndex, Prop_Axis0Type_Int32 + n );
enum EVRControllerAxisType
{
	k_eControllerAxis_None = 0, /// Identifies what kind of axis is on the controller at index n. Read this type with pVRSystem->Get( nControllerDeviceIndex, Prop_Axis0Type_Int32 + n );
	k_eControllerAxis_TrackPad = 1, /// Identifies what kind of axis is on the controller at index n. Read this type with pVRSystem->Get( nControllerDeviceIndex, Prop_Axis0Type_Int32 + n );
	k_eControllerAxis_Joystick = 2, /// Identifies what kind of axis is on the controller at index n. Read this type with pVRSystem->Get( nControllerDeviceIndex, Prop_Axis0Type_Int32 + n );
	k_eControllerAxis_Trigger = 3, /// Identifies what kind of axis is on the controller at index n. Read this type with pVRSystem->Get( nControllerDeviceIndex, Prop_Axis0Type_Int32 + n );
}

/// determines how to provide output to the application of various event processing functions.
enum EVRControllerEventOutputType
{
	ControllerEventOutput_OSEvents = 0, /// determines how to provide output to the application of various event processing functions.
	ControllerEventOutput_VREvents = 1, /// determines how to provide output to the application of various event processing functions.
}

/// Collision Bounds Style
enum ECollisionBoundsStyle
{
	COLLISION_BOUNDS_STYLE_BEGINNER = 0, /// Collision Bounds Style
	COLLISION_BOUNDS_STYLE_INTERMEDIATE = 1, /// Collision Bounds Style
	COLLISION_BOUNDS_STYLE_SQUARES = 2, /// Collision Bounds Style
	COLLISION_BOUNDS_STYLE_ADVANCED = 3, /// Collision Bounds Style
	COLLISION_BOUNDS_STYLE_NONE = 4, /// Collision Bounds Style
	COLLISION_BOUNDS_STYLE_COUNT = 5, /// Collision Bounds Style
}

/// Errors that can occur around VR overlays
enum EVROverlayError
{
	None = 0, /// Errors that can occur around VR overlays
	UnknownOverlay = 10, /// Errors that can occur around VR overlays
	InvalidHandle = 11, /// Errors that can occur around VR overlays
	PermissionDenied = 12, /// Errors that can occur around VR overlays
	OverlayLimitExceeded = 13, /// Errors that can occur around VR overlays
	WrongVisibilityType = 14, /// Errors that can occur around VR overlays
	KeyTooLong = 15, /// Errors that can occur around VR overlays
	NameTooLong = 16, /// Errors that can occur around VR overlays
	KeyInUse = 17, /// Errors that can occur around VR overlays
	WrongTransformType = 18, /// Errors that can occur around VR overlays
	InvalidTrackedDevice = 19, /// Errors that can occur around VR overlays
	InvalidParameter = 20, /// Errors that can occur around VR overlays
	ThumbnailCantBeDestroyed = 21, /// Errors that can occur around VR overlays
	ArrayTooSmall = 22, /// Errors that can occur around VR overlays
	RequestFailed = 23, /// Errors that can occur around VR overlays
	InvalidTexture = 24, /// Errors that can occur around VR overlays
	UnableToLoadFile = 25, /// Errors that can occur around VR overlays
	KeyboardAlreadyInUse = 26, /// Errors that can occur around VR overlays
	NoNeighbor = 27, /// Errors that can occur around VR overlays
	TooManyMaskPrimitives = 29, /// Errors that can occur around VR overlays
	BadMaskPrimitive = 30, /// Errors that can occur around VR overlays
	TextureAlreadyLocked = 31, /// Errors that can occur around VR overlays
	TextureLockCapacityReached = 32, /// Errors that can occur around VR overlays
	TextureNotLocked = 33, /// Errors that can occur around VR overlays
}

/// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
enum EVRApplicationType
{
	VRApplication_Other = 0, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_Scene = 1, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_Overlay = 2, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_Background = 3, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_Utility = 4, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_VRMonitor = 5, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_SteamWatchdog = 6, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_Bootstrapper = 7, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_WebHelper = 8, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
	VRApplication_Max = 9, /// enum values to pass in to VR_Init to identify whether the application will draw a 3D scene.
}

/// error codes for firmware
enum EVRFirmwareError
{
	None = 0, /// error codes for firmware
	Success = 1, /// error codes for firmware
	Fail = 2, /// error codes for firmware
}

/// error codes for notifications
enum EVRNotificationError
{
	OK = 0, /// error codes for notifications
	InvalidNotificationId = 100, /// error codes for notifications
	NotificationQueueFull = 101, /// error codes for notifications
	InvalidOverlayHandle = 102, /// error codes for notifications
	SystemWithUserValueAlreadyExists = 103, /// error codes for notifications
}

///
enum EVRSkeletalMotionRange
{
	WithController = 0, ///
	WithoutController = 1, ///
}

///
enum EVRSkeletalTrackingLevel
{
	VRSkeletalTracking_Estimated = 0, ///
	VRSkeletalTracking_Partial = 1, ///
	VRSkeletalTracking_Full = 2, ///
	Count = 3, ///
	Max = 2, ///
}

/// error codes returned by Vr_Init
/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
enum EVRInitError
{
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	None = 0,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Unknown = 1,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_InstallationNotFound = 100,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_InstallationCorrupt = 101,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_VRClientDLLNotFound = 102,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_FileNotFound = 103,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_FactoryNotFound = 104,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_InterfaceNotFound = 105,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_InvalidInterface = 106,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_UserConfigDirectoryInvalid = 107,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_HmdNotFound = 108,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_NotInitialized = 109,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_PathRegistryNotFound = 110,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_NoConfigPath = 111,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_NoLogPath = 112,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_PathRegistryNotWritable = 113,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_AppInfoInitFailed = 114,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_Retry = 115,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_InitCanceledByUser = 116,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_AnotherAppLaunching = 117,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_SettingsInitFailed = 118,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_ShuttingDown = 119,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_TooManyObjects = 120,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_NoServerForBackgroundApp = 121,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_NotSupportedWithCompositor = 122,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_NotAvailableToUtilityApps = 123,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_Internal = 124,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_HmdDriverIdIsNone = 125,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_HmdNotFoundPresenceFailed = 126,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_VRMonitorNotFound = 127,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_VRMonitorStartupFailed = 128,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_LowPowerWatchdogNotSupported = 129,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_InvalidApplicationType = 130,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_NotAvailableToWatchdogApps = 131,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_WatchdogDisabledInSettings = 132,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_VRDashboardNotFound = 133,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_VRDashboardStartupFailed = 134,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_VRHomeNotFound = 135,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_VRHomeStartupFailed = 136,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_RebootingBusy = 137,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_FirmwareUpdateBusy = 138,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_FirmwareRecoveryBusy = 139,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_USBServiceBusy = 140,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_VRWebHelperStartupFailed = 141,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_TrackerManagerInitFailed = 142,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_AlreadyRunning = 143,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_FailedForVrMonitor = 144,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_PropertyManagerInitFailed = 145,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Init_WebServerFailed = 146,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_Failed = 200,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_Unknown = 201,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_HmdUnknown = 202,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_NotLoaded = 203,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_RuntimeOutOfDate = 204,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_HmdInUse = 205,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_NotCalibrated = 206,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_CalibrationInvalid = 207,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_HmdDisplayNotFound = 208,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_TrackedDeviceInterfaceUnknown = 209,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_HmdDriverIdOutOfBounds = 211,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_HmdDisplayMirrored = 212,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Driver_HmdDisplayNotFoundLaptop = 213,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_ServerInitFailed = 300,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_ConnectFailed = 301,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_SharedStateInitFailed = 302,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_CompositorInitFailed = 303,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_MutexInitFailed = 304,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_Failed = 305,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_CompositorConnectFailed = 306,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_CompositorInvalidConnectResponse = 307,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_ConnectFailedAfterMultipleAttempts = 308,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_ConnectFailedAfterTargetExited = 309,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	IPC_NamespaceUnavailable = 310,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_Failed = 400,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_D3D11HardwareRequired = 401,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FirmwareRequiresUpdate = 402,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_OverlayInitFailed = 403,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_ScreenshotsInitFailed = 404,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_UnableToCreateDevice = 405,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_SharedStateIsNull = 406,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_NotificationManagerIsNull = 407,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_ResourceManagerClientIsNull = 408,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_MessageOverlaySharedStateInitFailure = 409,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_PropertiesInterfaceIsNull = 410,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateFullscreenWindowFailed = 411,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_SettingsInterfaceIsNull = 412,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToShowWindow = 413,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_DistortInterfaceIsNull = 414,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_DisplayFrequencyFailure = 415,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_RendererInitializationFailed = 416,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_DXGIFactoryInterfaceIsNull = 417,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_DXGIFactoryCreateFailed = 418,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_DXGIFactoryQueryFailed = 419,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_InvalidAdapterDesktop = 420,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_InvalidHmdAttachment = 421,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_InvalidOutputDesktop = 422,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_InvalidDeviceProvided = 423,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_D3D11RendererInitializationFailed = 424,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToFindDisplayMode = 425,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToCreateSwapChain = 426,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToGetBackBuffer = 427,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToCreateRenderTarget = 428,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToCreateDXGI2SwapChain = 429,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedtoGetDXGI2BackBuffer = 430,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToCreateDXGI2RenderTarget = 431,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToGetDXGIDeviceInterface = 432,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_SelectDisplayMode = 433,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToCreateNvAPIRenderTargets = 434,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_NvAPISetDisplayMode = 435,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToCreateDirectModeDisplay = 436,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_InvalidHmdPropertyContainer = 437,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_UpdateDisplayFrequency = 438,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateRasterizerState = 439,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateWireframeRasterizerState = 440,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateSamplerState = 441,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateClampToBorderSamplerState = 442,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateAnisoSamplerState = 443,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateOverlaySamplerState = 444,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreatePanoramaSamplerState = 445,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateFontSamplerState = 446,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateNoBlendState = 447,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateBlendState = 448,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateAlphaBlendState = 449,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateBlendStateMaskR = 450,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateBlendStateMaskG = 451,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateBlendStateMaskB = 452,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateDepthStencilState = 453,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateDepthStencilStateNoWrite = 454,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateDepthStencilStateNoDepth = 455,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateFlushTexture = 456,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateDistortionSurfaces = 457,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateConstantBuffer = 458,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateHmdPoseConstantBuffer = 459,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateHmdPoseStagingConstantBuffer = 460,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateSharedFrameInfoConstantBuffer = 461,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateOverlayConstantBuffer = 462,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateSceneTextureIndexConstantBuffer = 463,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateReadableSceneTextureIndexConstantBuffer = 464,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateLayerGraphicsTextureIndexConstantBuffer = 465,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateLayerComputeTextureIndexConstantBuffer = 466,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateLayerComputeSceneTextureIndexConstantBuffer = 467,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateComputeHmdPoseConstantBuffer = 468,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateGeomConstantBuffer = 469,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreatePanelMaskConstantBuffer = 470,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreatePixelSimUBO = 471,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateMSAARenderTextures = 472,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateResolveRenderTextures = 473,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateComputeResolveRenderTextures = 474,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateDriverDirectModeResolveTextures = 475,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_OpenDriverDirectModeResolveTextures = 476,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateFallbackSyncTexture = 477,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_ShareFallbackSyncTexture = 478,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateOverlayIndexBuffer = 479,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateOverlayVertexBuffer = 480,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateTextVertexBuffer = 481,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateTextIndexBuffer = 482,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateMirrorTextures = 483,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateLastFrameRenderTexture = 484,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateMirrorOverlay = 485,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToCreateVirtualDisplayBackbuffer = 486,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_DisplayModeNotSupported = 487,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateOverlayInvalidCall = 488,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_CreateOverlayAlreadyInitialized = 489,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Compositor_FailedToCreateMailbox = 490,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_UnableToConnectToOculusRuntime = 1000,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_WindowsNotInDevMode = 1001,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_CantOpenDevice = 1101,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_UnableToRequestConfigStart = 1102,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_NoStoredConfig = 1103,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_ConfigTooBig = 1104,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_ConfigTooSmall = 1105,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_UnableToInitZLib = 1106,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_CantReadFirmwareVersion = 1107,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_UnableToSendUserDataStart = 1108,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_UnableToGetUserDataStart = 1109,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_UnableToGetUserDataNext = 1110,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_UserDataAddressRange = 1111,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_UserDataError = 1112,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_HmdFound_ConfigFailedSanityCheck = 1113,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	VendorSpecific_OculusRuntimeBadInstall = 1114,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	Steam_SteamInstallationNotFound = 2000,
	/// error codes returned by Vr_Init
	/// Please add adequate error description to https://developer.valvesoftware.com/w/index.php?title=Category:SteamVRHelp
	LastError = 2001,
}

///
enum EVRScreenshotType
{
	None = 0, ///
	Mono = 1, ///
	Stereo = 2, ///
	Cubemap = 3, ///
	MonoPanorama = 4, ///
	StereoPanorama = 5, ///
}

///
enum EVRScreenshotPropertyFilenames
{
	Preview = 0, ///
	VR = 1, ///
}

///
enum EVRTrackedCameraError
{
	None = 0, ///
	OperationFailed = 100, ///
	InvalidHandle = 101, ///
	InvalidFrameHeaderVersion = 102, ///
	OutOfHandles = 103, ///
	IPCFailure = 104, ///
	NotSupportedForThisDevice = 105, ///
	SharedMemoryFailure = 106, ///
	FrameBufferingFailure = 107, ///
	StreamSetupFailure = 108, ///
	InvalidGLTextureId = 109, ///
	InvalidSharedTextureHandle = 110, ///
	FailedToGetGLTextureId = 111, ///
	SharedTextureFailure = 112, ///
	NoFrameAvailable = 113, ///
	InvalidArgument = 114, ///
	InvalidFrameBufferSize = 115, ///
}

///
enum EVRTrackedCameraFrameLayout
{
	EVRTrackedCameraFrameLayout_Mono = 1, ///
	EVRTrackedCameraFrameLayout_Stereo = 2, ///
	EVRTrackedCameraFrameLayout_VerticalLayout = 16, ///
	EVRTrackedCameraFrameLayout_HorizontalLayout = 32, ///
}

///
enum EVRTrackedCameraFrameType
{
	Distorted = 0, ///
	Undistorted = 1, ///
	MaximumUndistorted = 2, ///
	MAX_CAMERA_FRAME_TYPES = 3, ///
}

///
enum EVRDistortionFunctionType
{
	None = 0, ///
	FTheta = 1, ///
	Extended_FTheta = 2, ///
	MAX_DISTORTION_FUNCTION_TYPES = 3, ///
}

///
enum EVSync
{
	None = 0, ///
	WaitRender = 1, ///
	NoWaitRender = 2, ///
}

///
enum EVRMuraCorrectionMode
{
	EVRMuraCorrectionMode_Default = 0, ///
	EVRMuraCorrectionMode_NoCorrection = 1, ///
}

/// raw IMU data provided by IVRIOBuffer from paths to tracked devices with IMUs
enum Imu_OffScaleFlags
{
	OffScale_AccelX = 1, /// raw IMU data provided by IVRIOBuffer from paths to tracked devices with IMUs
	OffScale_AccelY = 2, /// raw IMU data provided by IVRIOBuffer from paths to tracked devices with IMUs
	OffScale_AccelZ = 4, /// raw IMU data provided by IVRIOBuffer from paths to tracked devices with IMUs
	OffScale_GyroX = 8, /// raw IMU data provided by IVRIOBuffer from paths to tracked devices with IMUs
	OffScale_GyroY = 16, /// raw IMU data provided by IVRIOBuffer from paths to tracked devices with IMUs
	OffScale_GyroZ = 32, /// raw IMU data provided by IVRIOBuffer from paths to tracked devices with IMUs
}

/// Used for all errors reported by the IVRApplications interface
enum EVRApplicationError
{
	None = 0, /// Used for all errors reported by the IVRApplications interface
	AppKeyAlreadyExists = 100, /// Used for all errors reported by the IVRApplications interface
	NoManifest = 101, /// Used for all errors reported by the IVRApplications interface
	NoApplication = 102, /// Used for all errors reported by the IVRApplications interface
	InvalidIndex = 103, /// Used for all errors reported by the IVRApplications interface
	UnknownApplication = 104, /// Used for all errors reported by the IVRApplications interface
	IPCFailed = 105, /// Used for all errors reported by the IVRApplications interface
	ApplicationAlreadyRunning = 106, /// Used for all errors reported by the IVRApplications interface
	InvalidManifest = 107, /// Used for all errors reported by the IVRApplications interface
	InvalidApplication = 108, /// Used for all errors reported by the IVRApplications interface
	LaunchFailed = 109, /// Used for all errors reported by the IVRApplications interface
	ApplicationAlreadyStarting = 110, /// Used for all errors reported by the IVRApplications interface
	LaunchInProgress = 111, /// Used for all errors reported by the IVRApplications interface
	OldApplicationQuitting = 112, /// Used for all errors reported by the IVRApplications interface
	TransitionAborted = 113, /// Used for all errors reported by the IVRApplications interface
	IsTemplate = 114, /// Used for all errors reported by the IVRApplications interface
	SteamVRIsExiting = 115, /// Used for all errors reported by the IVRApplications interface
	BufferTooSmall = 200, /// Used for all errors reported by the IVRApplications interface
	PropertyNotSet = 201, /// Used for all errors reported by the IVRApplications interface
	UnknownProperty = 202, /// Used for all errors reported by the IVRApplications interface
	InvalidParameter = 203, /// Used for all errors reported by the IVRApplications interface
}

///
enum EVRApplicationProperty
{
	Name_String = 0, ///
	LaunchType_String = 11, ///
	WorkingDirectory_String = 12, ///
	BinaryPath_String = 13, ///
	Arguments_String = 14, ///
	URL_String = 15, ///
	Description_String = 50, ///
	NewsURL_String = 51, ///
	ImagePath_String = 52, ///
	Source_String = 53, ///
	ActionManifestURL_String = 54, ///
	IsDashboardOverlay_Bool = 60, ///
	IsTemplate_Bool = 61, ///
	IsInstanced_Bool = 62, ///
	IsInternal_Bool = 63, ///
	WantsCompositorPauseInStandby_Bool = 64, ///
	IsHidden_Bool = 65, ///
	LastLaunchTime_Uint64 = 70, ///
}

///
enum EVRSceneApplicationState
{
	EVRSceneApplicationState_None = 0, ///
	EVRSceneApplicationState_Starting = 1, ///
	EVRSceneApplicationState_Quitting = 2, ///
	EVRSceneApplicationState_Running = 3, ///
	EVRSceneApplicationState_Waiting = 4, ///
}

///
enum ChaperoneCalibrationState
{
	OK = 1, ///
	Warning = 100, ///
	Warning_BaseStationMayHaveMoved = 101, ///
	Warning_BaseStationRemoved = 102, ///
	Warning_SeatedBoundsInvalid = 103, ///
	Error = 200, ///
	Error_BaseStationUninitialized = 201, ///
	Error_BaseStationConflict = 202, ///
	Error_PlayAreaInvalid = 203, ///
	Error_CollisionBoundsInvalid = 204, ///
}

///
enum EChaperoneConfigFile
{
	EChaperoneConfigFile_Live = 1, ///
	EChaperoneConfigFile_Temp = 2, ///
}

///
enum EChaperoneImportFlags
{
	EChaperoneImport_BoundsOnly = 1, ///
}

/// Errors that can occur with the VR compositor
enum EVRCompositorError
{
	None = 0, /// Errors that can occur with the VR compositor
	RequestFailed = 1, /// Errors that can occur with the VR compositor
	IncompatibleVersion = 100, /// Errors that can occur with the VR compositor
	DoNotHaveFocus = 101, /// Errors that can occur with the VR compositor
	InvalidTexture = 102, /// Errors that can occur with the VR compositor
	IsNotSceneApplication = 103, /// Errors that can occur with the VR compositor
	TextureIsOnWrongDevice = 104, /// Errors that can occur with the VR compositor
	TextureUsesUnsupportedFormat = 105, /// Errors that can occur with the VR compositor
	SharedTexturesNotSupported = 106, /// Errors that can occur with the VR compositor
	IndexOutOfRange = 107, /// Errors that can occur with the VR compositor
	AlreadySubmitted = 108, /// Errors that can occur with the VR compositor
	InvalidBounds = 109, /// Errors that can occur with the VR compositor
	AlreadySet = 110, /// Errors that can occur with the VR compositor
}

/// Timing mode passed to SetExplicitTimingMode(); see that function for documentation
enum EVRCompositorTimingMode
{
	Implicit = 0, /// Timing mode passed to SetExplicitTimingMode(); see that function for documentation
	Explicit_RuntimePerformsPostPresentHandoff = 1, /// Timing mode passed to SetExplicitTimingMode(); see that function for documentation
	Explicit_ApplicationPerformsPostPresentHandoff = 2, /// Timing mode passed to SetExplicitTimingMode(); see that function for documentation
}

/// Types of input supported by VR Overlays
enum VROverlayInputMethod
{
	None = 0, /// Types of input supported by VR Overlays
	Mouse = 1, /// Types of input supported by VR Overlays
}

/// Allows the caller to figure out which overlay transform getter to call.
enum VROverlayTransformType
{
	VROverlayTransform_Invalid = -1, /// Allows the caller to figure out which overlay transform getter to call.
	VROverlayTransform_Absolute = 0, /// Allows the caller to figure out which overlay transform getter to call.
	VROverlayTransform_TrackedDeviceRelative = 1, /// Allows the caller to figure out which overlay transform getter to call.
	VROverlayTransform_SystemOverlay = 2, /// Allows the caller to figure out which overlay transform getter to call.
	VROverlayTransform_TrackedComponent = 3, /// Allows the caller to figure out which overlay transform getter to call.
	VROverlayTransform_Cursor = 4, /// Allows the caller to figure out which overlay transform getter to call.
	VROverlayTransform_DashboardTab = 5, /// Allows the caller to figure out which overlay transform getter to call.
	VROverlayTransform_DashboardThumb = 6, /// Allows the caller to figure out which overlay transform getter to call.
	VROverlayTransform_Mountable = 7, /// Allows the caller to figure out which overlay transform getter to call.
}

/// Overlay control settings
enum VROverlayFlags
{
	NoDashboardTab = 8, /// Overlay control settings
	SendVRDiscreteScrollEvents = 64, /// Overlay control settings
	SendVRTouchpadEvents = 128, /// Overlay control settings
	ShowTouchPadScrollWheel = 256, /// Overlay control settings
	TransferOwnershipToInternalProcess = 512, /// Overlay control settings
	SideBySide_Parallel = 1024, /// Overlay control settings
	SideBySide_Crossed = 2048, /// Overlay control settings
	Panorama = 4096, /// Overlay control settings
	StereoPanorama = 8192, /// Overlay control settings
	SortWithNonSceneOverlays = 16384, /// Overlay control settings
	VisibleInDashboard = 32768, /// Overlay control settings
	MakeOverlaysInteractiveIfVisible = 65536, /// Overlay control settings
	SendVRSmoothScrollEvents = 131072, /// Overlay control settings
	ProtectedContent = 262144, /// Overlay control settings
	HideLaserIntersection = 524288, /// Overlay control settings
	WantsModalBehavior = 1048576, /// Overlay control settings
	IsPremultiplied = 2097152, /// Overlay control settings
}

///
enum VRMessageOverlayResponse
{
	ButtonPress_0 = 0, ///
	ButtonPress_1 = 1, ///
	ButtonPress_2 = 2, ///
	ButtonPress_3 = 3, ///
	CouldntFindSystemOverlay = 4, ///
	CouldntFindOrCreateClientOverlay = 5, ///
	ApplicationQuit = 6, ///
}

/// Input modes for the Big Picture gamepad text entry
enum EGamepadTextInputMode
{
	k_EGamepadTextInputModeNormal = 0, /// Input modes for the Big Picture gamepad text entry
	k_EGamepadTextInputModePassword = 1, /// Input modes for the Big Picture gamepad text entry
	k_EGamepadTextInputModeSubmit = 2, /// Input modes for the Big Picture gamepad text entry
}

/// Controls number of allowed lines for the Big Picture gamepad text entry
enum EGamepadTextInputLineMode
{
	k_EGamepadTextInputLineModeSingleLine = 0, /// Controls number of allowed lines for the Big Picture gamepad text entry
	k_EGamepadTextInputLineModeMultipleLines = 1, /// Controls number of allowed lines for the Big Picture gamepad text entry
}

///
enum EVROverlayIntersectionMaskPrimitiveType
{
	OverlayIntersectionPrimitiveType_Rectangle = 0, ///
	OverlayIntersectionPrimitiveType_Circle = 1, ///
}

///
enum EKeyboardFlags
{
	KeyboardFlag_Minimal = 1, ///
	KeyboardFlag_Modal = 2, ///
}

///
enum EDeviceType
{
	Invalid = -1, ///
	DirectX11 = 0, ///
	Vulkan = 1, ///
}

///
enum HeadsetViewMode_t
{
	HeadsetViewMode_Left = 0, ///
	HeadsetViewMode_Right = 1, ///
	HeadsetViewMode_Both = 2, ///
}

/// Errors that can occur with the VR compositor
enum EVRRenderModelError
{
	None = 0, /// Errors that can occur with the VR compositor
	Loading = 100, /// Errors that can occur with the VR compositor
	NotSupported = 200, /// Errors that can occur with the VR compositor
	InvalidArg = 300, /// Errors that can occur with the VR compositor
	InvalidModel = 301, /// Errors that can occur with the VR compositor
	NoShapes = 302, /// Errors that can occur with the VR compositor
	MultipleShapes = 303, /// Errors that can occur with the VR compositor
	TooManyVertices = 304, /// Errors that can occur with the VR compositor
	MultipleTextures = 305, /// Errors that can occur with the VR compositor
	BufferTooSmall = 306, /// Errors that can occur with the VR compositor
	NotEnoughNormals = 307, /// Errors that can occur with the VR compositor
	NotEnoughTexCoords = 308, /// Errors that can occur with the VR compositor
	InvalidTexture = 400, /// Errors that can occur with the VR compositor
}

///
enum EVRRenderModelTextureFormat
{
	RGBA8_SRGB = 0, ///
	BC2 = 1, ///
	BC4 = 2, ///
	BC7 = 3, ///
	BC7_SRGB = 4, ///
}

/// Be aware that the notification type is used as 'priority' to pick the next notification
enum EVRNotificationType
{
	EVRNotificationType_Transient = 0, /// Be aware that the notification type is used as 'priority' to pick the next notification
	EVRNotificationType_Persistent = 1, /// Be aware that the notification type is used as 'priority' to pick the next notification
	EVRNotificationType_Transient_SystemWithUserValue = 2, /// Be aware that the notification type is used as 'priority' to pick the next notification
}

///
enum EVRNotificationStyle
{
	EVRNotificationStyle_None = 0, ///
	EVRNotificationStyle_Application = 100, ///
	EVRNotificationStyle_Contact_Disabled = 200, ///
	EVRNotificationStyle_Contact_Enabled = 201, ///
	EVRNotificationStyle_Contact_Active = 202, ///
}

///
enum EVRSettingsError
{
	None = 0, ///
	IPCFailed = 1, ///
	WriteFailed = 2, ///
	ReadFailed = 3, ///
	JsonParseFailed = 4, ///
	UnsetSettingHasNoDefault = 5, ///
}

/// Errors that can occur with the VR compositor
enum EVRScreenshotError
{
	None = 0, /// Errors that can occur with the VR compositor
	RequestFailed = 1, /// Errors that can occur with the VR compositor
	IncompatibleVersion = 100, /// Errors that can occur with the VR compositor
	NotFound = 101, /// Errors that can occur with the VR compositor
	BufferTooSmall = 102, /// Errors that can occur with the VR compositor
	ScreenshotAlreadyInProgress = 108, /// Errors that can occur with the VR compositor
}

///
enum EVRSkeletalTransformSpace
{
	Model = 0, ///
	Parent = 1, ///
}

///
enum EVRSkeletalReferencePose
{
	BindPose = 0, ///
	OpenHand = 1, ///
	Fist = 2, ///
	GripLimit = 3, ///
}

///
enum EVRFinger
{
	Thumb = 0, ///
	Index = 1, ///
	Middle = 2, ///
	Ring = 3, ///
	Pinky = 4, ///
	Count = 5, ///
}

///
enum EVRFingerSplay
{
	Thumb_Index = 0, ///
	Index_Middle = 1, ///
	Middle_Ring = 2, ///
	Ring_Pinky = 3, ///
	Count = 4, ///
}

///
enum EVRSummaryType
{
	FromAnimation = 0, ///
	FromDevice = 1, ///
}

///
enum EVRInputFilterCancelType
{
	VRInputFilterCancel_Timers = 0, ///
	VRInputFilterCancel_Momentum = 1, ///
}

///
enum EVRInputStringBits
{
	VRInputString_Hand = 1, ///
	VRInputString_ControllerType = 2, ///
	VRInputString_InputSource = 4, ///
	VRInputString_All = -1, ///
}

///
enum EIOBufferError
{
	IOBuffer_Success = 0, ///
	IOBuffer_OperationFailed = 100, ///
	IOBuffer_InvalidHandle = 101, ///
	IOBuffer_InvalidArgument = 102, ///
	IOBuffer_PathExists = 103, ///
	IOBuffer_PathDoesNotExist = 104, ///
	IOBuffer_Permission = 105, ///
}

///
enum EIOBufferMode
{
	Read = 1, ///
	Write = 2, ///
	Create = 512, ///
}

///
enum EVRDebugError
{
	Success = 0, ///
	BadParameter = 1, ///
}

enum uint k_nDriverNone = 4294967295; ///
enum uint k_unMaxDriverDebugResponseSize = 32768; ///
enum uint k_unTrackedDeviceIndex_Hmd = 0; ///
enum uint k_unMaxTrackedDeviceCount = 64; ///
enum uint k_unTrackedDeviceIndexOther = 4294967294; ///
enum uint k_unTrackedDeviceIndexInvalid = 4294967295; ///
enum PropertyContainerHandle_t k_ulInvalidPropertyContainer = 0; ///
enum PropertyTypeTag_t k_unInvalidPropertyTag = 0; ///
enum PropertyContainerHandle_t k_ulInvalidDriverHandle = 0; ///
enum PropertyTypeTag_t k_unFloatPropertyTag = 1; ///
enum PropertyTypeTag_t k_unInt32PropertyTag = 2; ///
enum PropertyTypeTag_t k_unUint64PropertyTag = 3; ///
enum PropertyTypeTag_t k_unBoolPropertyTag = 4; ///
enum PropertyTypeTag_t k_unStringPropertyTag = 5; ///
enum PropertyTypeTag_t k_unErrorPropertyTag = 6; ///
enum PropertyTypeTag_t k_unDoublePropertyTag = 7; ///
enum PropertyTypeTag_t k_unHmdMatrix34PropertyTag = 20; ///
enum PropertyTypeTag_t k_unHmdMatrix44PropertyTag = 21; ///
enum PropertyTypeTag_t k_unHmdVector3PropertyTag = 22; ///
enum PropertyTypeTag_t k_unHmdVector4PropertyTag = 23; ///
enum PropertyTypeTag_t k_unHmdVector2PropertyTag = 24; ///
enum PropertyTypeTag_t k_unHmdQuadPropertyTag = 25; ///
enum PropertyTypeTag_t k_unHiddenAreaPropertyTag = 30; ///
enum PropertyTypeTag_t k_unPathHandleInfoTag = 31; ///
enum PropertyTypeTag_t k_unActionPropertyTag = 32; ///
enum PropertyTypeTag_t k_unInputValuePropertyTag = 33; ///
enum PropertyTypeTag_t k_unWildcardPropertyTag = 34; ///
enum PropertyTypeTag_t k_unHapticVibrationPropertyTag = 35; ///
enum PropertyTypeTag_t k_unSkeletonPropertyTag = 36; ///
enum PropertyTypeTag_t k_unSpatialAnchorPosePropertyTag = 40; ///
enum PropertyTypeTag_t k_unJsonPropertyTag = 41; ///
enum PropertyTypeTag_t k_unActiveActionSetPropertyTag = 42; ///
enum PropertyTypeTag_t k_unOpenVRInternalReserved_Start = 1000; ///
enum PropertyTypeTag_t k_unOpenVRInternalReserved_End = 10000; ///
enum uint k_unMaxPropertyStringSize = 32768; /// No string property will ever be longer than this length
enum VRActionHandle_t k_ulInvalidActionHandle = 0; ///
enum VRActionSetHandle_t k_ulInvalidActionSetHandle = 0; ///
enum VRInputValueHandle_t k_ulInvalidInputValueHandle = 0; ///
enum uint k_unControllerStateAxisCount = 5; /// the number of axes in the controller state
enum VROverlayHandle_t k_ulOverlayHandleInvalid = 0; ///
enum uint k_unMaxDistortionFunctionParameters = 8; ///
enum uint k_unScreenshotHandleInvalid = 0; ///
enum IVRSystem_Version_s = "IVRSystem_021"; ///
enum const(char)* IVRSystem_Version = IVRSystem_Version_s.ptr; ///
enum IVRExtendedDisplay_Version_s = "IVRExtendedDisplay_001"; ///
enum const(char)* IVRExtendedDisplay_Version = IVRExtendedDisplay_Version_s.ptr; ///
enum IVRTrackedCamera_Version_s = "IVRTrackedCamera_006"; ///
enum const(char)* IVRTrackedCamera_Version = IVRTrackedCamera_Version_s.ptr; ///
enum uint k_unMaxApplicationKeyLength = 128; /// The maximum length of an application key
enum k_pch_MimeType_HomeApp_s = "vr/home"; /// Currently recognized mime types
enum const(char)* k_pch_MimeType_HomeApp = k_pch_MimeType_HomeApp_s.ptr; /// Currently recognized mime types
enum k_pch_MimeType_GameTheater_s = "vr/game_theater"; ///
enum const(char)* k_pch_MimeType_GameTheater = k_pch_MimeType_GameTheater_s.ptr; ///
enum IVRApplications_Version_s = "IVRApplications_007"; ///
enum const(char)* IVRApplications_Version = IVRApplications_Version_s.ptr; ///
enum IVRChaperone_Version_s = "IVRChaperone_003"; ///
enum const(char)* IVRChaperone_Version = IVRChaperone_Version_s.ptr; ///
enum IVRChaperoneSetup_Version_s = "IVRChaperoneSetup_006"; ///
enum const(char)* IVRChaperoneSetup_Version = IVRChaperoneSetup_Version_s.ptr; ///
enum IVRCompositor_Version_s = "IVRCompositor_026"; ///
enum const(char)* IVRCompositor_Version = IVRCompositor_Version_s.ptr; ///
enum uint k_unVROverlayMaxKeyLength = 128; /// The maximum length of an overlay key in bytes, counting the terminating null character.
enum uint k_unVROverlayMaxNameLength = 128; /// The maximum length of an overlay name in bytes, counting the terminating null character.
enum uint k_unMaxOverlayCount = 128; /// The maximum number of overlays that can exist in the system at one time.
enum uint k_unMaxOverlayIntersectionMaskPrimitivesCount = 32; /// The maximum number of overlay intersection mask primitives per overlay
enum IVROverlay_Version_s = "IVROverlay_024"; ///
enum const(char)* IVROverlay_Version = IVROverlay_Version_s.ptr; ///
enum IVROverlayView_Version_s = "IVROverlayView_003"; ///
enum const(char)* IVROverlayView_Version = IVROverlayView_Version_s.ptr; ///
enum uint k_unHeadsetViewMaxWidth = 3840; ///
enum uint k_unHeadsetViewMaxHeight = 2160; ///
enum k_pchHeadsetViewOverlayKey_s = "system.HeadsetView"; ///
enum const(char)* k_pchHeadsetViewOverlayKey = k_pchHeadsetViewOverlayKey_s.ptr; ///
enum IVRHeadsetView_Version_s = "IVRHeadsetView_001"; ///
enum const(char)* IVRHeadsetView_Version = IVRHeadsetView_Version_s.ptr; ///
enum k_pch_Controller_Component_GDC2015_s = "gdc2015"; /// Canonical coordinate system of the gdc 2015 wired controller, provided for backwards compatibility
enum const(char)* k_pch_Controller_Component_GDC2015 = k_pch_Controller_Component_GDC2015_s.ptr; /// Canonical coordinate system of the gdc 2015 wired controller, provided for backwards compatibility
enum k_pch_Controller_Component_Base_s = "base"; /// For controllers with an unambiguous 'base'.
enum const(char)* k_pch_Controller_Component_Base = k_pch_Controller_Component_Base_s.ptr; /// For controllers with an unambiguous 'base'.
enum k_pch_Controller_Component_Tip_s = "tip"; /// For controllers with an unambiguous 'tip' (used for 'laser-pointing')
enum const(char)* k_pch_Controller_Component_Tip = k_pch_Controller_Component_Tip_s.ptr; /// For controllers with an unambiguous 'tip' (used for 'laser-pointing')
enum k_pch_Controller_Component_HandGrip_s = "handgrip"; /// Neutral, ambidextrous hand-pose when holding controller. On plane between neutrally posed index finger and thumb
enum const(char)* k_pch_Controller_Component_HandGrip = k_pch_Controller_Component_HandGrip_s.ptr; /// Neutral, ambidextrous hand-pose when holding controller. On plane between neutrally posed index finger and thumb
enum k_pch_Controller_Component_Status_s = "status"; /// 1:1 aspect ratio status area, with canonical [0,1] uv mapping
enum const(char)* k_pch_Controller_Component_Status = k_pch_Controller_Component_Status_s.ptr; /// 1:1 aspect ratio status area, with canonical [0,1] uv mapping
enum IVRRenderModels_Version_s = "IVRRenderModels_006"; ///
enum const(char)* IVRRenderModels_Version = IVRRenderModels_Version_s.ptr; ///
enum uint k_unNotificationTextMaxSize = 256; ///
enum IVRNotifications_Version_s = "IVRNotifications_002"; ///
enum const(char)* IVRNotifications_Version = IVRNotifications_Version_s.ptr; ///
enum uint k_unMaxSettingsKeyLength = 128; /// The maximum length of a settings key
enum IVRSettings_Version_s = "IVRSettings_003"; ///
enum const(char)* IVRSettings_Version = IVRSettings_Version_s.ptr; ///
enum k_pch_SteamVR_Section_s = "steamvr"; ///
enum const(char)* k_pch_SteamVR_Section = k_pch_SteamVR_Section_s.ptr; ///
enum k_pch_SteamVR_RequireHmd_String_s = "requireHmd"; ///
enum const(char)* k_pch_SteamVR_RequireHmd_String = k_pch_SteamVR_RequireHmd_String_s.ptr; ///
enum k_pch_SteamVR_ForcedDriverKey_String_s = "forcedDriver"; ///
enum const(char)* k_pch_SteamVR_ForcedDriverKey_String = k_pch_SteamVR_ForcedDriverKey_String_s.ptr; ///
enum k_pch_SteamVR_ForcedHmdKey_String_s = "forcedHmd"; ///
enum const(char)* k_pch_SteamVR_ForcedHmdKey_String = k_pch_SteamVR_ForcedHmdKey_String_s.ptr; ///
enum k_pch_SteamVR_DisplayDebug_Bool_s = "displayDebug"; ///
enum const(char)* k_pch_SteamVR_DisplayDebug_Bool = k_pch_SteamVR_DisplayDebug_Bool_s.ptr; ///
enum k_pch_SteamVR_DebugProcessPipe_String_s = "debugProcessPipe"; ///
enum const(char)* k_pch_SteamVR_DebugProcessPipe_String = k_pch_SteamVR_DebugProcessPipe_String_s.ptr; ///
enum k_pch_SteamVR_DisplayDebugX_Int32_s = "displayDebugX"; ///
enum const(char)* k_pch_SteamVR_DisplayDebugX_Int32 = k_pch_SteamVR_DisplayDebugX_Int32_s.ptr; ///
enum k_pch_SteamVR_DisplayDebugY_Int32_s = "displayDebugY"; ///
enum const(char)* k_pch_SteamVR_DisplayDebugY_Int32 = k_pch_SteamVR_DisplayDebugY_Int32_s.ptr; ///
enum k_pch_SteamVR_SendSystemButtonToAllApps_Bool_s = "sendSystemButtonToAllApps"; ///
enum const(char)* k_pch_SteamVR_SendSystemButtonToAllApps_Bool = k_pch_SteamVR_SendSystemButtonToAllApps_Bool_s.ptr; ///
enum k_pch_SteamVR_LogLevel_Int32_s = "loglevel"; ///
enum const(char)* k_pch_SteamVR_LogLevel_Int32 = k_pch_SteamVR_LogLevel_Int32_s.ptr; ///
enum k_pch_SteamVR_IPD_Float_s = "ipd"; ///
enum const(char)* k_pch_SteamVR_IPD_Float = k_pch_SteamVR_IPD_Float_s.ptr; ///
enum k_pch_SteamVR_Background_String_s = "background"; ///
enum const(char)* k_pch_SteamVR_Background_String = k_pch_SteamVR_Background_String_s.ptr; ///
enum k_pch_SteamVR_BackgroundUseDomeProjection_Bool_s = "backgroundUseDomeProjection"; ///
enum const(char)* k_pch_SteamVR_BackgroundUseDomeProjection_Bool = k_pch_SteamVR_BackgroundUseDomeProjection_Bool_s.ptr; ///
enum k_pch_SteamVR_BackgroundCameraHeight_Float_s = "backgroundCameraHeight"; ///
enum const(char)* k_pch_SteamVR_BackgroundCameraHeight_Float = k_pch_SteamVR_BackgroundCameraHeight_Float_s.ptr; ///
enum k_pch_SteamVR_BackgroundDomeRadius_Float_s = "backgroundDomeRadius"; ///
enum const(char)* k_pch_SteamVR_BackgroundDomeRadius_Float = k_pch_SteamVR_BackgroundDomeRadius_Float_s.ptr; ///
enum k_pch_SteamVR_GridColor_String_s = "gridColor"; ///
enum const(char)* k_pch_SteamVR_GridColor_String = k_pch_SteamVR_GridColor_String_s.ptr; ///
enum k_pch_SteamVR_PlayAreaColor_String_s = "playAreaColor"; ///
enum const(char)* k_pch_SteamVR_PlayAreaColor_String = k_pch_SteamVR_PlayAreaColor_String_s.ptr; ///
enum k_pch_SteamVR_TrackingLossColor_String_s = "trackingLossColor"; ///
enum const(char)* k_pch_SteamVR_TrackingLossColor_String = k_pch_SteamVR_TrackingLossColor_String_s.ptr; ///
enum k_pch_SteamVR_ShowStage_Bool_s = "showStage"; ///
enum const(char)* k_pch_SteamVR_ShowStage_Bool = k_pch_SteamVR_ShowStage_Bool_s.ptr; ///
enum k_pch_SteamVR_ActivateMultipleDrivers_Bool_s = "activateMultipleDrivers"; ///
enum const(char)* k_pch_SteamVR_ActivateMultipleDrivers_Bool = k_pch_SteamVR_ActivateMultipleDrivers_Bool_s.ptr; ///
enum k_pch_SteamVR_UsingSpeakers_Bool_s = "usingSpeakers"; ///
enum const(char)* k_pch_SteamVR_UsingSpeakers_Bool = k_pch_SteamVR_UsingSpeakers_Bool_s.ptr; ///
enum k_pch_SteamVR_SpeakersForwardYawOffsetDegrees_Float_s = "speakersForwardYawOffsetDegrees"; ///
enum const(char)* k_pch_SteamVR_SpeakersForwardYawOffsetDegrees_Float = k_pch_SteamVR_SpeakersForwardYawOffsetDegrees_Float_s.ptr; ///
enum k_pch_SteamVR_BaseStationPowerManagement_Int32_s = "basestationPowerManagement"; ///
enum const(char)* k_pch_SteamVR_BaseStationPowerManagement_Int32 = k_pch_SteamVR_BaseStationPowerManagement_Int32_s.ptr; ///
enum k_pch_SteamVR_ShowBaseStationPowerManagementTip_Int32_s = "ShowBaseStationPowerManagementTip"; ///
enum const(char)* k_pch_SteamVR_ShowBaseStationPowerManagementTip_Int32 = k_pch_SteamVR_ShowBaseStationPowerManagementTip_Int32_s.ptr; ///
enum k_pch_SteamVR_NeverKillProcesses_Bool_s = "neverKillProcesses"; ///
enum const(char)* k_pch_SteamVR_NeverKillProcesses_Bool = k_pch_SteamVR_NeverKillProcesses_Bool_s.ptr; ///
enum k_pch_SteamVR_SupersampleScale_Float_s = "supersampleScale"; ///
enum const(char)* k_pch_SteamVR_SupersampleScale_Float = k_pch_SteamVR_SupersampleScale_Float_s.ptr; ///
enum k_pch_SteamVR_MaxRecommendedResolution_Int32_s = "maxRecommendedResolution"; ///
enum const(char)* k_pch_SteamVR_MaxRecommendedResolution_Int32 = k_pch_SteamVR_MaxRecommendedResolution_Int32_s.ptr; ///
enum k_pch_SteamVR_MotionSmoothing_Bool_s = "motionSmoothing"; ///
enum const(char)* k_pch_SteamVR_MotionSmoothing_Bool = k_pch_SteamVR_MotionSmoothing_Bool_s.ptr; ///
enum k_pch_SteamVR_MotionSmoothingOverride_Int32_s = "motionSmoothingOverride"; ///
enum const(char)* k_pch_SteamVR_MotionSmoothingOverride_Int32 = k_pch_SteamVR_MotionSmoothingOverride_Int32_s.ptr; ///
enum k_pch_SteamVR_DisableAsyncReprojection_Bool_s = "disableAsync"; ///
enum const(char)* k_pch_SteamVR_DisableAsyncReprojection_Bool = k_pch_SteamVR_DisableAsyncReprojection_Bool_s.ptr; ///
enum k_pch_SteamVR_ForceFadeOnBadTracking_Bool_s = "forceFadeOnBadTracking"; ///
enum const(char)* k_pch_SteamVR_ForceFadeOnBadTracking_Bool = k_pch_SteamVR_ForceFadeOnBadTracking_Bool_s.ptr; ///
enum k_pch_SteamVR_DefaultMirrorView_Int32_s = "mirrorView"; ///
enum const(char)* k_pch_SteamVR_DefaultMirrorView_Int32 = k_pch_SteamVR_DefaultMirrorView_Int32_s.ptr; ///
enum k_pch_SteamVR_ShowLegacyMirrorView_Bool_s = "showLegacyMirrorView"; ///
enum const(char)* k_pch_SteamVR_ShowLegacyMirrorView_Bool = k_pch_SteamVR_ShowLegacyMirrorView_Bool_s.ptr; ///
enum k_pch_SteamVR_MirrorViewVisibility_Bool_s = "showMirrorView"; ///
enum const(char)* k_pch_SteamVR_MirrorViewVisibility_Bool = k_pch_SteamVR_MirrorViewVisibility_Bool_s.ptr; ///
enum k_pch_SteamVR_MirrorViewDisplayMode_Int32_s = "mirrorViewDisplayMode"; ///
enum const(char)* k_pch_SteamVR_MirrorViewDisplayMode_Int32 = k_pch_SteamVR_MirrorViewDisplayMode_Int32_s.ptr; ///
enum k_pch_SteamVR_MirrorViewEye_Int32_s = "mirrorViewEye"; ///
enum const(char)* k_pch_SteamVR_MirrorViewEye_Int32 = k_pch_SteamVR_MirrorViewEye_Int32_s.ptr; ///
enum k_pch_SteamVR_MirrorViewGeometry_String_s = "mirrorViewGeometry"; ///
enum const(char)* k_pch_SteamVR_MirrorViewGeometry_String = k_pch_SteamVR_MirrorViewGeometry_String_s.ptr; ///
enum k_pch_SteamVR_MirrorViewGeometryMaximized_String_s = "mirrorViewGeometryMaximized"; ///
enum const(char)* k_pch_SteamVR_MirrorViewGeometryMaximized_String = k_pch_SteamVR_MirrorViewGeometryMaximized_String_s.ptr; ///
enum k_pch_SteamVR_PerfGraphVisibility_Bool_s = "showPerfGraph"; ///
enum const(char)* k_pch_SteamVR_PerfGraphVisibility_Bool = k_pch_SteamVR_PerfGraphVisibility_Bool_s.ptr; ///
enum k_pch_SteamVR_StartMonitorFromAppLaunch_s = "startMonitorFromAppLaunch"; ///
enum const(char)* k_pch_SteamVR_StartMonitorFromAppLaunch = k_pch_SteamVR_StartMonitorFromAppLaunch_s.ptr; ///
enum k_pch_SteamVR_StartCompositorFromAppLaunch_Bool_s = "startCompositorFromAppLaunch"; ///
enum const(char)* k_pch_SteamVR_StartCompositorFromAppLaunch_Bool = k_pch_SteamVR_StartCompositorFromAppLaunch_Bool_s.ptr; ///
enum k_pch_SteamVR_StartDashboardFromAppLaunch_Bool_s = "startDashboardFromAppLaunch"; ///
enum const(char)* k_pch_SteamVR_StartDashboardFromAppLaunch_Bool = k_pch_SteamVR_StartDashboardFromAppLaunch_Bool_s.ptr; ///
enum k_pch_SteamVR_StartOverlayAppsFromDashboard_Bool_s = "startOverlayAppsFromDashboard"; ///
enum const(char)* k_pch_SteamVR_StartOverlayAppsFromDashboard_Bool = k_pch_SteamVR_StartOverlayAppsFromDashboard_Bool_s.ptr; ///
enum k_pch_SteamVR_EnableHomeApp_s = "enableHomeApp"; ///
enum const(char)* k_pch_SteamVR_EnableHomeApp = k_pch_SteamVR_EnableHomeApp_s.ptr; ///
enum k_pch_SteamVR_CycleBackgroundImageTimeSec_Int32_s = "CycleBackgroundImageTimeSec"; ///
enum const(char)* k_pch_SteamVR_CycleBackgroundImageTimeSec_Int32 = k_pch_SteamVR_CycleBackgroundImageTimeSec_Int32_s.ptr; ///
enum k_pch_SteamVR_RetailDemo_Bool_s = "retailDemo"; ///
enum const(char)* k_pch_SteamVR_RetailDemo_Bool = k_pch_SteamVR_RetailDemo_Bool_s.ptr; ///
enum k_pch_SteamVR_IpdOffset_Float_s = "ipdOffset"; ///
enum const(char)* k_pch_SteamVR_IpdOffset_Float = k_pch_SteamVR_IpdOffset_Float_s.ptr; ///
enum k_pch_SteamVR_AllowSupersampleFiltering_Bool_s = "allowSupersampleFiltering"; ///
enum const(char)* k_pch_SteamVR_AllowSupersampleFiltering_Bool = k_pch_SteamVR_AllowSupersampleFiltering_Bool_s.ptr; ///
enum k_pch_SteamVR_SupersampleManualOverride_Bool_s = "supersampleManualOverride"; ///
enum const(char)* k_pch_SteamVR_SupersampleManualOverride_Bool = k_pch_SteamVR_SupersampleManualOverride_Bool_s.ptr; ///
enum k_pch_SteamVR_EnableLinuxVulkanAsync_Bool_s = "enableLinuxVulkanAsync"; ///
enum const(char)* k_pch_SteamVR_EnableLinuxVulkanAsync_Bool = k_pch_SteamVR_EnableLinuxVulkanAsync_Bool_s.ptr; ///
enum k_pch_SteamVR_AllowDisplayLockedMode_Bool_s = "allowDisplayLockedMode"; ///
enum const(char)* k_pch_SteamVR_AllowDisplayLockedMode_Bool = k_pch_SteamVR_AllowDisplayLockedMode_Bool_s.ptr; ///
enum k_pch_SteamVR_HaveStartedTutorialForNativeChaperoneDriver_Bool_s = "haveStartedTutorialForNativeChaperoneDriver"; ///
enum const(char)* k_pch_SteamVR_HaveStartedTutorialForNativeChaperoneDriver_Bool = k_pch_SteamVR_HaveStartedTutorialForNativeChaperoneDriver_Bool_s.ptr; ///
enum k_pch_SteamVR_ForceWindows32bitVRMonitor_s = "forceWindows32BitVRMonitor"; ///
enum const(char)* k_pch_SteamVR_ForceWindows32bitVRMonitor = k_pch_SteamVR_ForceWindows32bitVRMonitor_s.ptr; ///
enum k_pch_SteamVR_DebugInputBinding_s = "debugInputBinding"; ///
enum const(char)* k_pch_SteamVR_DebugInputBinding = k_pch_SteamVR_DebugInputBinding_s.ptr; ///
enum k_pch_SteamVR_DoNotFadeToGrid_s = "doNotFadeToGrid"; ///
enum const(char)* k_pch_SteamVR_DoNotFadeToGrid = k_pch_SteamVR_DoNotFadeToGrid_s.ptr; ///
enum k_pch_SteamVR_RenderCameraMode_s = "renderCameraMode"; ///
enum const(char)* k_pch_SteamVR_RenderCameraMode = k_pch_SteamVR_RenderCameraMode_s.ptr; ///
enum k_pch_SteamVR_EnableSharedResourceJournaling_s = "enableSharedResourceJournaling"; ///
enum const(char)* k_pch_SteamVR_EnableSharedResourceJournaling = k_pch_SteamVR_EnableSharedResourceJournaling_s.ptr; ///
enum k_pch_SteamVR_EnableSafeMode_s = "enableSafeMode"; ///
enum const(char)* k_pch_SteamVR_EnableSafeMode = k_pch_SteamVR_EnableSafeMode_s.ptr; ///
enum k_pch_SteamVR_PreferredRefreshRate_s = "preferredRefreshRate"; ///
enum const(char)* k_pch_SteamVR_PreferredRefreshRate = k_pch_SteamVR_PreferredRefreshRate_s.ptr; ///
enum k_pch_SteamVR_LastVersionNotice_s = "lastVersionNotice"; ///
enum const(char)* k_pch_SteamVR_LastVersionNotice = k_pch_SteamVR_LastVersionNotice_s.ptr; ///
enum k_pch_SteamVR_LastVersionNoticeDate_s = "lastVersionNoticeDate"; ///
enum const(char)* k_pch_SteamVR_LastVersionNoticeDate = k_pch_SteamVR_LastVersionNoticeDate_s.ptr; ///
enum k_pch_SteamVR_HmdDisplayColorGainR_Float_s = "hmdDisplayColorGainR"; ///
enum const(char)* k_pch_SteamVR_HmdDisplayColorGainR_Float = k_pch_SteamVR_HmdDisplayColorGainR_Float_s.ptr; ///
enum k_pch_SteamVR_HmdDisplayColorGainG_Float_s = "hmdDisplayColorGainG"; ///
enum const(char)* k_pch_SteamVR_HmdDisplayColorGainG_Float = k_pch_SteamVR_HmdDisplayColorGainG_Float_s.ptr; ///
enum k_pch_SteamVR_HmdDisplayColorGainB_Float_s = "hmdDisplayColorGainB"; ///
enum const(char)* k_pch_SteamVR_HmdDisplayColorGainB_Float = k_pch_SteamVR_HmdDisplayColorGainB_Float_s.ptr; ///
enum k_pch_SteamVR_CustomIconStyle_String_s = "customIconStyle"; ///
enum const(char)* k_pch_SteamVR_CustomIconStyle_String = k_pch_SteamVR_CustomIconStyle_String_s.ptr; ///
enum k_pch_SteamVR_CustomOffIconStyle_String_s = "customOffIconStyle"; ///
enum const(char)* k_pch_SteamVR_CustomOffIconStyle_String = k_pch_SteamVR_CustomOffIconStyle_String_s.ptr; ///
enum k_pch_SteamVR_CustomIconForceUpdate_String_s = "customIconForceUpdate"; ///
enum const(char)* k_pch_SteamVR_CustomIconForceUpdate_String = k_pch_SteamVR_CustomIconForceUpdate_String_s.ptr; ///
enum k_pch_SteamVR_AllowGlobalActionSetPriority_s = "globalActionSetPriority"; ///
enum const(char)* k_pch_SteamVR_AllowGlobalActionSetPriority = k_pch_SteamVR_AllowGlobalActionSetPriority_s.ptr; ///
enum k_pch_SteamVR_OverlayRenderQuality_s = "overlayRenderQuality_2"; ///
enum const(char)* k_pch_SteamVR_OverlayRenderQuality = k_pch_SteamVR_OverlayRenderQuality_s.ptr; ///
enum k_pch_DirectMode_Section_s = "direct_mode"; ///
enum const(char)* k_pch_DirectMode_Section = k_pch_DirectMode_Section_s.ptr; ///
enum k_pch_DirectMode_Enable_Bool_s = "enable"; ///
enum const(char)* k_pch_DirectMode_Enable_Bool = k_pch_DirectMode_Enable_Bool_s.ptr; ///
enum k_pch_DirectMode_Count_Int32_s = "count"; ///
enum const(char)* k_pch_DirectMode_Count_Int32 = k_pch_DirectMode_Count_Int32_s.ptr; ///
enum k_pch_DirectMode_EdidVid_Int32_s = "edidVid"; ///
enum const(char)* k_pch_DirectMode_EdidVid_Int32 = k_pch_DirectMode_EdidVid_Int32_s.ptr; ///
enum k_pch_DirectMode_EdidPid_Int32_s = "edidPid"; ///
enum const(char)* k_pch_DirectMode_EdidPid_Int32 = k_pch_DirectMode_EdidPid_Int32_s.ptr; ///
enum k_pch_Lighthouse_Section_s = "driver_lighthouse"; ///
enum const(char)* k_pch_Lighthouse_Section = k_pch_Lighthouse_Section_s.ptr; ///
enum k_pch_Lighthouse_DisableIMU_Bool_s = "disableimu"; ///
enum const(char)* k_pch_Lighthouse_DisableIMU_Bool = k_pch_Lighthouse_DisableIMU_Bool_s.ptr; ///
enum k_pch_Lighthouse_DisableIMUExceptHMD_Bool_s = "disableimuexcepthmd"; ///
enum const(char)* k_pch_Lighthouse_DisableIMUExceptHMD_Bool = k_pch_Lighthouse_DisableIMUExceptHMD_Bool_s.ptr; ///
enum k_pch_Lighthouse_UseDisambiguation_String_s = "usedisambiguation"; ///
enum const(char)* k_pch_Lighthouse_UseDisambiguation_String = k_pch_Lighthouse_UseDisambiguation_String_s.ptr; ///
enum k_pch_Lighthouse_DisambiguationDebug_Int32_s = "disambiguationdebug"; ///
enum const(char)* k_pch_Lighthouse_DisambiguationDebug_Int32 = k_pch_Lighthouse_DisambiguationDebug_Int32_s.ptr; ///
enum k_pch_Lighthouse_PrimaryBasestation_Int32_s = "primarybasestation"; ///
enum const(char)* k_pch_Lighthouse_PrimaryBasestation_Int32 = k_pch_Lighthouse_PrimaryBasestation_Int32_s.ptr; ///
enum k_pch_Lighthouse_DBHistory_Bool_s = "dbhistory"; ///
enum const(char)* k_pch_Lighthouse_DBHistory_Bool = k_pch_Lighthouse_DBHistory_Bool_s.ptr; ///
enum k_pch_Lighthouse_EnableBluetooth_Bool_s = "enableBluetooth"; ///
enum const(char)* k_pch_Lighthouse_EnableBluetooth_Bool = k_pch_Lighthouse_EnableBluetooth_Bool_s.ptr; ///
enum k_pch_Lighthouse_PowerManagedBaseStations_String_s = "PowerManagedBaseStations"; ///
enum const(char)* k_pch_Lighthouse_PowerManagedBaseStations_String = k_pch_Lighthouse_PowerManagedBaseStations_String_s.ptr; ///
enum k_pch_Lighthouse_PowerManagedBaseStations2_String_s = "PowerManagedBaseStations2"; ///
enum const(char)* k_pch_Lighthouse_PowerManagedBaseStations2_String = k_pch_Lighthouse_PowerManagedBaseStations2_String_s.ptr; ///
enum k_pch_Lighthouse_InactivityTimeoutForBaseStations_Int32_s = "InactivityTimeoutForBaseStations"; ///
enum const(char)* k_pch_Lighthouse_InactivityTimeoutForBaseStations_Int32 = k_pch_Lighthouse_InactivityTimeoutForBaseStations_Int32_s.ptr; ///
enum k_pch_Lighthouse_EnableImuFallback_Bool_s = "enableImuFallback"; ///
enum const(char)* k_pch_Lighthouse_EnableImuFallback_Bool = k_pch_Lighthouse_EnableImuFallback_Bool_s.ptr; ///
enum k_pch_Null_Section_s = "driver_null"; ///
enum const(char)* k_pch_Null_Section = k_pch_Null_Section_s.ptr; ///
enum k_pch_Null_SerialNumber_String_s = "serialNumber"; ///
enum const(char)* k_pch_Null_SerialNumber_String = k_pch_Null_SerialNumber_String_s.ptr; ///
enum k_pch_Null_ModelNumber_String_s = "modelNumber"; ///
enum const(char)* k_pch_Null_ModelNumber_String = k_pch_Null_ModelNumber_String_s.ptr; ///
enum k_pch_Null_WindowX_Int32_s = "windowX"; ///
enum const(char)* k_pch_Null_WindowX_Int32 = k_pch_Null_WindowX_Int32_s.ptr; ///
enum k_pch_Null_WindowY_Int32_s = "windowY"; ///
enum const(char)* k_pch_Null_WindowY_Int32 = k_pch_Null_WindowY_Int32_s.ptr; ///
enum k_pch_Null_WindowWidth_Int32_s = "windowWidth"; ///
enum const(char)* k_pch_Null_WindowWidth_Int32 = k_pch_Null_WindowWidth_Int32_s.ptr; ///
enum k_pch_Null_WindowHeight_Int32_s = "windowHeight"; ///
enum const(char)* k_pch_Null_WindowHeight_Int32 = k_pch_Null_WindowHeight_Int32_s.ptr; ///
enum k_pch_Null_RenderWidth_Int32_s = "renderWidth"; ///
enum const(char)* k_pch_Null_RenderWidth_Int32 = k_pch_Null_RenderWidth_Int32_s.ptr; ///
enum k_pch_Null_RenderHeight_Int32_s = "renderHeight"; ///
enum const(char)* k_pch_Null_RenderHeight_Int32 = k_pch_Null_RenderHeight_Int32_s.ptr; ///
enum k_pch_Null_SecondsFromVsyncToPhotons_Float_s = "secondsFromVsyncToPhotons"; ///
enum const(char)* k_pch_Null_SecondsFromVsyncToPhotons_Float = k_pch_Null_SecondsFromVsyncToPhotons_Float_s.ptr; ///
enum k_pch_Null_DisplayFrequency_Float_s = "displayFrequency"; ///
enum const(char)* k_pch_Null_DisplayFrequency_Float = k_pch_Null_DisplayFrequency_Float_s.ptr; ///
enum k_pch_WindowsMR_Section_s = "driver_holographic"; ///
enum const(char)* k_pch_WindowsMR_Section = k_pch_WindowsMR_Section_s.ptr; ///
enum k_pch_UserInterface_Section_s = "userinterface"; ///
enum const(char)* k_pch_UserInterface_Section = k_pch_UserInterface_Section_s.ptr; ///
enum k_pch_UserInterface_StatusAlwaysOnTop_Bool_s = "StatusAlwaysOnTop"; ///
enum const(char)* k_pch_UserInterface_StatusAlwaysOnTop_Bool = k_pch_UserInterface_StatusAlwaysOnTop_Bool_s.ptr; ///
enum k_pch_UserInterface_MinimizeToTray_Bool_s = "MinimizeToTray"; ///
enum const(char)* k_pch_UserInterface_MinimizeToTray_Bool = k_pch_UserInterface_MinimizeToTray_Bool_s.ptr; ///
enum k_pch_UserInterface_HidePopupsWhenStatusMinimized_Bool_s = "HidePopupsWhenStatusMinimized"; ///
enum const(char)* k_pch_UserInterface_HidePopupsWhenStatusMinimized_Bool = k_pch_UserInterface_HidePopupsWhenStatusMinimized_Bool_s.ptr; ///
enum k_pch_UserInterface_Screenshots_Bool_s = "screenshots"; ///
enum const(char)* k_pch_UserInterface_Screenshots_Bool = k_pch_UserInterface_Screenshots_Bool_s.ptr; ///
enum k_pch_UserInterface_ScreenshotType_Int_s = "screenshotType"; ///
enum const(char)* k_pch_UserInterface_ScreenshotType_Int = k_pch_UserInterface_ScreenshotType_Int_s.ptr; ///
enum k_pch_Notifications_Section_s = "notifications"; ///
enum const(char)* k_pch_Notifications_Section = k_pch_Notifications_Section_s.ptr; ///
enum k_pch_Notifications_DoNotDisturb_Bool_s = "DoNotDisturb"; ///
enum const(char)* k_pch_Notifications_DoNotDisturb_Bool = k_pch_Notifications_DoNotDisturb_Bool_s.ptr; ///
enum k_pch_Keyboard_Section_s = "keyboard"; ///
enum const(char)* k_pch_Keyboard_Section = k_pch_Keyboard_Section_s.ptr; ///
enum k_pch_Keyboard_TutorialCompletions_s = "TutorialCompletions"; ///
enum const(char)* k_pch_Keyboard_TutorialCompletions = k_pch_Keyboard_TutorialCompletions_s.ptr; ///
enum k_pch_Keyboard_ScaleX_s = "ScaleX"; ///
enum const(char)* k_pch_Keyboard_ScaleX = k_pch_Keyboard_ScaleX_s.ptr; ///
enum k_pch_Keyboard_ScaleY_s = "ScaleY"; ///
enum const(char)* k_pch_Keyboard_ScaleY = k_pch_Keyboard_ScaleY_s.ptr; ///
enum k_pch_Keyboard_OffsetLeftX_s = "OffsetLeftX"; ///
enum const(char)* k_pch_Keyboard_OffsetLeftX = k_pch_Keyboard_OffsetLeftX_s.ptr; ///
enum k_pch_Keyboard_OffsetRightX_s = "OffsetRightX"; ///
enum const(char)* k_pch_Keyboard_OffsetRightX = k_pch_Keyboard_OffsetRightX_s.ptr; ///
enum k_pch_Keyboard_OffsetY_s = "OffsetY"; ///
enum const(char)* k_pch_Keyboard_OffsetY = k_pch_Keyboard_OffsetY_s.ptr; ///
enum k_pch_Keyboard_Smoothing_s = "Smoothing"; ///
enum const(char)* k_pch_Keyboard_Smoothing = k_pch_Keyboard_Smoothing_s.ptr; ///
enum k_pch_Perf_Section_s = "perfcheck"; ///
enum const(char)* k_pch_Perf_Section = k_pch_Perf_Section_s.ptr; ///
enum k_pch_Perf_PerfGraphInHMD_Bool_s = "perfGraphInHMD"; ///
enum const(char)* k_pch_Perf_PerfGraphInHMD_Bool = k_pch_Perf_PerfGraphInHMD_Bool_s.ptr; ///
enum k_pch_Perf_AllowTimingStore_Bool_s = "allowTimingStore"; ///
enum const(char)* k_pch_Perf_AllowTimingStore_Bool = k_pch_Perf_AllowTimingStore_Bool_s.ptr; ///
enum k_pch_Perf_SaveTimingsOnExit_Bool_s = "saveTimingsOnExit"; ///
enum const(char)* k_pch_Perf_SaveTimingsOnExit_Bool = k_pch_Perf_SaveTimingsOnExit_Bool_s.ptr; ///
enum k_pch_Perf_TestData_Float_s = "perfTestData"; ///
enum const(char)* k_pch_Perf_TestData_Float = k_pch_Perf_TestData_Float_s.ptr; ///
enum k_pch_Perf_GPUProfiling_Bool_s = "GPUProfiling"; ///
enum const(char)* k_pch_Perf_GPUProfiling_Bool = k_pch_Perf_GPUProfiling_Bool_s.ptr; ///
enum k_pch_CollisionBounds_Section_s = "collisionBounds"; ///
enum const(char)* k_pch_CollisionBounds_Section = k_pch_CollisionBounds_Section_s.ptr; ///
enum k_pch_CollisionBounds_Style_Int32_s = "CollisionBoundsStyle"; ///
enum const(char)* k_pch_CollisionBounds_Style_Int32 = k_pch_CollisionBounds_Style_Int32_s.ptr; ///
enum k_pch_CollisionBounds_GroundPerimeterOn_Bool_s = "CollisionBoundsGroundPerimeterOn"; ///
enum const(char)* k_pch_CollisionBounds_GroundPerimeterOn_Bool = k_pch_CollisionBounds_GroundPerimeterOn_Bool_s.ptr; ///
enum k_pch_CollisionBounds_CenterMarkerOn_Bool_s = "CollisionBoundsCenterMarkerOn"; ///
enum const(char)* k_pch_CollisionBounds_CenterMarkerOn_Bool = k_pch_CollisionBounds_CenterMarkerOn_Bool_s.ptr; ///
enum k_pch_CollisionBounds_PlaySpaceOn_Bool_s = "CollisionBoundsPlaySpaceOn"; ///
enum const(char)* k_pch_CollisionBounds_PlaySpaceOn_Bool = k_pch_CollisionBounds_PlaySpaceOn_Bool_s.ptr; ///
enum k_pch_CollisionBounds_FadeDistance_Float_s = "CollisionBoundsFadeDistance"; ///
enum const(char)* k_pch_CollisionBounds_FadeDistance_Float = k_pch_CollisionBounds_FadeDistance_Float_s.ptr; ///
enum k_pch_CollisionBounds_WallHeight_Float_s = "CollisionBoundsWallHeight"; ///
enum const(char)* k_pch_CollisionBounds_WallHeight_Float = k_pch_CollisionBounds_WallHeight_Float_s.ptr; ///
enum k_pch_CollisionBounds_ColorGammaR_Int32_s = "CollisionBoundsColorGammaR"; ///
enum const(char)* k_pch_CollisionBounds_ColorGammaR_Int32 = k_pch_CollisionBounds_ColorGammaR_Int32_s.ptr; ///
enum k_pch_CollisionBounds_ColorGammaG_Int32_s = "CollisionBoundsColorGammaG"; ///
enum const(char)* k_pch_CollisionBounds_ColorGammaG_Int32 = k_pch_CollisionBounds_ColorGammaG_Int32_s.ptr; ///
enum k_pch_CollisionBounds_ColorGammaB_Int32_s = "CollisionBoundsColorGammaB"; ///
enum const(char)* k_pch_CollisionBounds_ColorGammaB_Int32 = k_pch_CollisionBounds_ColorGammaB_Int32_s.ptr; ///
enum k_pch_CollisionBounds_ColorGammaA_Int32_s = "CollisionBoundsColorGammaA"; ///
enum const(char)* k_pch_CollisionBounds_ColorGammaA_Int32 = k_pch_CollisionBounds_ColorGammaA_Int32_s.ptr; ///
enum k_pch_CollisionBounds_EnableDriverImport_s = "enableDriverBoundsImport"; ///
enum const(char)* k_pch_CollisionBounds_EnableDriverImport = k_pch_CollisionBounds_EnableDriverImport_s.ptr; ///
enum k_pch_Camera_Section_s = "camera"; ///
enum const(char)* k_pch_Camera_Section = k_pch_Camera_Section_s.ptr; ///
enum k_pch_Camera_EnableCamera_Bool_s = "enableCamera"; ///
enum const(char)* k_pch_Camera_EnableCamera_Bool = k_pch_Camera_EnableCamera_Bool_s.ptr; ///
enum k_pch_Camera_EnableCameraInDashboard_Bool_s = "enableCameraInDashboard"; ///
enum const(char)* k_pch_Camera_EnableCameraInDashboard_Bool = k_pch_Camera_EnableCameraInDashboard_Bool_s.ptr; ///
enum k_pch_Camera_EnableCameraForCollisionBounds_Bool_s = "enableCameraForCollisionBounds"; ///
enum const(char)* k_pch_Camera_EnableCameraForCollisionBounds_Bool = k_pch_Camera_EnableCameraForCollisionBounds_Bool_s.ptr; ///
enum k_pch_Camera_EnableCameraForRoomView_Bool_s = "enableCameraForRoomView"; ///
enum const(char)* k_pch_Camera_EnableCameraForRoomView_Bool = k_pch_Camera_EnableCameraForRoomView_Bool_s.ptr; ///
enum k_pch_Camera_BoundsColorGammaR_Int32_s = "cameraBoundsColorGammaR"; ///
enum const(char)* k_pch_Camera_BoundsColorGammaR_Int32 = k_pch_Camera_BoundsColorGammaR_Int32_s.ptr; ///
enum k_pch_Camera_BoundsColorGammaG_Int32_s = "cameraBoundsColorGammaG"; ///
enum const(char)* k_pch_Camera_BoundsColorGammaG_Int32 = k_pch_Camera_BoundsColorGammaG_Int32_s.ptr; ///
enum k_pch_Camera_BoundsColorGammaB_Int32_s = "cameraBoundsColorGammaB"; ///
enum const(char)* k_pch_Camera_BoundsColorGammaB_Int32 = k_pch_Camera_BoundsColorGammaB_Int32_s.ptr; ///
enum k_pch_Camera_BoundsColorGammaA_Int32_s = "cameraBoundsColorGammaA"; ///
enum const(char)* k_pch_Camera_BoundsColorGammaA_Int32 = k_pch_Camera_BoundsColorGammaA_Int32_s.ptr; ///
enum k_pch_Camera_BoundsStrength_Int32_s = "cameraBoundsStrength"; ///
enum const(char)* k_pch_Camera_BoundsStrength_Int32 = k_pch_Camera_BoundsStrength_Int32_s.ptr; ///
enum k_pch_Camera_RoomViewMode_Int32_s = "cameraRoomViewMode"; ///
enum const(char)* k_pch_Camera_RoomViewMode_Int32 = k_pch_Camera_RoomViewMode_Int32_s.ptr; ///
enum k_pch_audio_Section_s = "audio"; ///
enum const(char)* k_pch_audio_Section = k_pch_audio_Section_s.ptr; ///
enum k_pch_audio_SetOsDefaultPlaybackDevice_Bool_s = "setOsDefaultPlaybackDevice"; ///
enum const(char)* k_pch_audio_SetOsDefaultPlaybackDevice_Bool = k_pch_audio_SetOsDefaultPlaybackDevice_Bool_s.ptr; ///
enum k_pch_audio_EnablePlaybackDeviceOverride_Bool_s = "enablePlaybackDeviceOverride"; ///
enum const(char)* k_pch_audio_EnablePlaybackDeviceOverride_Bool = k_pch_audio_EnablePlaybackDeviceOverride_Bool_s.ptr; ///
enum k_pch_audio_PlaybackDeviceOverride_String_s = "playbackDeviceOverride"; ///
enum const(char)* k_pch_audio_PlaybackDeviceOverride_String = k_pch_audio_PlaybackDeviceOverride_String_s.ptr; ///
enum k_pch_audio_PlaybackDeviceOverrideName_String_s = "playbackDeviceOverrideName"; ///
enum const(char)* k_pch_audio_PlaybackDeviceOverrideName_String = k_pch_audio_PlaybackDeviceOverrideName_String_s.ptr; ///
enum k_pch_audio_SetOsDefaultRecordingDevice_Bool_s = "setOsDefaultRecordingDevice"; ///
enum const(char)* k_pch_audio_SetOsDefaultRecordingDevice_Bool = k_pch_audio_SetOsDefaultRecordingDevice_Bool_s.ptr; ///
enum k_pch_audio_EnableRecordingDeviceOverride_Bool_s = "enableRecordingDeviceOverride"; ///
enum const(char)* k_pch_audio_EnableRecordingDeviceOverride_Bool = k_pch_audio_EnableRecordingDeviceOverride_Bool_s.ptr; ///
enum k_pch_audio_RecordingDeviceOverride_String_s = "recordingDeviceOverride"; ///
enum const(char)* k_pch_audio_RecordingDeviceOverride_String = k_pch_audio_RecordingDeviceOverride_String_s.ptr; ///
enum k_pch_audio_RecordingDeviceOverrideName_String_s = "recordingDeviceOverrideName"; ///
enum const(char)* k_pch_audio_RecordingDeviceOverrideName_String = k_pch_audio_RecordingDeviceOverrideName_String_s.ptr; ///
enum k_pch_audio_EnablePlaybackMirror_Bool_s = "enablePlaybackMirror"; ///
enum const(char)* k_pch_audio_EnablePlaybackMirror_Bool = k_pch_audio_EnablePlaybackMirror_Bool_s.ptr; ///
enum k_pch_audio_PlaybackMirrorDevice_String_s = "playbackMirrorDevice"; ///
enum const(char)* k_pch_audio_PlaybackMirrorDevice_String = k_pch_audio_PlaybackMirrorDevice_String_s.ptr; ///
enum k_pch_audio_PlaybackMirrorDeviceName_String_s = "playbackMirrorDeviceName"; ///
enum const(char)* k_pch_audio_PlaybackMirrorDeviceName_String = k_pch_audio_PlaybackMirrorDeviceName_String_s.ptr; ///
enum k_pch_audio_OldPlaybackMirrorDevice_String_s = "onPlaybackMirrorDevice"; ///
enum const(char)* k_pch_audio_OldPlaybackMirrorDevice_String = k_pch_audio_OldPlaybackMirrorDevice_String_s.ptr; ///
enum k_pch_audio_ActiveMirrorDevice_String_s = "activePlaybackMirrorDevice"; ///
enum const(char)* k_pch_audio_ActiveMirrorDevice_String = k_pch_audio_ActiveMirrorDevice_String_s.ptr; ///
enum k_pch_audio_EnablePlaybackMirrorIndependentVolume_Bool_s = "enablePlaybackMirrorIndependentVolume"; ///
enum const(char)* k_pch_audio_EnablePlaybackMirrorIndependentVolume_Bool = k_pch_audio_EnablePlaybackMirrorIndependentVolume_Bool_s.ptr; ///
enum k_pch_audio_LastHmdPlaybackDeviceId_String_s = "lastHmdPlaybackDeviceId"; ///
enum const(char)* k_pch_audio_LastHmdPlaybackDeviceId_String = k_pch_audio_LastHmdPlaybackDeviceId_String_s.ptr; ///
enum k_pch_audio_VIVEHDMIGain_s = "viveHDMIGain"; ///
enum const(char)* k_pch_audio_VIVEHDMIGain = k_pch_audio_VIVEHDMIGain_s.ptr; ///
enum k_pch_Power_Section_s = "power"; ///
enum const(char)* k_pch_Power_Section = k_pch_Power_Section_s.ptr; ///
enum k_pch_Power_PowerOffOnExit_Bool_s = "powerOffOnExit"; ///
enum const(char)* k_pch_Power_PowerOffOnExit_Bool = k_pch_Power_PowerOffOnExit_Bool_s.ptr; ///
enum k_pch_Power_TurnOffScreensTimeout_Float_s = "turnOffScreensTimeout"; ///
enum const(char)* k_pch_Power_TurnOffScreensTimeout_Float = k_pch_Power_TurnOffScreensTimeout_Float_s.ptr; ///
enum k_pch_Power_TurnOffControllersTimeout_Float_s = "turnOffControllersTimeout"; ///
enum const(char)* k_pch_Power_TurnOffControllersTimeout_Float = k_pch_Power_TurnOffControllersTimeout_Float_s.ptr; ///
enum k_pch_Power_ReturnToWatchdogTimeout_Float_s = "returnToWatchdogTimeout"; ///
enum const(char)* k_pch_Power_ReturnToWatchdogTimeout_Float = k_pch_Power_ReturnToWatchdogTimeout_Float_s.ptr; ///
enum k_pch_Power_AutoLaunchSteamVROnButtonPress_s = "autoLaunchSteamVROnButtonPress"; ///
enum const(char)* k_pch_Power_AutoLaunchSteamVROnButtonPress = k_pch_Power_AutoLaunchSteamVROnButtonPress_s.ptr; ///
enum k_pch_Power_PauseCompositorOnStandby_Bool_s = "pauseCompositorOnStandby"; ///
enum const(char)* k_pch_Power_PauseCompositorOnStandby_Bool = k_pch_Power_PauseCompositorOnStandby_Bool_s.ptr; ///
enum k_pch_Dashboard_Section_s = "dashboard"; ///
enum const(char)* k_pch_Dashboard_Section = k_pch_Dashboard_Section_s.ptr; ///
enum k_pch_Dashboard_EnableDashboard_Bool_s = "enableDashboard"; ///
enum const(char)* k_pch_Dashboard_EnableDashboard_Bool = k_pch_Dashboard_EnableDashboard_Bool_s.ptr; ///
enum k_pch_Dashboard_ArcadeMode_Bool_s = "arcadeMode"; ///
enum const(char)* k_pch_Dashboard_ArcadeMode_Bool = k_pch_Dashboard_ArcadeMode_Bool_s.ptr; ///
enum k_pch_Dashboard_Position_s = "position"; ///
enum const(char)* k_pch_Dashboard_Position = k_pch_Dashboard_Position_s.ptr; ///
enum k_pch_Dashboard_DesktopScale_s = "desktopScale"; ///
enum const(char)* k_pch_Dashboard_DesktopScale = k_pch_Dashboard_DesktopScale_s.ptr; ///
enum k_pch_Dashboard_DashboardScale_s = "dashboardScale"; ///
enum const(char)* k_pch_Dashboard_DashboardScale = k_pch_Dashboard_DashboardScale_s.ptr; ///
enum k_pch_modelskin_Section_s = "modelskins"; ///
enum const(char)* k_pch_modelskin_Section = k_pch_modelskin_Section_s.ptr; ///
enum k_pch_Driver_Enable_Bool_s = "enable"; ///
enum const(char)* k_pch_Driver_Enable_Bool = k_pch_Driver_Enable_Bool_s.ptr; ///
enum k_pch_Driver_BlockedBySafemode_Bool_s = "blocked_by_safe_mode"; ///
enum const(char)* k_pch_Driver_BlockedBySafemode_Bool = k_pch_Driver_BlockedBySafemode_Bool_s.ptr; ///
enum k_pch_Driver_LoadPriority_Int32_s = "loadPriority"; ///
enum const(char)* k_pch_Driver_LoadPriority_Int32 = k_pch_Driver_LoadPriority_Int32_s.ptr; ///
enum k_pch_WebInterface_Section_s = "WebInterface"; ///
enum const(char)* k_pch_WebInterface_Section = k_pch_WebInterface_Section_s.ptr; ///
enum k_pch_VRWebHelper_Section_s = "VRWebHelper"; ///
enum const(char)* k_pch_VRWebHelper_Section = k_pch_VRWebHelper_Section_s.ptr; ///
enum k_pch_VRWebHelper_DebuggerEnabled_Bool_s = "DebuggerEnabled"; ///
enum const(char)* k_pch_VRWebHelper_DebuggerEnabled_Bool = k_pch_VRWebHelper_DebuggerEnabled_Bool_s.ptr; ///
enum k_pch_VRWebHelper_DebuggerPort_Int32_s = "DebuggerPort"; ///
enum const(char)* k_pch_VRWebHelper_DebuggerPort_Int32 = k_pch_VRWebHelper_DebuggerPort_Int32_s.ptr; ///
enum k_pch_TrackingOverride_Section_s = "TrackingOverrides"; ///
enum const(char)* k_pch_TrackingOverride_Section = k_pch_TrackingOverride_Section_s.ptr; ///
enum k_pch_App_BindingAutosaveURLSuffix_String_s = "AutosaveURL"; ///
enum const(char)* k_pch_App_BindingAutosaveURLSuffix_String = k_pch_App_BindingAutosaveURLSuffix_String_s.ptr; ///
enum k_pch_App_BindingLegacyAPISuffix_String_s = "_legacy"; ///
enum const(char)* k_pch_App_BindingLegacyAPISuffix_String = k_pch_App_BindingLegacyAPISuffix_String_s.ptr; ///
enum k_pch_App_BindingSteamVRInputAPISuffix_String_s = "_steamvrinput"; ///
enum const(char)* k_pch_App_BindingSteamVRInputAPISuffix_String = k_pch_App_BindingSteamVRInputAPISuffix_String_s.ptr; ///
enum k_pch_App_BindingCurrentURLSuffix_String_s = "CurrentURL"; ///
enum const(char)* k_pch_App_BindingCurrentURLSuffix_String = k_pch_App_BindingCurrentURLSuffix_String_s.ptr; ///
enum k_pch_App_BindingPreviousURLSuffix_String_s = "PreviousURL"; ///
enum const(char)* k_pch_App_BindingPreviousURLSuffix_String = k_pch_App_BindingPreviousURLSuffix_String_s.ptr; ///
enum k_pch_App_NeedToUpdateAutosaveSuffix_Bool_s = "NeedToUpdateAutosave"; ///
enum const(char)* k_pch_App_NeedToUpdateAutosaveSuffix_Bool = k_pch_App_NeedToUpdateAutosaveSuffix_Bool_s.ptr; ///
enum k_pch_App_DominantHand_Int32_s = "DominantHand"; ///
enum const(char)* k_pch_App_DominantHand_Int32 = k_pch_App_DominantHand_Int32_s.ptr; ///
enum k_pch_Trackers_Section_s = "trackers"; ///
enum const(char)* k_pch_Trackers_Section = k_pch_Trackers_Section_s.ptr; ///
enum k_pch_DesktopUI_Section_s = "DesktopUI"; ///
enum const(char)* k_pch_DesktopUI_Section = k_pch_DesktopUI_Section_s.ptr; ///
enum k_pch_LastKnown_Section_s = "LastKnown"; ///
enum const(char)* k_pch_LastKnown_Section = k_pch_LastKnown_Section_s.ptr; ///
enum k_pch_LastKnown_HMDManufacturer_String_s = "HMDManufacturer"; ///
enum const(char)* k_pch_LastKnown_HMDManufacturer_String = k_pch_LastKnown_HMDManufacturer_String_s.ptr; ///
enum k_pch_LastKnown_HMDModel_String_s = "HMDModel"; ///
enum const(char)* k_pch_LastKnown_HMDModel_String = k_pch_LastKnown_HMDModel_String_s.ptr; ///
enum k_pch_DismissedWarnings_Section_s = "DismissedWarnings"; ///
enum const(char)* k_pch_DismissedWarnings_Section = k_pch_DismissedWarnings_Section_s.ptr; ///
enum k_pch_Input_Section_s = "input"; ///
enum const(char)* k_pch_Input_Section = k_pch_Input_Section_s.ptr; ///
enum k_pch_Input_LeftThumbstickRotation_Float_s = "leftThumbstickRotation"; ///
enum const(char)* k_pch_Input_LeftThumbstickRotation_Float = k_pch_Input_LeftThumbstickRotation_Float_s.ptr; ///
enum k_pch_Input_RightThumbstickRotation_Float_s = "rightThumbstickRotation"; ///
enum const(char)* k_pch_Input_RightThumbstickRotation_Float = k_pch_Input_RightThumbstickRotation_Float_s.ptr; ///
enum k_pch_Input_ThumbstickDeadzone_Float_s = "thumbstickDeadzone"; ///
enum const(char)* k_pch_Input_ThumbstickDeadzone_Float = k_pch_Input_ThumbstickDeadzone_Float_s.ptr; ///
enum k_pch_GpuSpeed_Section_s = "GpuSpeed"; ///
enum const(char)* k_pch_GpuSpeed_Section = k_pch_GpuSpeed_Section_s.ptr; ///
enum IVRScreenshots_Version_s = "IVRScreenshots_001"; ///
enum const(char)* IVRScreenshots_Version = IVRScreenshots_Version_s.ptr; ///
enum IVRResources_Version_s = "IVRResources_001"; ///
enum const(char)* IVRResources_Version = IVRResources_Version_s.ptr; ///
enum IVRDriverManager_Version_s = "IVRDriverManager_001"; ///
enum const(char)* IVRDriverManager_Version = IVRDriverManager_Version_s.ptr; ///
enum uint k_unMaxActionNameLength = 64; /// Maximum number of characters in an action name, including the trailing null
enum uint k_unMaxActionSetNameLength = 64; /// Maximum number of characters in an action set name, including the trailing null
enum uint k_unMaxActionOriginCount = 16; /// Maximum number of origins for an action
enum uint k_unMaxBoneNameLength = 32; /// Maximum number of characters in a bone name, including the trailing null
/// * Experimental global action set priority *
///  These constants are part of the experimental support in SteamVR for overlay apps selectively overriding input in the base scene application. This may be useful for overlay applications that need to use part or all of a controller without taking away all input to the game. This system must be enabled by the  "Experimental overlay input overrides" setting in the developer section of  SteamVR settings.
/// 
/// To use this system, set the nPriority field of an action set to any number in this range. 
enum int k_nActionSetOverlayGlobalPriorityMin = 16777216;
enum int k_nActionSetOverlayGlobalPriorityMax = 33554431; ///
enum int k_nActionSetPriorityReservedMin = 33554432; ///
enum IVRInput_Version_s = "IVRInput_010"; ///
enum const(char)* IVRInput_Version = IVRInput_Version_s.ptr; ///
enum ulong k_ulInvalidIOBufferHandle = 0; ///
enum IVRIOBuffer_Version_s = "IVRIOBuffer_002"; ///
enum const(char)* IVRIOBuffer_Version = IVRIOBuffer_Version_s.ptr; ///
enum SpatialAnchorHandle_t k_ulInvalidSpatialAnchorHandle = 0; ///
enum IVRSpatialAnchors_Version_s = "IVRSpatialAnchors_001"; ///
enum const(char)* IVRSpatialAnchors_Version = IVRSpatialAnchors_Version_s.ptr; ///
enum IVRDebug_Version_s = "IVRDebug_001"; ///
enum const(char)* IVRDebug_Version = IVRDebug_Version_s.ptr; ///

/// right-handed system
/// +y is up
/// +x is to the right
/// -z is forward
/// Distance unit is  meters
struct HmdMatrix34_t
{
	/// right-handed system
	/// +y is up
	/// +x is to the right
	/// -z is forward
	/// Distance unit is  meters
	float[4][3] m = [0, 0, 0];
}

///
struct HmdMatrix33_t
{
	float[3][3] m = [0, 0, 0]; ///
}

///
struct HmdMatrix44_t
{
	float[4][4] m = [0, 0, 0, 0]; ///
}

///
struct HmdVector3_t
{
	float[3] v = 0; ///
}

///
struct HmdVector4_t
{
	float[4] v = 0; ///
}

///
struct HmdVector3d_t
{
	double[3] v = 0; ///
}

///
struct HmdVector2_t
{
	float[2] v = 0; ///
}

///
struct HmdQuaternion_t
{
	double w = 0; ///
	double x = 0; ///
	double y = 0; ///
	double z = 0; ///
}

///
struct HmdQuaternionf_t
{
	float w = 0; ///
	float x = 0; ///
	float y = 0; ///
	float z = 0; ///
}

///
struct HmdColor_t
{
	float r = 0; ///
	float g = 0; ///
	float b = 0; ///
	float a = 0; ///
}

///
struct HmdQuad_t
{
	HmdVector3_t[4] vCorners; ///
}

///
struct HmdRect2_t
{
	HmdVector2_t vTopLeft; ///
	HmdVector2_t vBottomRight; ///
}

/// Used to return the post-distortion UVs for each color channel.
/// UVs range from 0 to 1 with 0,0 in the upper left corner of the source render target. The 0,0 to 1,1 range covers a single eye.
struct DistortionCoordinates_t
{
	/// Used to return the post-distortion UVs for each color channel.
	/// UVs range from 0 to 1 with 0,0 in the upper left corner of the source render target. The 0,0 to 1,1 range covers a single eye.
	float[2] rfRed = 0;
	/// Used to return the post-distortion UVs for each color channel.
	/// UVs range from 0 to 1 with 0,0 in the upper left corner of the source render target. The 0,0 to 1,1 range covers a single eye.
	float[2] rfGreen = 0;
	/// Used to return the post-distortion UVs for each color channel.
	/// UVs range from 0 to 1 with 0,0 in the upper left corner of the source render target. The 0,0 to 1,1 range covers a single eye.
	float[2] rfBlue = 0;
}

///
struct Texture_t
{
	void* handle; ///
	ETextureType eType; ///
	EColorSpace eColorSpace; ///
}

/// describes a single pose for a tracked object
struct TrackedDevicePose_t
{
	HmdMatrix34_t mDeviceToAbsoluteTracking; /// describes a single pose for a tracked object
	HmdVector3_t vVelocity; /// describes a single pose for a tracked object
	HmdVector3_t vAngularVelocity; /// describes a single pose for a tracked object
	ETrackingResult eTrackingResult; /// describes a single pose for a tracked object
	bool bPoseIsValid; /// describes a single pose for a tracked object
	bool bDeviceIsConnected; /// describes a single pose for a tracked object
}

/// Allows the application to control what part of the provided texture will be used in the frame buffer.
struct VRTextureBounds_t
{
	float uMin = 0; /// Allows the application to control what part of the provided texture will be used in the frame buffer.
	float vMin = 0; /// Allows the application to control what part of the provided texture will be used in the frame buffer.
	float uMax = 0; /// Allows the application to control what part of the provided texture will be used in the frame buffer.
	float vMax = 0; /// Allows the application to control what part of the provided texture will be used in the frame buffer.
}

/// Allows specifying pose used to render provided scene texture (if different from value returned by WaitGetPoses).
struct VRTextureWithPose_t
{
	HmdMatrix34_t mDeviceToAbsoluteTracking; /// Allows specifying pose used to render provided scene texture (if different from value returned by WaitGetPoses).
}

///
struct VRTextureDepthInfo_t
{
	void* handle; ///
	HmdMatrix44_t mProjection; ///
	HmdVector2_t vRange; ///
}

///
struct VRTextureWithDepth_t
{
	VRTextureDepthInfo_t depth; ///
}

///
struct VRTextureWithPoseAndDepth_t
{
	VRTextureDepthInfo_t depth; ///
}

/// Data required for passing Vulkan textures to IVRCompositor::Submit.
/// Be sure to call OpenVR_Shutdown before destroying these resources.
/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
struct VRVulkanTextureData_t
{
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	ulong m_nImage;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	VkDevice_T m_pDevice;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	VkPhysicalDevice_T m_pPhysicalDevice;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	VkInstance_T m_pInstance;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	VkQueue_T m_pQueue;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	uint m_nQueueFamilyIndex;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	uint m_nWidth;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	uint m_nHeight;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	uint m_nFormat;
	/// Data required for passing Vulkan textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	/// Please see https://github.com/ValveSoftware/openvr/wiki/Vulkan for Vulkan-specific documentation
	uint m_nSampleCount;
}

/// Data required for passing D3D12 textures to IVRCompositor::Submit.
/// Be sure to call OpenVR_Shutdown before destroying these resources.
struct D3D12TextureData_t
{
	/// Data required for passing D3D12 textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	ID3D12Resource m_pResource;
	/// Data required for passing D3D12 textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	ID3D12CommandQueue m_pCommandQueue;
	/// Data required for passing D3D12 textures to IVRCompositor::Submit.
	/// Be sure to call OpenVR_Shutdown before destroying these resources.
	uint m_nNodeMask;
}

/// used for controller button events
struct VREvent_Controller_t
{
	uint button; /// used for controller button events
}

/// used for simulated mouse events in overlay space
struct VREvent_Mouse_t
{
	float x = 0; /// used for simulated mouse events in overlay space
	float y = 0; /// used for simulated mouse events in overlay space
	uint button; /// used for simulated mouse events in overlay space
}

/// used for simulated mouse wheel scroll
struct VREvent_Scroll_t
{
	float xdelta = 0; /// used for simulated mouse wheel scroll
	float ydelta = 0; /// used for simulated mouse wheel scroll
	uint unused; /// used for simulated mouse wheel scroll
	float viewportscale = 0; /// used for simulated mouse wheel scroll
}

/// when in mouse input mode you can receive data from the touchpad, these events are only sent if the users finger is on the touchpad (or just released from it). These events are sent to overlays with the VROverlayFlags_SendVRTouchpadEvents flag set.
struct VREvent_TouchPadMove_t
{
	bool bFingerDown; /// when in mouse input mode you can receive data from the touchpad, these events are only sent if the users finger is on the touchpad (or just released from it). These events are sent to overlays with the VROverlayFlags_SendVRTouchpadEvents flag set.
	float flSecondsFingerDown = 0; /// when in mouse input mode you can receive data from the touchpad, these events are only sent if the users finger is on the touchpad (or just released from it). These events are sent to overlays with the VROverlayFlags_SendVRTouchpadEvents flag set.
	float fValueXFirst = 0; /// when in mouse input mode you can receive data from the touchpad, these events are only sent if the users finger is on the touchpad (or just released from it). These events are sent to overlays with the VROverlayFlags_SendVRTouchpadEvents flag set.
	float fValueYFirst = 0; /// when in mouse input mode you can receive data from the touchpad, these events are only sent if the users finger is on the touchpad (or just released from it). These events are sent to overlays with the VROverlayFlags_SendVRTouchpadEvents flag set.
	float fValueXRaw = 0; /// when in mouse input mode you can receive data from the touchpad, these events are only sent if the users finger is on the touchpad (or just released from it). These events are sent to overlays with the VROverlayFlags_SendVRTouchpadEvents flag set.
	float fValueYRaw = 0; /// when in mouse input mode you can receive data from the touchpad, these events are only sent if the users finger is on the touchpad (or just released from it). These events are sent to overlays with the VROverlayFlags_SendVRTouchpadEvents flag set.
}

/// notification related events. Details will still change at this point
struct VREvent_Notification_t
{
	ulong ulUserValue; /// notification related events. Details will still change at this point
	uint notificationId; /// notification related events. Details will still change at this point
}

/// Used for events about processes
struct VREvent_Process_t
{
	uint pid; /// Used for events about processes
	uint oldPid; /// Used for events about processes
	bool bForced; /// Used for events about processes
	bool bConnectionLost; /// Used for events about processes
}

/// Used for a few events about overlays
struct VREvent_Overlay_t
{
	ulong overlayHandle; /// Used for a few events about overlays
	ulong devicePath; /// Used for a few events about overlays
}

/// Used for a few events about overlays
struct VREvent_Status_t
{
	uint statusState; /// Used for a few events about overlays
}

/// Used for keyboard events
struct VREvent_Keyboard_t
{
	char[8] cNewInput = 0; /// Used for keyboard events
	ulong uUserValue; /// Used for keyboard events
}

///
struct VREvent_Ipd_t
{
	float ipdMeters = 0; ///
}

///
struct VREvent_Chaperone_t
{
	ulong m_nPreviousUniverse; ///
	ulong m_nCurrentUniverse; ///
}

/// Not actually used for any events
struct VREvent_Reserved_t
{
	ulong reserved0; /// Not actually used for any events
	ulong reserved1; /// Not actually used for any events
	ulong reserved2; /// Not actually used for any events
	ulong reserved3; /// Not actually used for any events
	ulong reserved4; /// Not actually used for any events
	ulong reserved5; /// Not actually used for any events
}

///
struct VREvent_PerformanceTest_t
{
	uint m_nFidelityLevel; ///
}

///
struct VREvent_SeatedZeroPoseReset_t
{
	bool bResetBySystemMenu; ///
}

///
struct VREvent_Screenshot_t
{
	uint handle; ///
	uint type; ///
}

///
struct VREvent_ScreenshotProgress_t
{
	float progress = 0; ///
}

///
struct VREvent_ApplicationLaunch_t
{
	uint pid; ///
	uint unArgsHandle; ///
}

///
struct VREvent_EditingCameraSurface_t
{
	ulong overlayHandle; ///
	uint nVisualMode; ///
}

///
struct VREvent_MessageOverlay_t
{
	uint unVRMessageOverlayResponse; ///
}

///
struct VREvent_Property_t
{
	PropertyContainerHandle_t container; ///
	ETrackedDeviceProperty prop; ///
}

///
struct VREvent_HapticVibration_t
{
	ulong containerHandle; ///
	ulong componentHandle; ///
	float fDurationSeconds = 0; ///
	float fFrequency = 0; ///
	float fAmplitude = 0; ///
}

///
struct VREvent_WebConsole_t
{
	WebConsoleHandle_t webConsoleHandle; ///
}

///
struct VREvent_InputBindingLoad_t
{
	PropertyContainerHandle_t ulAppContainer; ///
	ulong pathMessage; ///
	ulong pathUrl; ///
	ulong pathControllerType; ///
}

///
struct VREvent_InputActionManifestLoad_t
{
	ulong pathAppKey; ///
	ulong pathMessage; ///
	ulong pathMessageParam; ///
	ulong pathManifestPath; ///
}

///
struct VREvent_SpatialAnchor_t
{
	SpatialAnchorHandle_t unHandle; ///
}

///
struct VREvent_ProgressUpdate_t
{
	ulong ulApplicationPropertyContainer; ///
	ulong pathDevice; ///
	ulong pathInputSource; ///
	ulong pathProgressAction; ///
	ulong pathIcon; ///
	float fProgress = 0; ///
}

///
struct VREvent_ShowUI_t
{
	EShowUIType eType; ///
}

///
struct VREvent_ShowDevTools_t
{
	int nBrowserIdentifier; ///
}

///
struct VREvent_HDCPError_t
{
	EHDCPError eCode; ///
}

///
union VREvent_Data_t
{
	VREvent_Reserved_t reserved; ///
	VREvent_Controller_t controller; ///
	VREvent_Mouse_t mouse; ///
	VREvent_Scroll_t scroll; ///
	VREvent_Process_t process; ///
	VREvent_Notification_t notification; ///
	VREvent_Overlay_t overlay; ///
	VREvent_Status_t status; ///
	VREvent_Keyboard_t keyboard; ///
	VREvent_Ipd_t ipd; ///
	VREvent_Chaperone_t chaperone; ///
	VREvent_PerformanceTest_t performanceTest; ///
	VREvent_TouchPadMove_t touchPadMove; ///
	VREvent_SeatedZeroPoseReset_t seatedZeroPoseReset; ///
	VREvent_Screenshot_t screenshot; ///
	VREvent_ScreenshotProgress_t screenshotProgress; ///
	VREvent_ApplicationLaunch_t applicationLaunch; ///
	VREvent_EditingCameraSurface_t cameraSurface; ///
	VREvent_MessageOverlay_t messageOverlay; ///
	VREvent_Property_t property; ///
	VREvent_HapticVibration_t hapticVibration; ///
	VREvent_WebConsole_t webConsole; ///
	VREvent_InputBindingLoad_t inputBinding; ///
	VREvent_InputActionManifestLoad_t actionManifest; ///
	VREvent_SpatialAnchor_t spatialAnchor; ///
	VREvent_ProgressUpdate_t progressUpdate; ///
	VREvent_ShowUI_t showUi; ///
	VREvent_ShowDevTools_t showDevTools; ///
	VREvent_HDCPError_t hdcpError; ///
}

/// An event posted by the server to all running applications
struct VREvent_t
{
	uint eventType; /// An event posted by the server to all running applications
	TrackedDeviceIndex_t trackedDeviceIndex; /// An event posted by the server to all running applications
	float eventAgeSeconds = 0; /// An event posted by the server to all running applications
	VREvent_Data_t data; /// An event posted by the server to all running applications
}

/// Describes state information about a render-model component, including transforms and other dynamic properties
struct RenderModel_ComponentState_t
{
	HmdMatrix34_t mTrackingToComponentRenderModel; /// Describes state information about a render-model component, including transforms and other dynamic properties
	HmdMatrix34_t mTrackingToComponentLocal; /// Describes state information about a render-model component, including transforms and other dynamic properties
	VRComponentProperties uProperties; /// Describes state information about a render-model component, including transforms and other dynamic properties
}

/// The mesh to draw into the stencil (or depth) buffer to perform early stencil (or depth) kills of pixels that will never appear on the HMD. This mesh draws on all the pixels that will be hidden after distortion.
/// 
/// If the HMD does not provide a visible area mesh pVertexData will be NULL and unTriangleCount will be 0.
struct HiddenAreaMesh_t
{
	/// The mesh to draw into the stencil (or depth) buffer to perform early stencil (or depth) kills of pixels that will never appear on the HMD. This mesh draws on all the pixels that will be hidden after distortion.
	/// 
	/// If the HMD does not provide a visible area mesh pVertexData will be NULL and unTriangleCount will be 0.
	const(HmdVector2_t)* pVertexData;
	/// The mesh to draw into the stencil (or depth) buffer to perform early stencil (or depth) kills of pixels that will never appear on the HMD. This mesh draws on all the pixels that will be hidden after distortion.
	/// 
	/// If the HMD does not provide a visible area mesh pVertexData will be NULL and unTriangleCount will be 0.
	uint unTriangleCount;
}

/// contains information about one axis on the controller
struct VRControllerAxis_t
{
	float x = 0; /// contains information about one axis on the controller
	float y = 0; /// contains information about one axis on the controller
}

/// Holds all the state of a controller at one moment in time.
struct VRControllerState001_t
{
	uint unPacketNum; /// Holds all the state of a controller at one moment in time.
	ulong ulButtonPressed; /// Holds all the state of a controller at one moment in time.
	ulong ulButtonTouched; /// Holds all the state of a controller at one moment in time.
	VRControllerAxis_t[5] rAxis; /// Holds all the state of a controller at one moment in time.
}

/// Holds the transform for a single bone
struct VRBoneTransform_t
{
	HmdVector4_t position; /// Holds the transform for a single bone
	HmdQuaternionf_t orientation; /// Holds the transform for a single bone
}

///
struct CameraVideoStreamFrameHeader_t
{
	EVRTrackedCameraFrameType eFrameType; ///
	uint nWidth; ///
	uint nHeight; ///
	uint nBytesPerPixel; ///
	uint nFrameSequence; ///
	TrackedDevicePose_t trackedDevicePose; ///
	ulong ulFrameExposureTime; ///
}

/// Provides a single frame's timing information to the app
struct Compositor_FrameTiming
{
	uint m_nSize; /// Provides a single frame's timing information to the app
	uint m_nFrameIndex; /// Provides a single frame's timing information to the app
	uint m_nNumFramePresents; /// Provides a single frame's timing information to the app
	uint m_nNumMisPresented; /// Provides a single frame's timing information to the app
	uint m_nNumDroppedFrames; /// Provides a single frame's timing information to the app
	uint m_nReprojectionFlags; /// Provides a single frame's timing information to the app
	double m_flSystemTimeInSeconds = 0; /// Provides a single frame's timing information to the app
	float m_flPreSubmitGpuMs = 0; /// Provides a single frame's timing information to the app
	float m_flPostSubmitGpuMs = 0; /// Provides a single frame's timing information to the app
	float m_flTotalRenderGpuMs = 0; /// Provides a single frame's timing information to the app
	float m_flCompositorRenderGpuMs = 0; /// Provides a single frame's timing information to the app
	float m_flCompositorRenderCpuMs = 0; /// Provides a single frame's timing information to the app
	float m_flCompositorIdleCpuMs = 0; /// Provides a single frame's timing information to the app
	float m_flClientFrameIntervalMs = 0; /// Provides a single frame's timing information to the app
	float m_flPresentCallCpuMs = 0; /// Provides a single frame's timing information to the app
	float m_flWaitForPresentCpuMs = 0; /// Provides a single frame's timing information to the app
	float m_flSubmitFrameMs = 0; /// Provides a single frame's timing information to the app
	float m_flWaitGetPosesCalledMs = 0; /// Provides a single frame's timing information to the app
	float m_flNewPosesReadyMs = 0; /// Provides a single frame's timing information to the app
	float m_flNewFrameReadyMs = 0; /// Provides a single frame's timing information to the app
	float m_flCompositorUpdateStartMs = 0; /// Provides a single frame's timing information to the app
	float m_flCompositorUpdateEndMs = 0; /// Provides a single frame's timing information to the app
	float m_flCompositorRenderStartMs = 0; /// Provides a single frame's timing information to the app
	TrackedDevicePose_t m_HmdPose; /// Provides a single frame's timing information to the app
	uint m_nNumVSyncsReadyForUse; /// Provides a single frame's timing information to the app
	uint m_nNumVSyncsToFirstView; /// Provides a single frame's timing information to the app
}

/// Provides compositor benchmark results to the app
struct Compositor_BenchmarkResults
{
	float m_flMegaPixelsPerSecond = 0; /// Provides compositor benchmark results to the app
	float m_flHmdRecommendedMegaPixelsPerSecond = 0; /// Provides compositor benchmark results to the app
}

/// Frame timing data provided by direct mode drivers.
struct DriverDirectMode_FrameTiming
{
	uint m_nSize; /// Frame timing data provided by direct mode drivers.
	uint m_nNumFramePresents; /// Frame timing data provided by direct mode drivers.
	uint m_nNumMisPresented; /// Frame timing data provided by direct mode drivers.
	uint m_nNumDroppedFrames; /// Frame timing data provided by direct mode drivers.
	uint m_nReprojectionFlags; /// Frame timing data provided by direct mode drivers.
}

///
struct ImuSample_t
{
	double fSampleTime = 0; ///
	HmdVector3d_t vAccel; ///
	HmdVector3d_t vGyro; ///
	uint unOffScaleFlags; ///
}

///
struct AppOverrideKeys_t
{
	const(char)* pchKey; ///
	const(char)* pchValue; ///
}

/// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
struct Compositor_CumulativeStats
{
	uint m_nPid; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumFramePresents; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumDroppedFrames; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumReprojectedFrames; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumFramePresentsOnStartup; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumDroppedFramesOnStartup; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumReprojectedFramesOnStartup; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumLoading; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumFramePresentsLoading; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumDroppedFramesLoading; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumReprojectedFramesLoading; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumTimedOut; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumFramePresentsTimedOut; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumDroppedFramesTimedOut; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
	uint m_nNumReprojectedFramesTimedOut; /// Cumulative stats for current application.  These are not cleared until a new app connects, but they do stop accumulating once the associated app disconnects.
}

///
struct Compositor_StageRenderSettings
{
	HmdColor_t m_PrimaryColor; ///
	HmdColor_t m_SecondaryColor; ///
	float m_flVignetteInnerRadius = 0; ///
	float m_flVignetteOuterRadius = 0; ///
	float m_flFresnelStrength = 0; ///
	bool m_bBackfaceCulling; ///
	bool m_bGreyscale; ///
	bool m_bWireframe; ///
}

///
struct VROverlayIntersectionParams_t
{
	HmdVector3_t vSource; ///
	HmdVector3_t vDirection; ///
	ETrackingUniverseOrigin eOrigin; ///
}

///
struct VROverlayIntersectionResults_t
{
	HmdVector3_t vPoint; ///
	HmdVector3_t vNormal; ///
	HmdVector2_t vUVs; ///
	float fDistance = 0; ///
}

///
struct IntersectionMaskRectangle_t
{
	float m_flTopLeftX = 0; ///
	float m_flTopLeftY = 0; ///
	float m_flWidth = 0; ///
	float m_flHeight = 0; ///
}

///
struct IntersectionMaskCircle_t
{
	float m_flCenterX = 0; ///
	float m_flCenterY = 0; ///
	float m_flRadius = 0; ///
}

///
union VROverlayIntersectionMaskPrimitive_Data_t
{
	IntersectionMaskRectangle_t m_Rectangle; ///
	IntersectionMaskCircle_t m_Circle; ///
}

///
struct VROverlayIntersectionMaskPrimitive_t
{
	EVROverlayIntersectionMaskPrimitiveType m_nPrimitiveType; ///
	VROverlayIntersectionMaskPrimitive_Data_t m_Primitive; ///
}

///
struct VROverlayView_t
{
	VROverlayHandle_t overlayHandle; ///
	Texture_t texture; ///
	VRTextureBounds_t textureBounds; ///
}

///
struct VRVulkanDevice_t
{
	VkInstance_T m_pInstance; ///
	VkDevice_T m_pDevice; ///
	VkPhysicalDevice_T m_pPhysicalDevice; ///
	VkQueue_T m_pQueue; ///
	uint m_uQueueFamilyIndex; ///
}

///
struct VRNativeDevice_t
{
	void* handle; ///
	EDeviceType eType; ///
}

/// single vertex in a render model
struct RenderModel_Vertex_t
{
	HmdVector3_t vPosition; /// single vertex in a render model
	HmdVector3_t vNormal; /// single vertex in a render model
	float[2] rfTextureCoord = 0; /// single vertex in a render model
}

///
struct RenderModel_TextureMap_t
{
	ushort unWidth; ///
	ushort unHeight; ///
	const(ubyte)* rubTextureMapData; ///
	EVRRenderModelTextureFormat format; ///
}

///
struct RenderModel_t
{
	const(RenderModel_Vertex_t)* rVertexData; ///
	uint unVertexCount; ///
	const(ushort)* rIndexData; ///
	uint unTriangleCount; ///
	TextureID_t diffuseTextureId; ///
}

///
struct RenderModel_ControllerMode_State_t
{
	bool bScrollWheelVisible; ///
}

/// Used for passing graphic data
struct NotificationBitmap_t
{
	void* m_pImageData; /// Used for passing graphic data
	int m_nWidth; /// Used for passing graphic data
	int m_nHeight; /// Used for passing graphic data
	int m_nBytesPerPixel; /// Used for passing graphic data
}

///
struct CVRSettingHelper
{
	IVRSettings m_pSettings; ///
}

///
struct InputAnalogActionData_t
{
	bool bActive; ///
	VRInputValueHandle_t activeOrigin; ///
	float x = 0; ///
	float y = 0; ///
	float z = 0; ///
	float deltaX = 0; ///
	float deltaY = 0; ///
	float deltaZ = 0; ///
	float fUpdateTime = 0; ///
}

///
struct InputDigitalActionData_t
{
	bool bActive; ///
	VRInputValueHandle_t activeOrigin; ///
	bool bState; ///
	bool bChanged; ///
	float fUpdateTime = 0; ///
}

///
struct InputPoseActionData_t
{
	bool bActive; ///
	VRInputValueHandle_t activeOrigin; ///
	TrackedDevicePose_t pose; ///
}

///
struct InputSkeletalActionData_t
{
	bool bActive; ///
	VRInputValueHandle_t activeOrigin; ///
}

///
struct InputOriginInfo_t
{
	VRInputValueHandle_t devicePath; ///
	TrackedDeviceIndex_t trackedDeviceIndex; ///
	char[128] rchRenderModelComponentName = 0; ///
}

///
struct InputBindingInfo_t
{
	char[128] rchDevicePathName = 0; ///
	char[128] rchInputPathName = 0; ///
	char[128] rchModeName = 0; ///
	char[128] rchSlotName = 0; ///
	char[32] rchInputSourceType = 0; ///
}

///
struct VRActiveActionSet_t
{
	VRActionSetHandle_t ulActionSet; ///
	VRInputValueHandle_t ulRestrictedToDevice; ///
	VRActionSetHandle_t ulSecondaryActionSet; ///
	uint unPadding; ///
	int nPriority; ///
}

/// Contains summary information about the current skeletal pose
struct VRSkeletalSummaryData_t
{
	float[5] flFingerCurl = 0; /// Contains summary information about the current skeletal pose
	float[4] flFingerSplay = 0; /// Contains summary information about the current skeletal pose
}

///
struct SpatialAnchorPose_t
{
	HmdMatrix34_t mAnchorToAbsoluteTracking; ///
}

///
struct COpenVRContext
{
	IVRSystem m_pVRSystem; ///
	IVRChaperone m_pVRChaperone; ///
	IVRChaperoneSetup m_pVRChaperoneSetup; ///
	IVRCompositor m_pVRCompositor; ///
	IVRHeadsetView m_pVRHeadsetView; ///
	IVROverlay m_pVROverlay; ///
	IVROverlayView m_pVROverlayView; ///
	IVRResources m_pVRResources; ///
	IVRRenderModels m_pVRRenderModels; ///
	IVRExtendedDisplay m_pVRExtendedDisplay; ///
	IVRSettings m_pVRSettings; ///
	IVRApplications m_pVRApplications; ///
	IVRTrackedCamera m_pVRTrackedCamera; ///
	IVRScreenshots m_pVRScreenshots; ///
	IVRDriverManager m_pVRDriverManager; ///
	IVRInput m_pVRInput; ///
	IVRIOBuffer m_pVRIOBuffer; ///
	IVRSpatialAnchors m_pVRSpatialAnchors; ///
	IVRDebug m_pVRDebug; ///
	IVRNotifications m_pVRNotifications; ///
}

///
abstract class IVRSystem
{
	void GetRecommendedRenderTargetSize(uint* pnWidth, uint* pnHeight); /// Suggested size for the intermediate render target that the distortion pulls from.
	HmdMatrix44_t GetProjectionMatrix(EVREye eEye, float fNearZ, float fFarZ); /// The projection matrix for the specified eye
	void GetProjectionRaw(EVREye eEye, float* pfLeft, float* pfRight, float* pfTop, float* pfBottom); /// The components necessary to build your own projection matrix in case your application is doing something fancy like infinite Z
	bool ComputeDistortion(EVREye eEye, float fU, float fV, DistortionCoordinates_t* pDistortionCoordinates); /// Gets the result of the distortion function for the specified eye and input UVs. UVs go from 0,0 in the upper left of that eye's viewport and 1,1 in the lower right of that eye's viewport. Returns true for success. Otherwise, returns false, and distortion coordinates are not suitable.
	HmdMatrix34_t GetEyeToHeadTransform(EVREye eEye); /// Returns the transform from eye space to the head space. Eye space is the per-eye flavor of head space that provides stereo disparity. Instead of Model * View * Projection the sequence is Model * View * Eye^-1 * Projection. Normally View and Eye^-1 will be multiplied together and treated as View in your application.
	bool GetTimeSinceLastVsync(float* pfSecondsSinceLastVsync, ulong* pulFrameCounter); /// Returns the number of elapsed seconds since the last recorded vsync event. This will come from a vsync timer event in the timer if possible or from the application-reported time if that is not available. If no vsync times are available the function will return zero for vsync time and frame counter and return false from the method.
	/// [D3D9 Only]
	/// Returns the adapter index that the user should pass into CreateDevice to set up D3D9 in such a way that it can go full screen exclusive on the HMD. Returns -1 if there was an error.
	int GetD3D9AdapterIndex();
	/// [D3D10/11 Only]
	/// Returns the adapter index that the user should pass into EnumAdapters to create the device and swap chain in DX10 and DX11. If an error occurs the index will be set to -1.
	void GetDXGIOutputInfo(int* pnAdapterIndex);
	/// Returns platform- and texture-type specific adapter identification so that applications and the compositor are creating textures and swap chains on the same GPU. If an error occurs the device will be set to 0.
	/// pInstance is an optional parameter that is required only when textureType is TextureType_Vulkan.
	/// [D3D10/11/12 Only (D3D9 Not Supported)]
	///  Returns the adapter LUID that identifies the GPU attached to the HMD. The user should  enumerate all adapters using IDXGIFactory::EnumAdapters and IDXGIAdapter::GetDesc to find  the adapter with the matching LUID, or use IDXGIFactory4::EnumAdapterByLuid.
	///  The discovered IDXGIAdapter should be used to create the device and swap chain.
	/// [Vulkan Only]
	///  Returns the VkPhysicalDevice that should be used by the application.
	///  pInstance must be the instance the application will use to query for the VkPhysicalDevice.  The application must create the VkInstance with extensions returned by IVRCompositor::GetVulkanInstanceExtensionsRequired enabled.
	/// [macOS Only]
	///  For TextureType_IOSurface returns the id<MTLDevice> that should be used by the application.
	///  On 10.13+ for TextureType_OpenGL returns the 'registryId' of the renderer which should be used   by the application. See Apple Technical Q&A QA1168 for information on enumerating GL Renderers, and the new kCGLRPRegistryIDLow and kCGLRPRegistryIDHigh CGLRendererProperty values in the 10.13 SDK.
	///  Pre 10.13 for TextureType_OpenGL returns 0, as there is no dependable way to correlate the HMDs MTLDevice with a GL Renderer.
	void GetOutputDevice(ulong* pnDevice, ETextureType textureType, VkInstance_T pInstance);
	bool IsDisplayOnDesktop(); /// Use to determine if the headset display is part of the desktop (i.e. extended) or hidden (i.e. direct mode).
	bool SetDisplayVisibility(bool bIsVisibleOnDesktop); /// Set the display visibility (true = extended, false = direct mode).  Return value of true indicates that the change was successful.
	/// The pose that the tracker thinks that the HMD will be in at the specified number of seconds into the future. Pass 0 to get the state at the instant the method is called. Most of the time the application should calculate the time until the photons will be emitted from the display and pass that time into the method.
	/// This is roughly analogous to the inverse of the view matrix in most applications, though many games will need to do some additional rotation or translation on top of the rotation and translation provided by the head pose.
	/// For devices where bPoseIsValid is true the application can use the pose to position the device in question. The provided array can be any size up to k_unMaxTrackedDeviceCount. 
	/// Seated experiences should call this method with TrackingUniverseSeated and receive poses relative to the seated zero pose. Standing experiences should call this method with TrackingUniverseStanding and receive poses relative to the Chaperone Play Area. TrackingUniverseRawAndUncalibrated should probably not be used unless the application is the Chaperone calibration tool itself, but will provide poses relative to the hardware-specific coordinate system in the driver.
	void GetDeviceToAbsoluteTrackingPose(ETrackingUniverseOrigin eOrigin, float fPredictedSecondsToPhotonsFromNow, TrackedDevicePose_t* pTrackedDevicePoseArray, uint unTrackedDevicePoseArrayCount);
	/// Sets the zero pose for the seated tracker coordinate system to the current position and yaw of the HMD. After ResetSeatedZeroPose all GetDeviceToAbsoluteTrackingPose calls that pass TrackingUniverseSeated as the origin will be relative to this new zero pose. The new zero coordinate system will not change the fact that the Y axis is up in the real world, so the next pose returned from GetDeviceToAbsoluteTrackingPose after a call to ResetSeatedZeroPose may not be exactly an identity matrix.
	/// NOTE: This function overrides the user's previously saved seated zero pose and should only be called as the result of a user action. Users are also able to set their seated zero pose via the OpenVR Dashboard.
	void ResetSeatedZeroPose();
	/// Returns the transform from the seated zero pose to the standing absolute tracking system. This allows applications to represent the seated origin to used or transform object positions from one coordinate system to the other.
	/// The seated origin may or may not be inside the Play Area or Collision Bounds returned by IVRChaperone. Its position depends on what the user has set from the Dashboard settings and previous calls to ResetSeatedZeroPose.
	HmdMatrix34_t GetSeatedZeroPoseToStandingAbsoluteTrackingPose();
	HmdMatrix34_t GetRawZeroPoseToStandingAbsoluteTrackingPose(); /// Returns the transform from the tracking origin to the standing absolute tracking system. This allows applications to convert from raw tracking space to the calibrated standing coordinate system.
	uint GetSortedTrackedDeviceIndicesOfClass(ETrackedDeviceClass eTrackedDeviceClass, TrackedDeviceIndex_t* punTrackedDeviceIndexArray, uint unTrackedDeviceIndexArrayCount, TrackedDeviceIndex_t unRelativeToTrackedDeviceIndex); /// Get a sorted array of device indices of a given class of tracked devices (e.g. controllers).  Devices are sorted right to left relative to the specified tracked device (default: hmd -- pass in -1 for absolute tracking space).  Returns the number of devices in the list, or the size of the array needed if not large enough.
	EDeviceActivityLevel GetTrackedDeviceActivityLevel(TrackedDeviceIndex_t unDeviceId); /// Returns the level of activity on the device.
	void ApplyTransform(TrackedDevicePose_t* pOutputPose, const(TrackedDevicePose_t)* pTrackedDevicePose, const(HmdMatrix34_t)* pTransform); /// Convenience utility to apply the specified transform to the specified pose. This properly transforms all pose components, including velocity and angular velocity
	TrackedDeviceIndex_t GetTrackedDeviceIndexForControllerRole(ETrackedControllerRole unDeviceType); /// Returns the device index associated with a specific role, for example the left hand or the right hand. This function is deprecated in favor of the new IVRInput system.
	ETrackedControllerRole GetControllerRoleForTrackedDeviceIndex(TrackedDeviceIndex_t unDeviceIndex); /// Returns the controller type associated with a device index. This function is deprecated in favor of the new IVRInput system.
	/// Returns the device class of a tracked device. If there has not been a device connected in this slot
	/// since the application started this function will return TrackedDevice_Invalid. For previous detected
	/// devices the function will return the previously observed device class.
	/// To determine which devices exist on the system, just loop from 0 to k_unMaxTrackedDeviceCount and check
	/// the device class. Every device with something other than TrackedDevice_Invalid is associated with an 
	/// actual tracked device.
	ETrackedDeviceClass GetTrackedDeviceClass(TrackedDeviceIndex_t unDeviceIndex);
	bool IsTrackedDeviceConnected(TrackedDeviceIndex_t unDeviceIndex); /// Returns true if there is a device connected in this slot.
	bool GetBoolTrackedDeviceProperty(TrackedDeviceIndex_t unDeviceIndex, ETrackedDeviceProperty prop, ETrackedPropertyError* pError); /// Returns a bool property. If the device index is not valid or the property is not a bool type this function will return false.
	float GetFloatTrackedDeviceProperty(TrackedDeviceIndex_t unDeviceIndex, ETrackedDeviceProperty prop, ETrackedPropertyError* pError); /// Returns a float property. If the device index is not valid or the property is not a float type this function will return 0.
	int GetInt32TrackedDeviceProperty(TrackedDeviceIndex_t unDeviceIndex, ETrackedDeviceProperty prop, ETrackedPropertyError* pError); /// Returns an int property. If the device index is not valid or the property is not a int type this function will return 0.
	ulong GetUint64TrackedDeviceProperty(TrackedDeviceIndex_t unDeviceIndex, ETrackedDeviceProperty prop, ETrackedPropertyError* pError); /// Returns a uint64 property. If the device index is not valid or the property is not a uint64 type this function will return 0.
	HmdMatrix34_t GetMatrix34TrackedDeviceProperty(TrackedDeviceIndex_t unDeviceIndex, ETrackedDeviceProperty prop, ETrackedPropertyError* pError); /// Returns a matrix property. If the device index is not valid or the property is not a matrix type, this function will return identity.
	uint GetArrayTrackedDeviceProperty(TrackedDeviceIndex_t unDeviceIndex, ETrackedDeviceProperty prop, PropertyTypeTag_t propType, void* pBuffer, uint unBufferSize, ETrackedPropertyError* pError); /// Returns an array of one type of property. If the device index is not valid or the property is not a single value or an array of the specified type, this function will return 0. Otherwise it returns the number of bytes necessary to hold the array of properties. If unBufferSize is greater than the returned size and pBuffer is non-NULL, pBuffer is filled with the contents of array of properties.
	uint GetStringTrackedDeviceProperty(TrackedDeviceIndex_t unDeviceIndex, ETrackedDeviceProperty prop, char* pchValue, uint unBufferSize, ETrackedPropertyError* pError); /// Returns a string property. If the device index is not valid or the property is not a string type this function will return 0. Otherwise it returns the length of the number of bytes necessary to hold this string including the trailing null. Strings will always fit in buffers of k_unMaxPropertyStringSize characters.
	const(char)* GetPropErrorNameFromEnum(ETrackedPropertyError error); /// returns a string that corresponds with the specified property error. The string will be the name of the error enum value for all valid error codes
	bool PollNextEvent(VREvent_t* pEvent, uint uncbVREvent); /// Returns true and fills the event with the next event on the queue if there is one. If there are no events this method returns false. uncbVREvent should be the size in bytes of the VREvent_t struct
	/// Returns true and fills the event with the next event on the queue if there is one. If there are no events this method returns false. Fills in the pose of the associated tracked device in the provided pose struct. This pose will always be older than the call to this function and should not be used to render the device.
	/// uncbVREvent should be the size in bytes of the VREvent_t struct
	bool PollNextEventWithPose(ETrackingUniverseOrigin eOrigin, VREvent_t* pEvent, uint uncbVREvent, TrackedDevicePose_t* pTrackedDevicePose);
	const(char)* GetEventTypeNameFromEnum(EVREventType eType); /// returns the name of an EVREvent enum value
	/// Returns the hidden area mesh for the current HMD. The pixels covered by this mesh will never be seen by the user after the lens distortion is applied based on visibility to the panels. If this HMD does not have a hidden area mesh, the vertex data and count will be NULL and 0 respectively. This mesh is meant to be rendered into the stencil buffer (or into the depth buffer setting nearz) before rendering each eye's view.  This will improve performance by letting the GPU early-reject pixels the user will never see before running the pixel shader. 
	/// NOTE: Render this mesh with backface culling disabled since the winding order of the vertices can be different per-HMD or per-eye. Setting the bInverse argument to true will produce the visible area mesh that is commonly used in place of full-screen quads. The visible area mesh covers all of the pixels the hidden area mesh does not cover. Setting the bLineLoop argument will return a line loop of vertices in HiddenAreaMesh_t->pVertexData with HiddenAreaMesh_t->unTriangleCount set to the number of vertices.
	HiddenAreaMesh_t GetHiddenAreaMesh(EVREye eEye, EHiddenAreaMeshType type);
	bool GetControllerState(TrackedDeviceIndex_t unControllerDeviceIndex, VRControllerState_t* pControllerState, uint unControllerStateSize); /// Fills the supplied struct with the current state of the controller. Returns false if the controller index is invalid. This function is deprecated in favor of the new IVRInput system.
	bool GetControllerStateWithPose(ETrackingUniverseOrigin eOrigin, TrackedDeviceIndex_t unControllerDeviceIndex, VRControllerState_t* pControllerState, uint unControllerStateSize, TrackedDevicePose_t* pTrackedDevicePose); /// fills the supplied struct with the current state of the controller and the provided pose with the pose of  the controller when the controller state was updated most recently. Use this form if you need a precise controller pose as input to your application when the user presses or releases a button. This function is deprecated in favor of the new IVRInput system.
	void TriggerHapticPulse(TrackedDeviceIndex_t unControllerDeviceIndex, uint unAxisId, ushort usDurationMicroSec); /// Trigger a single haptic pulse on a controller. After this call the application may not trigger another haptic pulse on this controller and axis combination for 5ms. This function is deprecated in favor of the new IVRInput system.
	const(char)* GetButtonIdNameFromEnum(EVRButtonId eButtonId); /// returns the name of an EVRButtonId enum value. This function is deprecated in favor of the new IVRInput system.  
	const(char)* GetControllerAxisTypeNameFromEnum(EVRControllerAxisType eAxisType); /// returns the name of an EVRControllerAxisType enum value. This function is deprecated in favor of the new IVRInput system. 
	bool IsInputAvailable(); /// Returns true if this application is receiving input from the system. This would return false if system-related functionality is consuming the input stream. 
	bool IsSteamVRDrawingControllers(); /// Returns true SteamVR is drawing controllers on top of the application. Applications should consider not drawing anything attached to the user's hands in this case. 
	bool ShouldApplicationPause(); /// Returns true if the user has put SteamVR into a mode that is distracting them from the application. For applications where this is appropriate, the application should pause ongoing activity. 
	bool ShouldApplicationReduceRenderingWork(); /// Returns true if SteamVR is doing significant rendering work and the game should do what it can to reduce its own workload. One common way to do this is to reduce the size of the render target provided for each eye. 
	EVRFirmwareError PerformFirmwareUpdate(TrackedDeviceIndex_t unDeviceIndex); /// Performs the actual firmware update if applicable.  The following events will be sent, if VRFirmwareError_None was returned: VREvent_FirmwareUpdateStarted, VREvent_FirmwareUpdateFinished  Use the properties Prop_Firmware_UpdateAvailable_Bool, Prop_Firmware_ManualUpdate_Bool, and Prop_Firmware_ManualUpdateURL_String to figure our whether a firmware update is available, and to figure out whether its a manual update  Prop_Firmware_ManualUpdateURL_String should point to an URL describing the manual update process 
	void AcknowledgeQuit_Exiting(); /// Call this to acknowledge to the system that VREvent_Quit has been received and that the process is exiting. This extends the timeout until the process is killed. 
	uint GetAppContainerFilePaths(char* pchBuffer, uint unBufferSize); /// Retrieves a null-terminated, semicolon-delimited list of UTF8 file paths that an application  must have read access to when running inside of an app container. Returns the number of bytes needed to hold the list. 
	/// Returns the current version of the SteamVR runtime. The returned string will remain valid until VR_Shutdown is called.
	/// NOTE: Is it not appropriate to use this version to test for the presence of any SteamVR feature. Only use this version number for logging or showing to a user, and not to try to detect anything at runtime. When appropriate, feature-specific presence information is provided by other APIs. 
	const(char)* GetRuntimeVersion();
}

///
abstract class IVRExtendedDisplay
{
	void GetWindowBounds(int* pnX, int* pnY, uint* pnWidth, uint* pnHeight); /// Size and position that the window needs to be on the VR display.
	void GetEyeOutputViewport(EVREye eEye, uint* pnX, uint* pnY, uint* pnWidth, uint* pnHeight); /// Gets the viewport in the frame buffer to draw the output of the distortion into
	/// [D3D10/11 Only]
	/// Returns the adapter index and output index that the user should pass into EnumAdapters and EnumOutputs to create the device and swap chain in DX10 and DX11. If an error occurs both indices will be set to -1.
	void GetDXGIOutputInfo(int* pnAdapterIndex, int* pnAdapterOutputIndex);
}

///
abstract class IVRTrackedCamera
{
	const(char)* GetCameraErrorNameFromEnum(EVRTrackedCameraError eCameraError); /// Returns a string for an error
	EVRTrackedCameraError HasCamera(TrackedDeviceIndex_t nDeviceIndex, bool* pHasCamera); /// For convenience, same as tracked property request Prop_HasCamera_Bool
	EVRTrackedCameraError GetCameraFrameSize(TrackedDeviceIndex_t nDeviceIndex, EVRTrackedCameraFrameType eFrameType, uint* pnWidth, uint* pnHeight, uint* pnFrameBufferSize); /// Gets size of the image frame.
	EVRTrackedCameraError GetCameraIntrinsics(TrackedDeviceIndex_t nDeviceIndex, uint nCameraIndex, EVRTrackedCameraFrameType eFrameType, HmdVector2_t* pFocalLength, HmdVector2_t* pCenter); ///
	EVRTrackedCameraError GetCameraProjection(TrackedDeviceIndex_t nDeviceIndex, uint nCameraIndex, EVRTrackedCameraFrameType eFrameType, float flZNear, float flZFar, HmdMatrix44_t* pProjection); ///
	/// Acquiring streaming service permits video streaming for the caller. Releasing hints the system that video services do not need to be maintained for this client.
	/// If the camera has not already been activated, a one time spin up may incur some auto exposure as well as initial streaming frame delays.
	/// The camera should be considered a global resource accessible for shared consumption but not exclusive to any caller.
	/// The camera may go inactive due to lack of active consumers or headset idleness.
	EVRTrackedCameraError AcquireVideoStreamingService(TrackedDeviceIndex_t nDeviceIndex, TrackedCameraHandle_t* pHandle);
	EVRTrackedCameraError ReleaseVideoStreamingService(TrackedCameraHandle_t hTrackedCamera); ///
	/// Copies the image frame into a caller's provided buffer. The image data is currently provided as RGBA data, 4 bytes per pixel. 
	/// A caller can provide null for the framebuffer or frameheader if not desired. Requesting the frame header first, followed by the frame buffer allows the caller to determine if the frame as advanced per the frame header sequence.  
	/// If there is no frame available yet, due to initial camera spinup or re-activation, the error will be VRTrackedCameraError_NoFrameAvailable. 
	/// Ideally a caller should be polling at ~16ms intervals
	EVRTrackedCameraError GetVideoStreamFrameBuffer(TrackedCameraHandle_t hTrackedCamera, EVRTrackedCameraFrameType eFrameType, void* pFrameBuffer, uint nFrameBufferSize, CameraVideoStreamFrameHeader_t* pFrameHeader, uint nFrameHeaderSize);
	EVRTrackedCameraError GetVideoStreamTextureSize(TrackedDeviceIndex_t nDeviceIndex, EVRTrackedCameraFrameType eFrameType, VRTextureBounds_t* pTextureBounds, uint* pnWidth, uint* pnHeight); /// Gets size of the image frame.
	/// Access a shared D3D11 texture for the specified tracked camera stream. 
	/// The camera frame type VRTrackedCameraFrameType_Undistorted is not supported directly as a shared texture. It is an interior subregion of the shared texture VRTrackedCameraFrameType_MaximumUndistorted. 
	/// Instead, use GetVideoStreamTextureSize() with VRTrackedCameraFrameType_Undistorted to determine the proper interior subregion bounds along with GetVideoStreamTextureD3D11() with VRTrackedCameraFrameType_MaximumUndistorted to provide the texture. The VRTrackedCameraFrameType_MaximumUndistorted will yield an image where the invalid regions are decoded by the alpha channel having a zero component. The valid regions all have a non-zero alpha component. The subregion as described by VRTrackedCameraFrameType_Undistorted  guarantees a rectangle where all pixels are valid.
	EVRTrackedCameraError GetVideoStreamTextureD3D11(TrackedCameraHandle_t hTrackedCamera, EVRTrackedCameraFrameType eFrameType, void* pD3D11DeviceOrResource, void** ppD3D11ShaderResourceView, CameraVideoStreamFrameHeader_t* pFrameHeader, uint nFrameHeaderSize);
	EVRTrackedCameraError GetVideoStreamTextureGL(TrackedCameraHandle_t hTrackedCamera, EVRTrackedCameraFrameType eFrameType, glUInt_t* pglTextureId, CameraVideoStreamFrameHeader_t* pFrameHeader, uint nFrameHeaderSize); /// Access a shared GL texture for the specified tracked camera stream
	EVRTrackedCameraError ReleaseVideoStreamTextureGL(TrackedCameraHandle_t hTrackedCamera, glUInt_t glTextureId); ///
	void SetCameraTrackingSpace(ETrackingUniverseOrigin eUniverse); ///
	ETrackingUniverseOrigin GetCameraTrackingSpace(); ///
}

///
abstract class IVRApplications
{
	EVRApplicationError AddApplicationManifest(const(char)* pchApplicationManifestFullPath, bool bTemporary); /// Adds an application manifest to the list to load when building the list of installed applications. Temporary manifests are not automatically loaded 
	EVRApplicationError RemoveApplicationManifest(const(char)* pchApplicationManifestFullPath); /// Removes an application manifest from the list to load when building the list of installed applications. 
	bool IsApplicationInstalled(const(char)* pchAppKey); /// Returns true if an application is installed 
	uint GetApplicationCount(); /// Returns the number of applications available in the list 
	EVRApplicationError GetApplicationKeyByIndex(uint unApplicationIndex, char* pchAppKeyBuffer, uint unAppKeyBufferLen); /// Returns the key of the specified application. The index is at least 0 and is less than the return  value of GetApplicationCount(). The buffer should be at least k_unMaxApplicationKeyLength in order to  fit the key. 
	EVRApplicationError GetApplicationKeyByProcessId(uint unProcessId, char* pchAppKeyBuffer, uint unAppKeyBufferLen); /// Returns the key of the application for the specified Process Id. The buffer should be at least k_unMaxApplicationKeyLength in order to fit the key. 
	EVRApplicationError LaunchApplication(const(char)* pchAppKey); /// Launches the application. The existing scene application will exit and then the new application will start. This call is not valid for dashboard overlay applications. 
	EVRApplicationError LaunchTemplateApplication(const(char)* pchTemplateAppKey, const(char)* pchNewAppKey, const(AppOverrideKeys_t)* pKeys, uint unKeys); /// Launches an instance of an application of type template, with its app key being pchNewAppKey (which must be unique) and optionally override sections from the manifest file via AppOverrideKeys_t
	EVRApplicationError LaunchApplicationFromMimeType(const(char)* pchMimeType, const(char)* pchArgs); /// launches the application currently associated with this mime type and passes it the option args, typically the filename or object name of the item being launched 
	EVRApplicationError LaunchDashboardOverlay(const(char)* pchAppKey); /// Launches the dashboard overlay application if it is not already running. This call is only valid for dashboard overlay applications. 
	bool CancelApplicationLaunch(const(char)* pchAppKey); /// Cancel a pending launch for an application 
	EVRApplicationError IdentifyApplication(uint unProcessId, const(char)* pchAppKey); /// Identifies a running application. OpenVR can't always tell which process started in response to a URL. This function allows a URL handler (or the process itself) to identify the app key  for the now running application. Passing a process ID of 0 identifies the calling process.  The application must be one that's known to the system via a call to AddApplicationManifest. 
	uint GetApplicationProcessId(const(char)* pchAppKey); /// Returns the process ID for an application. Return 0 if the application was not found or is not running. 
	const(char)* GetApplicationsErrorNameFromEnum(EVRApplicationError error); /// Returns a string for an applications error 
	uint GetApplicationPropertyString(const(char)* pchAppKey, EVRApplicationProperty eProperty, char* pchPropertyValueBuffer, uint unPropertyValueBufferLen, EVRApplicationError* peError); /// Returns a value for an application property. The required buffer size to fit this value will be returned. 
	bool GetApplicationPropertyBool(const(char)* pchAppKey, EVRApplicationProperty eProperty, EVRApplicationError* peError); /// Returns a bool value for an application property. Returns false in all error cases. 
	ulong GetApplicationPropertyUint64(const(char)* pchAppKey, EVRApplicationProperty eProperty, EVRApplicationError* peError); /// Returns a uint64 value for an application property. Returns 0 in all error cases. 
	EVRApplicationError SetApplicationAutoLaunch(const(char)* pchAppKey, bool bAutoLaunch); /// Sets the application auto-launch flag. This is only valid for applications which return true for VRApplicationProperty_IsDashboardOverlay_Bool. 
	bool GetApplicationAutoLaunch(const(char)* pchAppKey); /// Gets the application auto-launch flag. This is only valid for applications which return true for VRApplicationProperty_IsDashboardOverlay_Bool. 
	EVRApplicationError SetDefaultApplicationForMimeType(const(char)* pchAppKey, const(char)* pchMimeType); /// Adds this mime-type to the list of supported mime types for this application
	bool GetDefaultApplicationForMimeType(const(char)* pchMimeType, char* pchAppKeyBuffer, uint unAppKeyBufferLen); /// return the app key that will open this mime type 
	bool GetApplicationSupportedMimeTypes(const(char)* pchAppKey, char* pchMimeTypesBuffer, uint unMimeTypesBuffer); /// Get the list of supported mime types for this application, comma-delimited 
	uint GetApplicationsThatSupportMimeType(const(char)* pchMimeType, char* pchAppKeysThatSupportBuffer, uint unAppKeysThatSupportBuffer); /// Get the list of app-keys that support this mime type, comma-delimited, the return value is number of bytes you need to return the full string 
	uint GetApplicationLaunchArguments(uint unHandle, char* pchArgs, uint unArgs); /// Get the args list from an app launch that had the process already running, you call this when you get a VREvent_ApplicationMimeTypeLoad 
	EVRApplicationError GetStartingApplication(char* pchAppKeyBuffer, uint unAppKeyBufferLen); /// Returns the app key for the application that is starting up 
	EVRSceneApplicationState GetSceneApplicationState(); /// Returns the application transition state 
	/// Returns errors that would prevent the specified application from launching immediately. Calling this function will cause the current scene application to quit, so only call it when you are actually about to launch something else. What the caller should do about these failures depends on the failure:
	///  VRApplicationError_OldApplicationQuitting - An existing application has been told to quit. Wait for a VREvent_ProcessQuit and try again.
	///  VRApplicationError_ApplicationAlreadyStarting - This application is already starting. This is a permanent failure.
	///  VRApplicationError_LaunchInProgress      - A different application is already starting. This is a permanent failure.
	///  VRApplicationError_None                   - Go ahead and launch. Everything is clear.
	EVRApplicationError PerformApplicationPrelaunchCheck(const(char)* pchAppKey);
	const(char)* GetSceneApplicationStateNameFromEnum(EVRSceneApplicationState state); /// Returns a string for an application transition state 
	EVRApplicationError LaunchInternalProcess(const(char)* pchBinaryPath, const(char)* pchArguments, const(char)* pchWorkingDirectory); /// Starts a subprocess within the calling application. This suppresses all application transition UI and automatically identifies the new executable  as part of the same application. On success the calling process should exit immediately.  If working directory is NULL or "" the directory portion of the binary path will be  the working directory. 
	uint GetCurrentSceneProcessId(); /// Returns the current scene process ID according to the application system. A scene process will get scene focus once it starts rendering, but it will appear here once it calls VR_Init with the Scene application type. 
}

///
abstract class IVRChaperone
{
	ChaperoneCalibrationState GetCalibrationState(); /// Get the current state of Chaperone calibration. This state can change at any time during a session due to physical base station changes.
	bool GetPlayAreaSize(float* pSizeX, float* pSizeZ); /// Returns the width and depth of the Play Area (formerly named Soft Bounds) in X and Z. Tracking space center (0,0,0) is the center of the Play Area.
	/// Returns the 4 corner positions of the Play Area (formerly named Soft Bounds).
	/// Corners are in counter-clockwise order.
	/// Standing center (0,0,0) is the center of the Play Area.
	/// It's a rectangle.
	/// 2 sides are parallel to the X axis and 2 sides are parallel to the Z axis.
	/// Height of every corner is 0Y (on the floor).
	bool GetPlayAreaRect(HmdQuad_t* rect);
	void ReloadInfo(); /// Reload Chaperone data from the .vrchap file on disk.
	void SetSceneColor(HmdColor_t color); /// Optionally give the chaperone system a hit about the color and brightness in the scene 
	void GetBoundsColor(HmdColor_t* pOutputColorArray, int nNumOutputColors, float flCollisionBoundsFadeDistance, HmdColor_t* pOutputCameraColor); /// Get the current chaperone bounds draw color and brightness 
	bool AreBoundsVisible(); /// Determine whether the bounds are showing right now 
	void ForceBoundsVisible(bool bForce); /// Force the bounds to show, mostly for utilities 
}

///
abstract class IVRChaperoneSetup
{
	bool CommitWorkingCopy(EChaperoneConfigFile configFile); /// Saves the current working copy to disk
	/// Reverts the working copy to match the live chaperone calibration.
	/// To modify existing data this MUST be do WHILE getting a non-error ChaperoneCalibrationStatus.
	/// Only after this should you do gets and sets on the existing data.
	void RevertWorkingCopy();
	bool GetWorkingPlayAreaSize(float* pSizeX, float* pSizeZ); /// Returns the width and depth of the Play Area (formerly named Soft Bounds) in X and Z from the working copy. Tracking space center (0,0,0) is the center of the Play Area.
	/// Returns the 4 corner positions of the Play Area (formerly named Soft Bounds) from the working copy.
	/// Corners are in clockwise order.
	/// Tracking space center (0,0,0) is the center of the Play Area.
	/// It's a rectangle.
	/// 2 sides are parallel to the X axis and 2 sides are parallel to the Z axis.
	/// Height of every corner is 0Y (on the floor).
	bool GetWorkingPlayAreaRect(HmdQuad_t* rect);
	bool GetWorkingCollisionBoundsInfo(HmdQuad_t* pQuadsBuffer, uint* punQuadsCount); /// Returns the number of Quads if the buffer points to null. Otherwise it returns Quads into the buffer up to the max specified from the working copy.
	bool GetLiveCollisionBoundsInfo(HmdQuad_t* pQuadsBuffer, uint* punQuadsCount); /// Returns the number of Quads if the buffer points to null. Otherwise it returns Quads into the buffer up to the max specified.
	bool GetWorkingSeatedZeroPoseToRawTrackingPose(HmdMatrix34_t* pmatSeatedZeroPoseToRawTrackingPose); /// Returns the preferred seated position from the working copy.
	bool GetWorkingStandingZeroPoseToRawTrackingPose(HmdMatrix34_t* pmatStandingZeroPoseToRawTrackingPose); /// Returns the standing origin from the working copy.
	void SetWorkingPlayAreaSize(float sizeX, float sizeZ); /// Sets the Play Area in the working copy.
	void SetWorkingCollisionBoundsInfo(HmdQuad_t* pQuadsBuffer, uint unQuadsCount); /// Sets the Collision Bounds in the working copy. Note: ceiling height is ignored.
	void SetWorkingPerimeter(HmdVector2_t* pPointBuffer, uint unPointCount); /// Sets the Collision Bounds in the working copy.
	void SetWorkingSeatedZeroPoseToRawTrackingPose(const(HmdMatrix34_t)* pMatSeatedZeroPoseToRawTrackingPose); /// Sets the preferred seated position in the working copy.
	void SetWorkingStandingZeroPoseToRawTrackingPose(const(HmdMatrix34_t)* pMatStandingZeroPoseToRawTrackingPose); /// Sets the preferred standing position in the working copy.
	void ReloadFromDisk(EChaperoneConfigFile configFile); /// Tear everything down and reload it from the file on disk
	bool GetLiveSeatedZeroPoseToRawTrackingPose(HmdMatrix34_t* pmatSeatedZeroPoseToRawTrackingPose); /// Returns the preferred seated position.
	bool ExportLiveToBuffer(char* pBuffer, uint* pnBufferLength); ///
	bool ImportFromBufferToWorking(const(char)* pBuffer, uint nImportFlags); ///
	void ShowWorkingSetPreview(); /// Shows the chaperone data in the working set to preview in the compositor.
	void HideWorkingSetPreview(); /// Hides the chaperone data in the working set to preview in the compositor (if it was visible).
	void RoomSetupStarting(); /// Fire an event that the tracking system can use to know room setup is about to begin. This lets the tracking system make any last minute adjustments that should be incorporated into the new setup.  If the user is adjusting live in HMD using a tweak tool, keep in mind that calling this might cause the user to see the room jump.
}

///
abstract class IVRCompositor
{
	void SetTrackingSpace(ETrackingUniverseOrigin eOrigin); /// Sets tracking space returned by WaitGetPoses
	ETrackingUniverseOrigin GetTrackingSpace(); /// Gets current tracking space returned by WaitGetPoses
	/// Scene applications should call this function to get poses to render with (and optionally poses predicted an additional frame out to use for gameplay). This function will block until "running start" milliseconds before the start of the frame, and should be called at the last moment before needing to start rendering.
	/// Return codes:
	///  - IsNotSceneApplication (make sure to call VR_Init with VRApplicaiton_Scene)
	///  - DoNotHaveFocus (some other app has taken focus - this will throttle the call to 10hz to reduce the impact on that app)
	EVRCompositorError WaitGetPoses(TrackedDevicePose_t* pRenderPoseArray, uint unRenderPoseArrayCount, TrackedDevicePose_t* pGamePoseArray, uint unGamePoseArrayCount);
	EVRCompositorError GetLastPoses(TrackedDevicePose_t* pRenderPoseArray, uint unRenderPoseArrayCount, TrackedDevicePose_t* pGamePoseArray, uint unGamePoseArrayCount); /// Get the last set of poses returned by WaitGetPoses.
	/// Interface for accessing last set of poses returned by WaitGetPoses one at a time.
	///  Returns VRCompositorError_IndexOutOfRange if unDeviceIndex not less than k_unMaxTrackedDeviceCount otherwise VRCompositorError_None.
	///  It is okay to pass NULL for either pose if you only want one of the values.
	EVRCompositorError GetLastPoseForTrackedDeviceIndex(TrackedDeviceIndex_t unDeviceIndex, TrackedDevicePose_t* pOutputPose, TrackedDevicePose_t* pOutputGamePose);
	/// Updated scene texture to display. If pBounds is NULL the entire texture will be used.  If called from an OpenGL app, consider adding a glFlush after Submitting both frames to signal the driver to start processing, otherwise it may wait until the command buffer fills up, causing the app to miss frames.
	///  OpenGL dirty state:
	///  glBindTexture
	///  Return codes:
	///  - IsNotSceneApplication (make sure to call VR_Init with VRApplicaiton_Scene)
	///  - DoNotHaveFocus (some other app has taken focus)
	///  - TextureIsOnWrongDevice (application did not use proper AdapterIndex - see IVRSystem.GetDXGIOutputInfo)
	///  - SharedTexturesNotSupported (application needs to call CreateDXGIFactory1 or later before creating DX device)
	///  - TextureUsesUnsupportedFormat (scene textures must be compatible with DXGI sharing rules - e.g. uncompressed, no mips, etc.)
	///  - InvalidTexture (usually means bad arguments passed in)
	///  - AlreadySubmitted (app has submitted two left textures or two right textures in a single frame - i.e. before calling WaitGetPoses again)
	EVRCompositorError Submit(EVREye eEye, const(Texture_t)* pTexture, const(VRTextureBounds_t)* pBounds, EVRSubmitFlags nSubmitFlags);
	void ClearLastSubmittedFrame(); /// Clears the frame that was sent with the last call to Submit. This will cause the compositor to show the grid until Submit is called again.
	void PostPresentHandoff(); /// Call immediately after presenting your app's window (i.e. companion window) to unblock the compositor. This is an optional call, which only needs to be used if you can't instead call WaitGetPoses immediately after Present. For example, if your engine's render and game loop are not on separate threads, or blocking the render thread until 3ms before the next vsync would introduce a deadlock of some sort.  This function tells the compositor that you have finished all rendering after having Submitted buffers for both eyes, and it is free to start its rendering work.  This should only be called from the same thread you are rendering on.
	bool GetFrameTiming(Compositor_FrameTiming* pTiming, uint unFramesAgo); /// Returns true if timing data is filled it.  Sets oldest timing info if nFramesAgo is larger than the stored history. Be sure to set timing.size = sizeof(Compositor_FrameTiming) on struct passed in before calling this function.
	uint GetFrameTimings(Compositor_FrameTiming* pTiming, uint nFrames); /// Interface for copying a range of timing data.  Frames are returned in ascending order (oldest to newest) with the last being the most recent frame. Only the first entry's m_nSize needs to be set, as the rest will be inferred from that.  Returns total number of entries filled out.
	float GetFrameTimeRemaining(); /// Returns the time in seconds left in the current (as identified by FrameTiming's frameIndex) frame. Due to "running start", this value may roll over to the next frame before ever reaching 0.0.
	void GetCumulativeStats(Compositor_CumulativeStats* pStats, uint nStatsSizeInBytes); /// Fills out stats accumulated for the last connected application.  Pass in sizeof( Compositor_CumulativeStats ) as second parameter.
	void FadeToColor(float fSeconds, float fRed, float fGreen, float fBlue, float fAlpha, bool bBackground); /// Fades the view on the HMD to the specified color. The fade will take fSeconds, and the color values are between 0.0 and 1.0. This color is faded on top of the scene based on the alpha parameter. Removing the fade color instantly  would be FadeToColor( 0.0, 0.0, 0.0, 0.0, 0.0 ).  Values are in un-premultiplied alpha space.
	HmdColor_t GetCurrentFadeColor(bool bBackground); /// Get current fade color value.
	void FadeGrid(float fSeconds, bool bFadeIn); /// Fading the Grid in or out in fSeconds
	float GetCurrentGridAlpha(); /// Get current alpha value of grid.
	EVRCompositorError SetSkyboxOverride(const(Texture_t)* pTextures, uint unTextureCount); /// Override the skybox used in the compositor (e.g. for during level loads when the app can't feed scene images fast enough) Order is Front, Back, Left, Right, Top, Bottom.  If only a single texture is passed, it is assumed in lat-long format. If two are passed, it is assumed a lat-long stereo pair.
	void ClearSkyboxOverride(); /// Resets compositor skybox back to defaults.
	void CompositorBringToFront(); /// Brings the compositor window to the front. This is useful for covering any other window that may be on the HMD and is obscuring the compositor window.
	void CompositorGoToBack(); /// Pushes the compositor window to the back. This is useful for allowing other applications to draw directly to the HMD.
	void CompositorQuit(); /// Tells the compositor process to clean up and exit. You do not need to call this function at shutdown. Under normal  circumstances the compositor will manage its own life cycle based on what applications are running.
	bool IsFullscreen(); /// Return whether the compositor is fullscreen
	uint GetCurrentSceneFocusProcess(); /// Returns the process ID of the process that is currently rendering the scene
	uint GetLastFrameRenderer(); /// Returns the process ID of the process that rendered the last frame (or 0 if the compositor itself rendered the frame.) Returns 0 when fading out from an app and the app's process Id when fading into an app.
	bool CanRenderScene(); /// Returns true if the current process has the scene focus
	void ShowMirrorWindow(); /// DEPRECATED: Opens the headset view (as either a window or docked widget depending on user's preferences) that displays what the user sees in the headset.
	void HideMirrorWindow(); /// DEPRECATED: Closes the headset view, either as a window or docked widget.
	bool IsMirrorWindowVisible(); /// DEPRECATED: Returns true if the headset view (either as a window or docked widget) is shown.
	void CompositorDumpImages(); /// Writes back buffer and stereo left/right pair from the application to a 'screenshots' folder in the SteamVR runtime root.
	bool ShouldAppRenderWithLowResources(); /// Let an app know it should be rendering with low resources.
	void ForceInterleavedReprojectionOn(bool bOverride); /// Override interleaved reprojection logic to force on.
	void ForceReconnectProcess(); /// Force reconnecting to the compositor process.
	void SuspendRendering(bool bSuspend); /// Temporarily suspends rendering (useful for finer control over scene transitions).
	EVRCompositorError GetMirrorTextureD3D11(EVREye eEye, void* pD3D11DeviceOrResource, void** ppD3D11ShaderResourceView); /// Opens a shared D3D11 texture with the undistorted composited image for each eye.  Use ReleaseMirrorTextureD3D11 when finished instead of calling Release on the resource itself.
	void ReleaseMirrorTextureD3D11(void* pD3D11ShaderResourceView); ///
	EVRCompositorError GetMirrorTextureGL(EVREye eEye, glUInt_t* pglTextureId, glSharedTextureHandle_t* pglSharedTextureHandle); /// Access to mirror textures from OpenGL.
	bool ReleaseSharedGLTexture(glUInt_t glTextureId, glSharedTextureHandle_t glSharedTextureHandle); ///
	void LockGLSharedTextureForAccess(glSharedTextureHandle_t glSharedTextureHandle); ///
	void UnlockGLSharedTextureForAccess(glSharedTextureHandle_t glSharedTextureHandle); ///
	/// [Vulkan Only]
	/// return 0. Otherwise it returns the length of the number of bytes necessary to hold this string including the trailing null.  The string will be a space separated list of-required instance extensions to enable in VkCreateInstance
	uint GetVulkanInstanceExtensionsRequired(char* pchValue, uint unBufferSize);
	/// [Vulkan only]
	/// return 0. Otherwise it returns the length of the number of bytes necessary to hold this string including the trailing null.  The string will be a space separated list of required device extensions to enable in VkCreateDevice
	uint GetVulkanDeviceExtensionsRequired(VkPhysicalDevice_T pPhysicalDevice, char* pchValue, uint unBufferSize);
	/// [ Vulkan/D3D12 Only ]
	/// There are two purposes for SetExplicitTimingMode:
	/// 1. To get a more accurate GPU timestamp for when the frame begins in Vulkan/D3D12 applications.
	/// 2. (Optional) To avoid having WaitGetPoses access the Vulkan queue so that the queue can be accessed from
	/// another thread while WaitGetPoses is executing.
	/// More accurate GPU timestamp for the start of the frame is achieved by the application calling SubmitExplicitTimingData immediately before its first submission to the Vulkan/D3D12 queue. This is more accurate because normally this GPU timestamp is recorded during WaitGetPoses.  In D3D11,  WaitGetPoses queues a GPU timestamp write, but it does not actually get submitted to the GPU until the  application flushes.  By using SubmitExplicitTimingData, the timestamp is recorded at the same place for  Vulkan/D3D12 as it is for D3D11, resulting in a more accurate GPU time measurement for the frame.
	/// Avoiding WaitGetPoses accessing the Vulkan queue can be achieved using SetExplicitTimingMode as well.  If this is desired, the application should set the timing mode to Explicit_ApplicationPerformsPostPresentHandoff and *MUSTcall PostPresentHandoff itself. If these conditions are met, then WaitGetPoses is guaranteed not to access the queue.  Note that PostPresentHandoff and SubmitExplicitTimingData will access the queue, so only WaitGetPoses becomes safe for accessing the queue from another thread.
	void SetExplicitTimingMode(EVRCompositorTimingMode eTimingMode);
	/// [ Vulkan/D3D12 Only ]
	/// Submit explicit timing data.  When SetExplicitTimingMode is true, this must be called immediately before the application's first vkQueueSubmit (Vulkan) or ID3D12CommandQueue::ExecuteCommandLists (D3D12) of each frame. This function will insert a GPU timestamp write just before the application starts its rendering.  This function will perform a vkQueueSubmit on Vulkan so must not be done simultaneously with VkQueue operations on another thread. Returns VRCompositorError_RequestFailed if SetExplicitTimingMode is not enabled.
	EVRCompositorError SubmitExplicitTimingData();
	bool IsMotionSmoothingEnabled(); /// Indicates whether or not motion smoothing is enabled by the user settings. If you want to know if motion smoothing actually triggered due to a late frame, check Compositor_FrameTiming m_nReprojectionFlags & VRCompositor_ReprojectionMotion instead.
	bool IsMotionSmoothingSupported(); /// Indicates whether or not motion smoothing is supported by the current hardware.
	bool IsCurrentSceneFocusAppLoading(); /// Indicates whether or not the current scene focus app is currently loading.  This is inferred from its use of FadeGrid to explicitly fade to the compositor to cover up the fact that it cannot render at a sustained full framerate during this time.
	EVRCompositorError SetStageOverride_Async(const(char)* pchRenderModelPath, const(HmdMatrix34_t)* pTransform, const(Compositor_StageRenderSettings)* pRenderSettings, uint nSizeOfRenderSettings); /// Override the stage model used in the compositor to replace the grid.  RenderModelPath is a full path the an OBJ file to load. This file will be loaded asynchronously from disk and uploaded to the gpu by the runtime.  Once ready for rendering, the VREvent StageOverrideReady will be sent.  Use FadeToGrid to reveal.  Call ClearStageOverride to free the associated resources when finished. const 
	void ClearStageOverride(); /// Resets the stage to its default user specified setting.
	bool GetCompositorBenchmarkResults(Compositor_BenchmarkResults* pBenchmarkResults, uint nSizeOfBenchmarkResults); /// Returns true if pBenchmarkResults is filled it.  Sets pBenchmarkResults with the result of the compositor benchmark. nSizeOfBenchmarkResults should be set to sizeof(Compositor_BenchmarkResults)
	EVRCompositorError GetLastPosePredictionIDs(uint* pRenderPosePredictionID, uint* pGamePosePredictionID); /// Returns the frame id associated with the poses last returned by WaitGetPoses.  Deltas between IDs correspond to number of headset vsync intervals.
	EVRCompositorError GetPosesForFrame(uint unPosePredictionID, TrackedDevicePose_t* pPoseArray, uint unPoseArrayCount); /// Get the most up-to-date predicted (or recorded - up to 100ms old) set of poses for a given frame id.
}

///
abstract class IVROverlay
{
	EVROverlayError FindOverlay(const(char)* pchOverlayKey, VROverlayHandle_t* pOverlayHandle); /// Finds an existing overlay with the specified key.
	EVROverlayError CreateOverlay(const(char)* pchOverlayKey, const(char)* pchOverlayName, VROverlayHandle_t* pOverlayHandle); /// Creates a new named overlay. All overlays start hidden and with default settings.
	EVROverlayError DestroyOverlay(VROverlayHandle_t ulOverlayHandle); /// Destroys the specified overlay. When an application calls VR_Shutdown all overlays created by that app are automatically destroyed.
	uint GetOverlayKey(VROverlayHandle_t ulOverlayHandle, char* pchValue, uint unBufferSize, EVROverlayError* pError); /// Fills the provided buffer with the string key of the overlay. Returns the size of buffer required to store the key, including the terminating null character. k_unVROverlayMaxKeyLength will be enough bytes to fit the string.
	uint GetOverlayName(VROverlayHandle_t ulOverlayHandle, char* pchValue, uint unBufferSize, EVROverlayError* pError); /// Fills the provided buffer with the friendly name of the overlay. Returns the size of buffer required to store the key, including the terminating null character. k_unVROverlayMaxNameLength will be enough bytes to fit the string.
	EVROverlayError SetOverlayName(VROverlayHandle_t ulOverlayHandle, const(char)* pchName); /// set the name to use for this overlay
	EVROverlayError GetOverlayImageData(VROverlayHandle_t ulOverlayHandle, void* pvBuffer, uint unBufferSize, uint* punWidth, uint* punHeight); /// Gets the raw image data from an overlay. Overlay image data is always returned as RGBA data, 4 bytes per pixel. If the buffer is not large enough, width and height  will be set and VROverlayError_ArrayTooSmall is returned.
	const(char)* GetOverlayErrorNameFromEnum(EVROverlayError error); /// returns a string that corresponds with the specified overlay error. The string will be the name  of the error enum value for all valid error codes
	EVROverlayError SetOverlayRenderingPid(VROverlayHandle_t ulOverlayHandle, uint unPID); /// Sets the pid that is allowed to render to this overlay (the creator pid is always allow to render), by default this is the pid of the process that made the overlay
	uint GetOverlayRenderingPid(VROverlayHandle_t ulOverlayHandle); /// Gets the pid that is allowed to render to this overlay
	EVROverlayError SetOverlayFlag(VROverlayHandle_t ulOverlayHandle, VROverlayFlags eOverlayFlag, bool bEnabled); /// Specify flag setting for a given overlay
	EVROverlayError GetOverlayFlag(VROverlayHandle_t ulOverlayHandle, VROverlayFlags eOverlayFlag, bool* pbEnabled); /// Sets flag setting for a given overlay
	EVROverlayError GetOverlayFlags(VROverlayHandle_t ulOverlayHandle, uint* pFlags); /// Gets all the flags for a given overlay
	EVROverlayError SetOverlayColor(VROverlayHandle_t ulOverlayHandle, float fRed, float fGreen, float fBlue); /// Sets the color tint of the overlay quad. Use 0.0 to 1.0 per channel.
	EVROverlayError GetOverlayColor(VROverlayHandle_t ulOverlayHandle, float* pfRed, float* pfGreen, float* pfBlue); /// Gets the color tint of the overlay quad.
	EVROverlayError SetOverlayAlpha(VROverlayHandle_t ulOverlayHandle, float fAlpha); /// Sets the alpha of the overlay quad. Use 1.0 for 100 percent opacity to 0.0 for 0 percent opacity.
	EVROverlayError GetOverlayAlpha(VROverlayHandle_t ulOverlayHandle, float* pfAlpha); /// Gets the alpha of the overlay quad. By default overlays are rendering at 100 percent alpha (1.0).
	EVROverlayError SetOverlayTexelAspect(VROverlayHandle_t ulOverlayHandle, float fTexelAspect); /// Sets the aspect ratio of the texels in the overlay. 1.0 means the texels are square. 2.0 means the texels are twice as wide as they are tall. Defaults to 1.0.
	EVROverlayError GetOverlayTexelAspect(VROverlayHandle_t ulOverlayHandle, float* pfTexelAspect); /// Gets the aspect ratio of the texels in the overlay. Defaults to 1.0
	/// Sets the rendering sort order for the overlay. Overlays are rendered this order:
	/// Overlays owned by the scene application
	/// Overlays owned by some other application
	/// Within a category overlays are rendered lowest sort order to highest sort order. Overlays with the same 
	/// sort order are rendered back to front base on distance from the HMD.
	/// Sort order defaults to 0.
	EVROverlayError SetOverlaySortOrder(VROverlayHandle_t ulOverlayHandle, uint unSortOrder);
	EVROverlayError GetOverlaySortOrder(VROverlayHandle_t ulOverlayHandle, uint* punSortOrder); /// Gets the sort order of the overlay. See SetOverlaySortOrder for how this works.
	EVROverlayError SetOverlayWidthInMeters(VROverlayHandle_t ulOverlayHandle, float fWidthInMeters); /// Sets the width of the overlay quad in meters. By default overlays are rendered on a quad that is 1 meter across
	EVROverlayError GetOverlayWidthInMeters(VROverlayHandle_t ulOverlayHandle, float* pfWidthInMeters); /// Returns the width of the overlay quad in meters. By default overlays are rendered on a quad that is 1 meter across
	EVROverlayError SetOverlayCurvature(VROverlayHandle_t ulOverlayHandle, float fCurvature); /// Use to draw overlay as a curved surface. Curvature is a percentage from (0..1] where 1 is a fully closed cylinder. For a specific radius, curvature can be computed as: overlay.width / (2 PI r).
	EVROverlayError GetOverlayCurvature(VROverlayHandle_t ulOverlayHandle, float* pfCurvature); /// Returns the curvature of the overlay as a percentage from (0..1] where 1 is a fully closed cylinder.
	EVROverlayError SetOverlayTextureColorSpace(VROverlayHandle_t ulOverlayHandle, EColorSpace eTextureColorSpace); /// Sets the colorspace the overlay texture's data is in.  Defaults to 'auto'. If the texture needs to be resolved, you should call SetOverlayTexture with the appropriate colorspace instead.
	EVROverlayError GetOverlayTextureColorSpace(VROverlayHandle_t ulOverlayHandle, EColorSpace* peTextureColorSpace); /// Gets the overlay's current colorspace setting.
	EVROverlayError SetOverlayTextureBounds(VROverlayHandle_t ulOverlayHandle, const(VRTextureBounds_t)* pOverlayTextureBounds); /// Sets the part of the texture to use for the overlay. UV Min is the upper left corner and UV Max is the lower right corner.
	EVROverlayError GetOverlayTextureBounds(VROverlayHandle_t ulOverlayHandle, VRTextureBounds_t* pOverlayTextureBounds); /// Gets the part of the texture to use for the overlay. UV Min is the upper left corner and UV Max is the lower right corner.
	EVROverlayError GetOverlayTransformType(VROverlayHandle_t ulOverlayHandle, VROverlayTransformType* peTransformType); /// Returns the transform type of this overlay.
	EVROverlayError SetOverlayTransformAbsolute(VROverlayHandle_t ulOverlayHandle, ETrackingUniverseOrigin eTrackingOrigin, const(HmdMatrix34_t)* pmatTrackingOriginToOverlayTransform); /// Sets the transform to absolute tracking origin.
	EVROverlayError GetOverlayTransformAbsolute(VROverlayHandle_t ulOverlayHandle, ETrackingUniverseOrigin* peTrackingOrigin, HmdMatrix34_t* pmatTrackingOriginToOverlayTransform); /// Gets the transform if it is absolute. Returns an error if the transform is some other type.
	EVROverlayError SetOverlayTransformTrackedDeviceRelative(VROverlayHandle_t ulOverlayHandle, TrackedDeviceIndex_t unTrackedDevice, const(HmdMatrix34_t)* pmatTrackedDeviceToOverlayTransform); /// Sets the transform to relative to the transform of the specified tracked device.
	EVROverlayError GetOverlayTransformTrackedDeviceRelative(VROverlayHandle_t ulOverlayHandle, TrackedDeviceIndex_t* punTrackedDevice, HmdMatrix34_t* pmatTrackedDeviceToOverlayTransform); /// Gets the transform if it is relative to a tracked device. Returns an error if the transform is some other type.
	EVROverlayError SetOverlayTransformTrackedDeviceComponent(VROverlayHandle_t ulOverlayHandle, TrackedDeviceIndex_t unDeviceIndex, const(char)* pchComponentName); /// Sets the transform to draw the overlay on a rendermodel component mesh instead of a quad. This will only draw when the system is drawing the device. Overlays with this transform type cannot receive mouse events.
	EVROverlayError GetOverlayTransformTrackedDeviceComponent(VROverlayHandle_t ulOverlayHandle, TrackedDeviceIndex_t* punDeviceIndex, char* pchComponentName, uint unComponentNameSize); /// Gets the transform information when the overlay is rendering on a component.
	EVROverlayError GetOverlayTransformOverlayRelative(VROverlayHandle_t ulOverlayHandle, VROverlayHandle_t* ulOverlayHandleParent, HmdMatrix34_t* pmatParentOverlayToOverlayTransform); /// Gets the transform if it is relative to another overlay. Returns an error if the transform is some other type.
	EVROverlayError SetOverlayTransformOverlayRelative(VROverlayHandle_t ulOverlayHandle, VROverlayHandle_t ulOverlayHandleParent, const(HmdMatrix34_t)* pmatParentOverlayToOverlayTransform); /// Sets the transform to relative to the transform of the specified overlay. This overlays visibility will also track the parents visibility
	EVROverlayError SetOverlayTransformCursor(VROverlayHandle_t ulCursorOverlayHandle, const(HmdVector2_t)* pvHotspot); /// Sets the hotspot for the specified overlay when that overlay is used as a cursor. These are in texture space with 0,0 in the upper left corner of the texture and 1,1 in the lower right corner of the texture.
	EVROverlayError GetOverlayTransformCursor(VROverlayHandle_t ulOverlayHandle, HmdVector2_t* pvHotspot); /// Gets cursor hotspot/transform for the specified overlay
	EVROverlayError ShowOverlay(VROverlayHandle_t ulOverlayHandle); /// Shows the VR overlay.  For dashboard overlays, only the Dashboard Manager is allowed to call this.
	EVROverlayError HideOverlay(VROverlayHandle_t ulOverlayHandle); /// Hides the VR overlay.  For dashboard overlays, only the Dashboard Manager is allowed to call this.
	bool IsOverlayVisible(VROverlayHandle_t ulOverlayHandle); /// Returns true if the overlay is visible.
	EVROverlayError GetTransformForOverlayCoordinates(VROverlayHandle_t ulOverlayHandle, ETrackingUniverseOrigin eTrackingOrigin, HmdVector2_t coordinatesInOverlay, HmdMatrix34_t* pmatTransform); /// Get the transform in 3d space associated with a specific 2d point in the overlay's coordinate space (where 0,0 is the lower left). -Z points out of the overlay
	bool PollNextOverlayEvent(VROverlayHandle_t ulOverlayHandle, VREvent_t* pEvent, uint uncbVREvent); /// Returns true and fills the event with the next event on the overlay's event queue, if there is one.  If there are no events this method returns false. uncbVREvent should be the size in bytes of the VREvent_t struct
	EVROverlayError GetOverlayInputMethod(VROverlayHandle_t ulOverlayHandle, VROverlayInputMethod* peInputMethod); /// Returns the current input settings for the specified overlay.
	EVROverlayError SetOverlayInputMethod(VROverlayHandle_t ulOverlayHandle, VROverlayInputMethod eInputMethod); /// Sets the input settings for the specified overlay.
	EVROverlayError GetOverlayMouseScale(VROverlayHandle_t ulOverlayHandle, HmdVector2_t* pvecMouseScale); /// Gets the mouse scaling factor that is used for mouse events. The actual texture may be a different size, but this is typically the size of the underlying UI in pixels.
	EVROverlayError SetOverlayMouseScale(VROverlayHandle_t ulOverlayHandle, const(HmdVector2_t)* pvecMouseScale); /// Sets the mouse scaling factor that is used for mouse events. The actual texture may be a different size, but this is typically the size of the underlying UI in pixels (not in world space).
	bool ComputeOverlayIntersection(VROverlayHandle_t ulOverlayHandle, const(VROverlayIntersectionParams_t)* pParams, VROverlayIntersectionResults_t* pResults); /// Computes the overlay-space pixel coordinates of where the ray intersects the overlay with the specified settings. Returns false if there is no intersection.
	bool IsHoverTargetOverlay(VROverlayHandle_t ulOverlayHandle); /// Returns true if the specified overlay is the hover target. An overlay is the hover target when it is the last overlay "moused over"  by the virtual mouse pointer
	EVROverlayError SetOverlayIntersectionMask(VROverlayHandle_t ulOverlayHandle, VROverlayIntersectionMaskPrimitive_t* pMaskPrimitives, uint unNumMaskPrimitives, uint unPrimitiveSize); /// Sets a list of primitives to be used for controller ray intersection typically the size of the underlying UI in pixels (not in world space).
	EVROverlayError TriggerLaserMouseHapticVibration(VROverlayHandle_t ulOverlayHandle, float fDurationSeconds, float fFrequency, float fAmplitude); /// Triggers a haptic event on the laser mouse controller for the specified overlay
	EVROverlayError SetOverlayCursor(VROverlayHandle_t ulOverlayHandle, VROverlayHandle_t ulCursorHandle); /// Sets the cursor to use for the specified overlay. This will be drawn instead of the generic blob when the laser mouse is pointed at the specified overlay
	EVROverlayError SetOverlayCursorPositionOverride(VROverlayHandle_t ulOverlayHandle, const(HmdVector2_t)* pvCursor); /// Sets the override cursor position to use for this overlay in overlay mouse coordinates. This position will be used to draw the cursor instead of whatever the laser mouse cursor position is.
	EVROverlayError ClearOverlayCursorPositionOverride(VROverlayHandle_t ulOverlayHandle); /// Clears the override cursor position for this overlay
	/// Texture to draw for the overlay. This function can only be called by the overlay's creator or renderer process (see SetOverlayRenderingPid) .
	/// OpenGL dirty state: glBindTexture
	EVROverlayError SetOverlayTexture(VROverlayHandle_t ulOverlayHandle, const(Texture_t)* pTexture);
	EVROverlayError ClearOverlayTexture(VROverlayHandle_t ulOverlayHandle); /// Use this to tell the overlay system to release the texture set for this overlay.
	EVROverlayError SetOverlayRaw(VROverlayHandle_t ulOverlayHandle, void* pvBuffer, uint unWidth, uint unHeight, uint unBytesPerPixel); /// Separate interface for providing the data as a stream of bytes, but there is an upper bound on data that can be sent. This function can only be called by the overlay's renderer process.
	/// Separate interface for providing the image through a filename: can be png or jpg, and should not be bigger than 1920x1080.
	/// This function can only be called by the overlay's renderer process
	EVROverlayError SetOverlayFromFile(VROverlayHandle_t ulOverlayHandle, const(char)* pchFilePath);
	/// Get the native texture handle/device for an overlay you have created. On windows this handle will be a ID3D11ShaderResourceView with a ID3D11Texture2D bound.
	/// The texture will always be sized to match the backing texture you supplied in SetOverlayTexture above.
	/// You MUST call ReleaseNativeOverlayHandle() with pNativeTextureHandle once you are done with this texture.
	/// pNativeTextureHandle is an OUTPUT, it will be a pointer to a ID3D11ShaderResourceView *. pNativeTextureRef is an INPUT and should be a ID3D11Resource *. The device used by pNativeTextureRef will be used to bind pNativeTextureHandle.
	EVROverlayError GetOverlayTexture(VROverlayHandle_t ulOverlayHandle, void** pNativeTextureHandle, void* pNativeTextureRef, uint* pWidth, uint* pHeight, uint* pNativeFormat, ETextureType* pAPIType, EColorSpace* pColorSpace, VRTextureBounds_t* pTextureBounds);
	EVROverlayError ReleaseNativeOverlayHandle(VROverlayHandle_t ulOverlayHandle, void* pNativeTextureHandle); /// Release the pNativeTextureHandle provided from the GetOverlayTexture call, this allows the system to free the underlying GPU resources for this object, so only do it once you stop rendering this texture.
	EVROverlayError GetOverlayTextureSize(VROverlayHandle_t ulOverlayHandle, uint* pWidth, uint* pHeight); /// Get the size of the overlay texture
	EVROverlayError CreateDashboardOverlay(const(char)* pchOverlayKey, const(char)* pchOverlayFriendlyName, VROverlayHandle_t* pMainHandle, VROverlayHandle_t* pThumbnailHandle); /// Creates a dashboard overlay and returns its handle
	bool IsDashboardVisible(); /// Returns true if the dashboard is visible
	bool IsActiveDashboardOverlay(VROverlayHandle_t ulOverlayHandle); /// returns true if the dashboard is visible and the specified overlay is the active system Overlay
	EVROverlayError SetDashboardOverlaySceneProcess(VROverlayHandle_t ulOverlayHandle, uint unProcessId); /// Sets the dashboard overlay to only appear when the specified process ID has scene focus
	EVROverlayError GetDashboardOverlaySceneProcess(VROverlayHandle_t ulOverlayHandle, uint* punProcessId); /// Gets the process ID that this dashboard overlay requires to have scene focus
	void ShowDashboard(const(char)* pchOverlayToShow); /// Shows the dashboard.
	TrackedDeviceIndex_t GetPrimaryDashboardDevice(); /// Returns the tracked device that has the laser pointer in the dashboard
	EVROverlayError ShowKeyboard(EGamepadTextInputMode eInputMode, EGamepadTextInputLineMode eLineInputMode, uint unFlags, const(char)* pchDescription, uint unCharMax, const(char)* pchExistingText, ulong uUserValue); /// Show the virtual keyboard to accept input. In most cases, you should pass KeyboardFlag_Modal to enable modal overlay behavior on the keyboard itself. See EKeyboardFlags for more.
	EVROverlayError ShowKeyboardForOverlay(VROverlayHandle_t ulOverlayHandle, EGamepadTextInputMode eInputMode, EGamepadTextInputLineMode eLineInputMode, uint unFlags, const(char)* pchDescription, uint unCharMax, const(char)* pchExistingText, ulong uUserValue); /// Show the virtual keyboard to accept input for an overlay. In most cases, you should pass KeyboardFlag_Modal to enable modal overlay behavior on the keyboard itself. See EKeyboardFlags for more.
	uint GetKeyboardText(char* pchText, uint cchText); /// Get the text that was entered into the text input
	void HideKeyboard(); /// Hide the virtual keyboard
	void SetKeyboardTransformAbsolute(ETrackingUniverseOrigin eTrackingOrigin, const(HmdMatrix34_t)* pmatTrackingOriginToKeyboardTransform); /// Set the position of the keyboard in world space
	void SetKeyboardPositionForOverlay(VROverlayHandle_t ulOverlayHandle, HmdRect2_t avoidRect); /// Set the position of the keyboard in overlay space by telling it to avoid a rectangle in the overlay. Rectangle coords have (0,0) in the bottom left *
	VRMessageOverlayResponse ShowMessageOverlay(const(char)* pchText, const(char)* pchCaption, const(char)* pchButton0Text, const(char)* pchButton1Text, const(char)* pchButton2Text, const(char)* pchButton3Text); /// Show the message overlay. This will block and return you a result.
	void CloseMessageOverlay(); /// If the calling process owns the overlay and it's open, this will close it.
}

///
abstract class IVROverlayView
{
	/// Acquire an OverlayView_t from an overlay handle
	/// The overlay view can be used to sample the contents directly by a native API. The contents of the OverlayView_t will remain unchanged through the lifetime of the OverlayView_t.
	/// The caller acquires read privileges over the OverlayView_t, but should not write to it.
	/// AcquireOverlayView() may be called on the same ulOverlayHandle multiple times to refresh the image contents. In this case the caller is strongly encouraged to re-use the same pOverlayView for all re-acquisition calls.
	/// If the producer has not yet queued an image, AcquireOverlayView will return success, and the Texture_t will have the expected ETextureType. However, the Texture_t->handle will be nullptr. Once the producer generates the first overlay frame, Texture_t->handle will become a valid handle.
	EVROverlayError AcquireOverlayView(VROverlayHandle_t ulOverlayHandle, VRNativeDevice_t* pNativeDevice, VROverlayView_t* pOverlayView, uint unOverlayViewSize);
	/// Release an acquired OverlayView_t
	/// Denotes that pOverlayView will no longer require access to the resources it acquired in all previous calls to AcquireOverlayView().
	/// All OverlayView_t*'s provided to AcquireOverlayView() as pOverlayViews must be passed into ReleaseOverlayView() in order for the underlying GPU resources to be freed.
	EVROverlayError ReleaseOverlayView(VROverlayView_t* pOverlayView);
	void PostOverlayEvent(VROverlayHandle_t ulOverlayHandle, const(VREvent_t)* pvrEvent); /// Posts an overlay event
	bool IsViewingPermitted(VROverlayHandle_t ulOverlayHandle); /// Determines whether this process is permitted to view an overlay's content.
}

///
abstract class IVRHeadsetView
{
	void SetHeadsetViewSize(uint nWidth, uint nHeight); /// Sets the resolution in pixels to render the headset view. These values are clamped to k_unHeadsetViewMaxWidth and k_unHeadsetViewMaxHeight respectively. For cropped views, the rendered output will be fit to aspect ratio defined by the the specified dimensions. For uncropped views, the caller should use GetHeadsetViewAspectRation to adjust the requested render size to avoid squashing or stretching, and then apply letterboxing to compensate when displaying the results.
	void GetHeadsetViewSize(uint* pnWidth, uint* pnHeight); /// Gets the current resolution used to render the headset view.
	void SetHeadsetViewMode(HeadsetViewMode_t eHeadsetViewMode); /// Set the mode used to render the headset view.
	HeadsetViewMode_t GetHeadsetViewMode(); /// Get the current mode used to render the headset view.
	void SetHeadsetViewCropped(bool bCropped); /// Set whether or not the headset view should be rendered cropped to hide the hidden area mesh or not.
	bool GetHeadsetViewCropped(); /// Get the current cropping status of the headset view.
	float GetHeadsetViewAspectRatio(); /// Get the aspect ratio (width:height) of the uncropped headset view (accounting for the current set mode).
	void SetHeadsetViewBlendRange(float flStartPct, float flEndPct); /// Set the range [0..1] that the headset view blends across the stereo overlapped area in cropped both mode.
	void GetHeadsetViewBlendRange(float* pStartPct, float* pEndPct); /// Get the current range [0..1] that the headset view blends across the stereo overlapped area in cropped both mode.
}

///
abstract class IVRRenderModels
{
	/// Loads and returns a render model for use in the application. pchRenderModelName should be a render model name from the Prop_RenderModelName_String property or an absolute path name to a render model on disk.
	/// The resulting render model is valid until VR_Shutdown() is called or until FreeRenderModel() is called. When the  application is finished with the render model it should call FreeRenderModel() to free the memory associated with the model.
	/// The method returns VRRenderModelError_Loading while the render model is still being loaded. The method returns VRRenderModelError_None once loaded successfully, otherwise will return an error.
	EVRRenderModelError LoadRenderModel_Async(const(char)* pchRenderModelName, RenderModel_t** ppRenderModel);
	/// Frees a previously returned render model
	/// It is safe to call this on a null ptr.
	void FreeRenderModel(RenderModel_t* pRenderModel);
	EVRRenderModelError LoadTexture_Async(TextureID_t textureId, RenderModel_TextureMap_t** ppTexture); /// Loads and returns a texture for use in the application.
	/// Frees a previously returned texture
	/// It is safe to call this on a null ptr.
	void FreeTexture(RenderModel_TextureMap_t* pTexture);
	EVRRenderModelError LoadTextureD3D11_Async(TextureID_t textureId, void* pD3D11Device, void** ppD3D11Texture2D); /// Creates a D3D11 texture and loads data into it.
	EVRRenderModelError LoadIntoTextureD3D11_Async(TextureID_t textureId, void* pDstTexture); /// Helper function to copy the bits into an existing texture.
	void FreeTextureD3D11(void* pD3D11Texture2D); /// Use this to free textures created with LoadTextureD3D11_Async instead of calling Release on them.
	/// Use this to get the names of available render models.  Index does not correlate to a tracked device index, but is only used for iterating over all available render models.  If the index is out of range, this function will return 0.
	/// Otherwise, it will return the size of the buffer required for the name.
	uint GetRenderModelName(uint unRenderModelIndex, char* pchRenderModelName, uint unRenderModelNameLen);
	uint GetRenderModelCount(); /// Returns the number of available render models.
	/// Returns the number of components of the specified render model. Components are useful when client application wish to draw, label, or otherwise interact with components of tracked objects. Examples controller components:
	///   renderable things such as triggers, buttons
	///   non-renderable things which include coordinate systems such as 'tip', 'base', a neutral controller agnostic hand-pose
	///   If all controller components are enumerated and rendered, it will be equivalent to drawing the traditional render model
	///   Returns 0 if components not supported, >0 otherwise
	uint GetComponentCount(const(char)* pchRenderModelName);
	/// Use this to get the names of available components.  Index does not correlate to a tracked device index, but is only used for iterating over all available components.  If the index is out of range, this function will return 0.
	/// Otherwise, it will return the size of the buffer required for the name.
	uint GetComponentName(const(char)* pchRenderModelName, uint unComponentIndex, char* pchComponentName, uint unComponentNameLen);
	/// Get the button mask for all buttons associated with this component
	/// If no buttons (or axes) are associated with this component, return 0
	/// Note: multiple components may be associated with the same button. Ex: two grip buttons on a single controller.
	/// Note: A single component may be associated with multiple buttons. Ex: A trackpad which also provides "D-pad" functionality
	ulong GetComponentButtonMask(const(char)* pchRenderModelName, const(char)* pchComponentName);
	/// Use this to get the render model name for the specified rendermode/component combination, to be passed to LoadRenderModel.
	/// If the component name is out of range, this function will return 0.
	/// Otherwise, it will return the size of the buffer required for the name.
	uint GetComponentRenderModelName(const(char)* pchRenderModelName, const(char)* pchComponentName, char* pchComponentRenderModelName, uint unComponentRenderModelNameLen);
	/// Use this to query information about the component, as a function of the controller state.
	/// For dynamic controller components (ex: trigger) values will reflect component motions
	/// For static components this will return a consistent value independent of the VRControllerState_t
	/// If the pchRenderModelName or pchComponentName is invalid, this will return false (and transforms will be set to identity).
	/// Otherwise, return true
	/// Note: For dynamic objects, visibility may be dynamic. (I.e., true/false will be returned based on controller state and controller mode state )
	bool GetComponentStateForDevicePath(const(char)* pchRenderModelName, const(char)* pchComponentName, VRInputValueHandle_t devicePath, const(RenderModel_ControllerMode_State_t)* pState, RenderModel_ComponentState_t* pComponentState);
	bool GetComponentState(const(char)* pchRenderModelName, const(char)* pchComponentName, const(VRControllerState_t)* pControllerState, const(RenderModel_ControllerMode_State_t)* pState, RenderModel_ComponentState_t* pComponentState); /// This version of GetComponentState takes a controller state block instead of an action origin. This function is deprecated. You should use the new input system and GetComponentStateForDevicePath instead.
	bool RenderModelHasComponent(const(char)* pchRenderModelName, const(char)* pchComponentName); /// Returns true if the render model has a component with the specified name
	uint GetRenderModelThumbnailURL(const(char)* pchRenderModelName, char* pchThumbnailURL, uint unThumbnailURLLen, EVRRenderModelError* peError); /// Returns the URL of the thumbnail image for this rendermodel
	uint GetRenderModelOriginalPath(const(char)* pchRenderModelName, char* pchOriginalPath, uint unOriginalPathLen, EVRRenderModelError* peError); /// Provides a render model path that will load the unskinned model if the model name provided has been replace by the user. If the model hasn't been replaced the path value will still be a valid path to load the model. Pass this to LoadRenderModel_Async, etc. to load the model.
	const(char)* GetRenderModelErrorNameFromEnum(EVRRenderModelError error); /// Returns a string for a render model error
}

///
abstract class IVRNotifications
{
	/// Create a notification and enqueue it to be shown to the user. An overlay handle is required to create a notification, as otherwise it would be impossible for a user to act on it. To create a two-line notification, use a line break ('
	/// ') to split the text into two lines. The pImage argument may be NULL, in which case the specified overlay's icon will be used instead.
	EVRNotificationError CreateNotification(VROverlayHandle_t ulOverlayHandle, ulong ulUserValue, EVRNotificationType type, const(char)* pchText, EVRNotificationStyle style, const(NotificationBitmap_t)* pImage, VRNotificationId* pNotificationId);
	EVRNotificationError RemoveNotification(VRNotificationId notificationId); /// Destroy a notification, hiding it first if it currently shown to the user.
}

///
abstract class IVRSettings
{
	const(char)* GetSettingsErrorNameFromEnum(EVRSettingsError eError); ///
	void SetBool(const(char)* pchSection, const(char)* pchSettingsKey, bool bValue, EVRSettingsError* peError); ///
	void SetInt32(const(char)* pchSection, const(char)* pchSettingsKey, int nValue, EVRSettingsError* peError); ///
	void SetFloat(const(char)* pchSection, const(char)* pchSettingsKey, float flValue, EVRSettingsError* peError); ///
	void SetString(const(char)* pchSection, const(char)* pchSettingsKey, const(char)* pchValue, EVRSettingsError* peError); ///
	bool GetBool(const(char)* pchSection, const(char)* pchSettingsKey, EVRSettingsError* peError); /// Users of the system need to provide a proper default in default.vrsettings in the resources/settings/ directory of either the runtime or the driver_xxx directory. Otherwise the default will be false, 0, 0.0 or ""
	int GetInt32(const(char)* pchSection, const(char)* pchSettingsKey, EVRSettingsError* peError); ///
	float GetFloat(const(char)* pchSection, const(char)* pchSettingsKey, EVRSettingsError* peError); ///
	void GetString(const(char)* pchSection, const(char)* pchSettingsKey, char* pchValue, uint unValueLen, EVRSettingsError* peError); ///
	void RemoveSection(const(char)* pchSection, EVRSettingsError* peError); ///
	void RemoveKeyInSection(const(char)* pchSection, const(char)* pchSettingsKey, EVRSettingsError* peError); ///
}

///
abstract class IVRScreenshots
{
	/// Request a screenshot of the requested type. A request of the VRScreenshotType_Stereo type will always work. Other types will depend on the underlying application support.
	///  The first file name is for the preview image and should be a regular screenshot (ideally from the left eye). The second is the VR screenshot in the correct format. They should be in the same aspect ratio.  Formats per type: VRScreenshotType_Mono: the VR filename is ignored (can be nullptr), this is a normal flat single shot. VRScreenshotType_Stereo:  The VR image should be a side-by-side with the left eye image on the left. VRScreenshotType_Cubemap: The VR image should be six square images composited horizontally.
	///  VRScreenshotType_StereoPanorama: above/below with left eye panorama being the above image.  Image is typically square with the panorama being 2x horizontal.
	///   Note that the VR dashboard will call this function when the user presses the screenshot binding (currently System Button + Trigger).  If Steam is running, the destination file names will be in %TEMP% and will be copied into Steam's screenshot library for the running application once SubmitScreenshot() is called.
	///  If Steam is not running, the paths will be in the user's documents folder under DocumentsSteamVRScreenshots. Other VR applications can call this to initiate a screenshot outside of user control.
	///  The destination file names do not need an extension, will be replaced with the correct one for the format which is currently .png.
	EVRScreenshotError RequestScreenshot(ScreenshotHandle_t* pOutScreenshotHandle, EVRScreenshotType type, const(char)* pchPreviewFilename, const(char)* pchVRFilename);
	/// Called by the running VR application to indicate that it wishes to be in charge of screenshots.  If the application does not call this, the Compositor will only support VRScreenshotType_Stereo screenshots that will be captured without notification to the running app.
	///  Once hooked your application will receive a VREvent_RequestScreenshot event when the user presses the buttons to take a screenshot. */
	EVRScreenshotError HookScreenshot(const(EVRScreenshotType)* pSupportedTypes, int numTypes);
	EVRScreenshotType GetScreenshotPropertyType(ScreenshotHandle_t screenshotHandle, EVRScreenshotError* pError); /// When your application receives a VREvent_RequestScreenshot event, call these functions to get the details of the screenshot request. */
	uint GetScreenshotPropertyFilename(ScreenshotHandle_t screenshotHandle, EVRScreenshotPropertyFilenames filenameType, char* pchFilename, uint cchFilename, EVRScreenshotError* pError); /// Get the filename for the preview or vr image (see vr::EScreenshotPropertyFilenames).  The return value is the size of the string.   */
	EVRScreenshotError UpdateScreenshotProgress(ScreenshotHandle_t screenshotHandle, float flProgress); /// Call this if the application is taking the screen shot will take more than a few ms processing. This will result in an overlay being presented that shows a completion bar. */
	/// Tells the compositor to take an internal screenshot of type VRScreenshotType_Stereo. It will take the current submitted scene textures of the running application and write them into the preview image and a side-by-side file for the VR image.
	///  This is similar to request screenshot, but doesn't ever talk to the application, just takes the shot and submits. */
	EVRScreenshotError TakeStereoScreenshot(ScreenshotHandle_t* pOutScreenshotHandle, const(char)* pchPreviewFilename, const(char)* pchVRFilename);
	/// Submit the completed screenshot.  If Steam is running this will call into the Steam client and upload the screenshot to the screenshots section of the library for the running application.  If Steam is not running, this function will display a notification to the user that the screenshot was taken. The paths should be full paths with extensions.
	///  File paths should be absolute including extensions. screenshotHandle can be k_unScreenshotHandleInvalid if this was a new shot taking by the app to be saved and not initiated by a user (achievement earned or something) */
	EVRScreenshotError SubmitScreenshot(ScreenshotHandle_t screenshotHandle, EVRScreenshotType type, const(char)* pchSourcePreviewFilename, const(char)* pchSourceVRFilename);
}

///
abstract class IVRResources
{
	/// Loads the specified resource into the provided buffer if large enough.
	/// Returns the size in bytes of the buffer required to hold the specified resource.
	uint LoadSharedResource(const(char)* pchResourceName, char* pchBuffer, uint unBufferLen);
	/// Provides the full path to the specified resource. Resource names can include named directories for drivers and other things, and this resolves all of those and returns the actual physical path.
	/// pchResourceTypeDirectory is the subdirectory of resources to look in.
	uint GetResourceFullPath(const(char)* pchResourceName, const(char)* pchResourceTypeDirectory, char* pchPathBuffer, uint unBufferLen);
}

///
abstract class IVRDriverManager
{
	uint GetDriverCount(); ///
	uint GetDriverName(DriverId_t nDriver, char* pchValue, uint unBufferSize); /// Returns the length of the number of bytes necessary to hold this string including the trailing null.
	DriverHandle_t GetDriverHandle(const(char)* pchDriverName); ///
	bool IsEnabled(DriverId_t nDriver); ///
}

///
abstract class IVRInput
{
	EVRInputError SetActionManifestPath(const(char)* pchActionManifestPath); /// Sets the path to the action manifest JSON file that is used by this application. If this information was set on the Steam partner site, calls to this function are ignored. If the Steam partner site setting and the path provided by this call are different, VRInputError_MismatchedActionManifest is returned.  This call must be made before the first call to UpdateActionState or IVRSystem::PollNextEvent.
	EVRInputError GetActionSetHandle(const(char)* pchActionSetName, VRActionSetHandle_t* pHandle); /// Returns a handle for an action set. This handle is used for all performance-sensitive calls.
	EVRInputError GetActionHandle(const(char)* pchActionName, VRActionHandle_t* pHandle); /// Returns a handle for an action. This handle is used for all performance-sensitive calls.
	EVRInputError GetInputSourceHandle(const(char)* pchInputSourcePath, VRInputValueHandle_t* pHandle); /// Returns a handle for any path in the input system. E.g. /user/hand/right
	EVRInputError UpdateActionState(VRActiveActionSet_t* pSets, uint unSizeOfVRSelectedActionSet_t, uint unSetCount); /// Reads the current state into all actions. After this call, the results of Get*Action calls  will be the same until the next call to UpdateActionState.
	EVRInputError GetDigitalActionData(VRActionHandle_t action, InputDigitalActionData_t* pActionData, uint unActionDataSize, VRInputValueHandle_t ulRestrictToDevice); /// Reads the state of a digital action given its handle. This will return VRInputError_WrongType if the type of action is something other than digital
	EVRInputError GetAnalogActionData(VRActionHandle_t action, InputAnalogActionData_t* pActionData, uint unActionDataSize, VRInputValueHandle_t ulRestrictToDevice); /// Reads the state of an analog action given its handle. This will return VRInputError_WrongType if the type of action is something other than analog
	EVRInputError GetPoseActionDataRelativeToNow(VRActionHandle_t action, ETrackingUniverseOrigin eOrigin, float fPredictedSecondsFromNow, InputPoseActionData_t* pActionData, uint unActionDataSize, VRInputValueHandle_t ulRestrictToDevice); /// Reads the state of a pose action given its handle for the number of seconds relative to now. This will generally be called with negative times from the fUpdateTime fields in other actions.
	EVRInputError GetPoseActionDataForNextFrame(VRActionHandle_t action, ETrackingUniverseOrigin eOrigin, InputPoseActionData_t* pActionData, uint unActionDataSize, VRInputValueHandle_t ulRestrictToDevice); /// Reads the state of a pose action given its handle. The returned values will match the values returned by the last call to IVRCompositor::WaitGetPoses().
	EVRInputError GetSkeletalActionData(VRActionHandle_t action, InputSkeletalActionData_t* pActionData, uint unActionDataSize); /// Reads the state of a skeletal action given its handle.
	EVRInputError GetDominantHand(ETrackedControllerRole* peDominantHand); /// Returns the current dominant hand for the user for this application. This function will only return success for applications which include "supports_dominant_hand_setting": true in their action manifests. The dominant hand will only change after a call to UpdateActionState, and the action data returned after that point will use the new dominant hand.
	EVRInputError SetDominantHand(ETrackedControllerRole eDominantHand); /// Sets the dominant hand for the user for this application.
	EVRInputError GetBoneCount(VRActionHandle_t action, uint* pBoneCount); /// Reads the number of bones in skeleton associated with the given action
	EVRInputError GetBoneHierarchy(VRActionHandle_t action, BoneIndex_t* pParentIndices, uint unIndexArayCount); /// Fills the given array with the index of each bone's parent in the skeleton associated with the given action
	EVRInputError GetBoneName(VRActionHandle_t action, BoneIndex_t nBoneIndex, char* pchBoneName, uint unNameBufferSize); /// Fills the given buffer with the name of the bone at the given index in the skeleton associated with the given action
	EVRInputError GetSkeletalReferenceTransforms(VRActionHandle_t action, EVRSkeletalTransformSpace eTransformSpace, EVRSkeletalReferencePose eReferencePose, VRBoneTransform_t* pTransformArray, uint unTransformArrayCount); /// Fills the given buffer with the transforms for a specific static skeletal reference pose
	EVRInputError GetSkeletalTrackingLevel(VRActionHandle_t action, EVRSkeletalTrackingLevel* pSkeletalTrackingLevel); /// Reads the level of accuracy to which the controller is able to track the user to recreate a skeletal pose
	EVRInputError GetSkeletalBoneData(VRActionHandle_t action, EVRSkeletalTransformSpace eTransformSpace, EVRSkeletalMotionRange eMotionRange, VRBoneTransform_t* pTransformArray, uint unTransformArrayCount); /// Reads the state of the skeletal bone data associated with this action and copies it into the given buffer.
	EVRInputError GetSkeletalSummaryData(VRActionHandle_t action, EVRSummaryType eSummaryType, VRSkeletalSummaryData_t* pSkeletalSummaryData); /// Reads summary information about the current pose of the skeleton associated with the given action.  
	EVRInputError GetSkeletalBoneDataCompressed(VRActionHandle_t action, EVRSkeletalMotionRange eMotionRange, void* pvCompressedData, uint unCompressedSize, uint* punRequiredCompressedSize); /// Reads the state of the skeletal bone data in a compressed form that is suitable for sending over the network. The required buffer size will never exceed ( sizeof(VR_BoneTransform_t)*boneCount + 2). Usually the size will be much smaller.
	EVRInputError DecompressSkeletalBoneData(const(void)* pvCompressedBuffer, uint unCompressedBufferSize, EVRSkeletalTransformSpace eTransformSpace, VRBoneTransform_t* pTransformArray, uint unTransformArrayCount); /// Turns a compressed buffer from GetSkeletalBoneDataCompressed and turns it back into a bone transform array.
	EVRInputError TriggerHapticVibrationAction(VRActionHandle_t action, float fStartSecondsFromNow, float fDurationSeconds, float fFrequency, float fAmplitude, VRInputValueHandle_t ulRestrictToDevice); /// Triggers a haptic event as described by the specified action
	EVRInputError GetActionOrigins(VRActionSetHandle_t actionSetHandle, VRActionHandle_t digitalActionHandle, VRInputValueHandle_t* originsOut, uint originOutCount); /// Retrieve origin handles for an action
	EVRInputError GetOriginLocalizedName(VRInputValueHandle_t origin, char* pchNameArray, uint unNameArraySize, int unStringSectionsToInclude); /// Retrieves the name of the origin in the current language. unStringSectionsToInclude is a bitfield of values in EVRInputStringBits that allows the application to specify which parts of the origin's information it wants a string for.
	EVRInputError GetOriginTrackedDeviceInfo(VRInputValueHandle_t origin, InputOriginInfo_t* pOriginInfo, uint unOriginInfoSize); /// Retrieves useful information for the origin of this action
	EVRInputError GetActionBindingInfo(VRActionHandle_t action, InputBindingInfo_t* pOriginInfo, uint unBindingInfoSize, uint unBindingInfoCount, uint* punReturnedBindingInfoCount); /// Retrieves useful information about the bindings for an action
	EVRInputError ShowActionOrigins(VRActionSetHandle_t actionSetHandle, VRActionHandle_t ulActionHandle); /// Shows the current binding for the action in-headset
	EVRInputError ShowBindingsForActionSet(VRActiveActionSet_t* pSets, uint unSizeOfVRSelectedActionSet_t, uint unSetCount, VRInputValueHandle_t originToHighlight); /// Shows the current binding all the actions in the specified action sets
	EVRInputError GetComponentStateForBinding(const(char)* pchRenderModelName, const(char)* pchComponentName, const(InputBindingInfo_t)* pOriginInfo, uint unBindingInfoSize, uint unBindingInfoCount, RenderModel_ComponentState_t* pComponentState); /// Use this to query what action on the component returned by GetOriginTrackedDeviceInfo would trigger this binding.
	bool IsUsingLegacyInput(); /// Legacy Input
	EVRInputError OpenBindingUI(const(char)* pchAppKey, VRActionSetHandle_t ulActionSetHandle, VRInputValueHandle_t ulDeviceHandle, bool bShowOnDesktop); /// Opens the binding user interface. If no app key is provided it will use the key from the calling process. If no set is provided it will open to the root of the app binding page.
	EVRInputError GetBindingVariant(VRInputValueHandle_t ulDevicePath, char* pchVariantArray, uint unVariantArraySize); /// Returns the variant set in the current bindings. If the binding doesn't include a variant setting, this function  will return an empty string
}

///
abstract class IVRIOBuffer
{
	EIOBufferError Open(const(char)* pchPath, EIOBufferMode mode, uint unElementSize, uint unElements, IOBufferHandle_t* pulBuffer); /// opens an existing or creates a new IOBuffer of unSize bytes
	EIOBufferError Close(IOBufferHandle_t ulBuffer); /// closes a previously opened or created buffer
	EIOBufferError Read(IOBufferHandle_t ulBuffer, void* pDst, uint unBytes, uint* punRead); /// reads up to unBytes from buffer into *pDst, returning number of bytes read in *punRead
	EIOBufferError Write(IOBufferHandle_t ulBuffer, void* pSrc, uint unBytes); /// writes unBytes of data from *pSrc into a buffer.
	PropertyContainerHandle_t PropertyContainer(IOBufferHandle_t ulBuffer); /// retrieves the property container of an buffer.
	bool HasReaders(IOBufferHandle_t ulBuffer); /// inexpensively checks for readers to allow writers to fast-fail potentially expensive copies and writes.
}

///
abstract class IVRSpatialAnchors
{
	EVRSpatialAnchorError CreateSpatialAnchorFromDescriptor(const(char)* pchDescriptor, SpatialAnchorHandle_t* pHandleOut); /// Returns a handle for an spatial anchor described by "descriptor".  On success, pHandle will contain a handle valid for this session.  Caller can wait for an event or occasionally poll GetSpatialAnchorPose() to find the virtual coordinate associated with this anchor.
	/// Returns a handle for an new spatial anchor at pPose.  On success, pHandle will contain a handle valid for this session.  Caller can wait for an event or occasionally poll GetSpatialAnchorDescriptor() to find the permanent descriptor for this pose. The result of GetSpatialAnchorPose() may evolve from this initial position if the driver chooses to update it.
	///  The anchor will be associated with the driver that provides unDeviceIndex, and the driver may use that specific device as a hint for how to best create the anchor.
	///  The eOrigin must match whatever tracking origin you are working in (seated/standing/raw). This should be called when the user is close to (and ideally looking at/interacting with) the target physical location.  At that moment, the driver will have the most information about how to recover that physical point in the future, and the quality of the anchor (when the descriptor is re-used) will be highest. The caller may decide to apply offsets from this initial pose, but is advised to stay relatively close to the  original pose location for highest fidelity.
	EVRSpatialAnchorError CreateSpatialAnchorFromPose(TrackedDeviceIndex_t unDeviceIndex, ETrackingUniverseOrigin eOrigin, SpatialAnchorPose_t* pPose, SpatialAnchorHandle_t* pHandleOut);
	EVRSpatialAnchorError GetSpatialAnchorPose(SpatialAnchorHandle_t unHandle, ETrackingUniverseOrigin eOrigin, SpatialAnchorPose_t* pPoseOut); /// Get the pose for a given handle.  This is intended to be cheap enough to call every frame (or fairly often) so that the driver can refine this position when it has more information available.
	/// Get the descriptor for a given handle.  This will be empty for handles where the driver has not yet built a descriptor.  It will be the application-supplied descriptor for previously saved anchors that the application is requesting poses for.  If the driver has called UpdateSpatialAnchorDescriptor() already in this session, it will be the descriptor provided by the driver.
	///  Returns true if the descriptor fits into the buffer, else false.  Buffer size should be at least k_unMaxSpatialAnchorDescriptorSize.
	EVRSpatialAnchorError GetSpatialAnchorDescriptor(SpatialAnchorHandle_t unHandle, char* pchDescriptorOut, uint* punDescriptorBufferLenInOut);
}

///
abstract class IVRDebug
{
	/// Create a vr profiler discrete event (point) 
	/// The event will be associated with the message provided in pchMessage, and the current time will be used as the event timestamp.
	EVRDebugError EmitVrProfilerEvent(const(char)* pchMessage);
	/// Create an vr profiler duration event (line) 
	/// The current time will be used as the timestamp for the start of the line. On success, pHandleOut will contain a handle valid for terminating this event.
	EVRDebugError BeginVrProfilerEvent(VrProfilerEventHandle_t* pHandleOut);
	/// Terminate a vr profiler event 
	/// The event associated with hHandle will be considered completed when this method is called. The current time will be used assocaited to the termination time of the event, and pchMessage will be used as the event title.
	EVRDebugError FinishVrProfilerEvent(VrProfilerEventHandle_t hHandle, const(char)* pchMessage);
	uint DriverDebugRequest(TrackedDeviceIndex_t unDeviceIndex, const(char)* pchRequest, char* pchResponseBuffer, uint unResponseBufferSize); /// Sends a request to the driver for the specified device and returns the response. The maximum response size is 32k, but this method can be called with a smaller buffer. If the response exceeds the size of the buffer, it is truncated. The size of the response including its terminating null is returned.
}

