import sys
import time
import ctypes
import threading
import os

#Windows
dll_name = "libPlanetCNCLibRPi.so" 
dll_path = "/home/pi/PlanetCNC"

#Linux
#dll_name = "libPlanetCNCLibL64.so"
#dll_path = "/home/muc/PlanetCNC/"

#RPi
#dll_name = "libPlanetCNCLibRPi.so"
#dll_path = "/home/pi/PlanetCNC/"

os.environ["PATH"] += os.pathsep + dll_path
API = ctypes.CDLL('/home/pi/PlanetCNC/libPlanetCNCLibRPi.so', mode=1) 

# Memory
API.FreeString.argtypes = [ctypes.POINTER(ctypes.c_char_p)]
API.FreeString.restype = None
API.FreeStringW.argtypes = [ctypes.POINTER(ctypes.c_wchar_p)]
API.FreeStringW.restype = None

# Run & Exit
API.Run.argtypes = [ctypes.c_bool]
API.Run.restype = ctypes.c_int

API.RunProfile.argtypes = [ctypes.c_bool, ctypes.c_char_p]
API.RunProfile.restype = ctypes.c_int
API.RunProfileW.argtypes = [ctypes.c_bool, ctypes.c_wchar_p]
API.RunProfileW.restype = ctypes.c_int

API.Exit.argtypes = []
API.Exit.restype = None
API.ExitForce.argtypes = []
API.ExitForce.restype = None

# Run status
API.GetVer.argtypes = []
API.GetVer.restype = ctypes.c_int
API.IsRunning.argtypes = []
API.IsRunning.restype = ctypes.c_bool
API.IsRunningExt.argtypes = []
API.IsRunningExt.restype = ctypes.c_bool
API.IsInitialized.argtypes = []
API.IsInitialized.restype = ctypes.c_bool

# Version & Profile Info
API.GetVersionString.argtypes = []
API.GetVersionString.restype = ctypes.c_char_p
API.GetVersionStringW.argtypes = []
API.GetVersionStringW.restype = ctypes.c_wchar_p

API.GetProfileNameString.argtypes = []
API.GetProfileNameString.restype = ctypes.c_char_p
API.GetProfileNameStringW.argtypes = []
API.GetProfileNameStringW.restype = ctypes.c_wchar_p

API.GetDescriptionString.argtypes = []
API.GetDescriptionString.restype = ctypes.c_char_p
API.GetDescriptionStringW.argtypes = []
API.GetDescriptionStringW.restype = ctypes.c_wchar_p

# Screen
API.IsVisible.argtypes = []
API.IsVisible.restype = ctypes.c_bool
API.Show.argtypes = []
API.Show.restype = ctypes.c_bool
API.Hide.argtypes = []
API.Hide.restype = ctypes.c_bool

API.SetProgress.argtypes = [ctypes.c_double]
API.SetProgress.restype = ctypes.c_bool

API.SetStatus.argtypes = [ctypes.c_char_p]
API.SetStatus.restype = ctypes.c_bool
API.SetStatusW.argtypes = [ctypes.c_wchar_p]
API.SetStatusW.restype = ctypes.c_bool

# Parameters & Eval
API.GetParam.argtypes = [ctypes.c_char_p]
API.GetParam.restype = ctypes.c_double
API.GetParamW.argtypes = [ctypes.c_wchar_p]
API.GetParamW.restype = ctypes.c_double

API.SetParam.argtypes = [ctypes.c_char_p, ctypes.c_double]
API.SetParam.restype = ctypes.c_bool
API.SetParamW.argtypes = [ctypes.c_wchar_p, ctypes.c_double]
API.SetParamW.restype = ctypes.c_bool

API.Evaluate.argtypes = [ctypes.c_char_p]
API.Evaluate.restype = ctypes.c_double
API.EvaluateW.argtypes = [ctypes.c_wchar_p]
API.EvaluateW.restype = ctypes.c_double

# State
API.IsLicenseValid.argtypes = []
API.IsLicenseValid.restype = ctypes.c_bool
API.IsUIReady.argtypes = []
API.IsUIReady.restype = ctypes.c_bool
API.IsControllerReady.argtypes = []
API.IsControllerReady.restype = ctypes.c_bool
API.IsControllerRunning.argtypes = []
API.IsControllerRunning.restype = ctypes.c_bool
API.IsProgramLoaded.argtypes = []
API.IsProgramLoaded.restype = ctypes.c_bool

API.IsIdle.argtypes = []
API.IsIdle.restype = ctypes.c_bool
API.IsEStop.argtypes = []
API.IsEStop.restype = ctypes.c_bool
API.IsStop.argtypes = []
API.IsStop.restype = ctypes.c_bool
API.IsPause.argtypes = []
API.IsPause.restype = ctypes.c_bool

# Machine Command status
API.IsEStopEnabled.argtypes = []
API.IsEStopEnabled.restype = ctypes.c_bool
API.IsStopEnabled.argtypes = []
API.IsStopEnabled.restype = ctypes.c_bool
API.IsPauseEnabled.argtypes = []
API.IsPauseEnabled.restype = ctypes.c_bool
API.IsStartEnabled.argtypes = []
API.IsStartEnabled.restype = ctypes.c_bool
API.IsOutputEnabled.argtypes = []
API.IsOutputEnabled.restype = ctypes.c_bool
API.IsCodeEnabled.argtypes = []
API.IsCodeEnabled.restype = ctypes.c_bool
API.IsCodeExEnabled.argtypes = []
API.IsCodeExEnabled.restype = ctypes.c_bool

API.IsOpenEnabled.argtypes = []
API.IsOpenEnabled.restype = ctypes.c_bool
API.IsCloseEnabled.argtypes = []
API.IsCloseEnabled.restype = ctypes.c_bool

# Machine Commands
API.EStop.argtypes = [ctypes.c_bool]
API.EStop.restype = ctypes.c_bool
API.EStopToggle.argtypes = []
API.EStopToggle.restype = ctypes.c_bool
API.Stop.argtypes = []
API.Stop.restype = ctypes.c_bool
API.Pause.argtypes = [ctypes.c_bool]
API.Pause.restype = ctypes.c_bool
API.PauseToggle.argtypes = []
API.PauseToggle.restype = ctypes.c_bool
API.Start.argtypes = []
API.Start.restype = ctypes.c_bool
API.Open.argtypes = []
API.Open.restype = ctypes.c_bool
API.Close.argtypes = []
API.Close.restype = ctypes.c_bool

# Machine Commands Generic
API.GetCmdCount.argtypes = []
API.GetCmdCount.restype = ctypes.c_int
API.GetCmdId.argtypes = [ctypes.c_char_p]
API.GetCmdId.restype = ctypes.c_int
API.GetCmdIdW.argtypes = [ctypes.c_wchar_p]
API.GetCmdIdW.restype = ctypes.c_int

API.GetCmdIdFromMdi.argtypes = [ctypes.c_char_p]
API.GetCmdIdFromMdi.restype = ctypes.c_int
API.GetCmdIdFromMdiW.argtypes = [ctypes.c_wchar_p]
API.GetCmdIdFromMdiW.restype = ctypes.c_int

API.IsCmdEnabled.argtypes = [ctypes.c_int]
API.IsCmdEnabled.restype = ctypes.c_bool
API.IsCmdChecked.argtypes = [ctypes.c_int]
API.IsCmdChecked.restype = ctypes.c_bool

API.GetCmdName.argtypes = [ctypes.c_int]
API.GetCmdName.restype = ctypes.POINTER(ctypes.c_char_p)
API.GetCmdNameW.argtypes = [ctypes.c_int]
API.GetCmdNameW.restype = ctypes.POINTER(ctypes.c_wchar_p)
API.GetCmdDisplayName.argtypes = [ctypes.c_int]
API.GetCmdDisplayName.restype = ctypes.POINTER(ctypes.c_char_p)
API.GetCmdDisplayNameW.argtypes = [ctypes.c_int]
API.GetCmdDisplayNameW.restype = ctypes.POINTER(ctypes.c_wchar_p)
API.GetCmdDisplayNameWithPath.argtypes = [ctypes.c_int]
API.GetCmdDisplayNameWithPath.restype = ctypes.POINTER(ctypes.c_char_p)
API.GetCmdDisplayNameWithPathW.argtypes = [ctypes.c_int]
API.GetCmdDisplayNameWithPathW.restype = ctypes.POINTER(ctypes.c_wchar_p)

API.CmdExec.argtypes = [ctypes.c_int]
API.CmdExec.restype = ctypes.c_bool

API.CmdExecStr.argtypes = [ctypes.c_int, ctypes.c_char_p]
API.CmdExecStr.restype = ctypes.c_bool
API.CmdExecStrW.argtypes = [ctypes.c_int, ctypes.c_wchar_p]
API.CmdExecStrW.restype = ctypes.c_bool
API.CmdExecVal.argtypes = [ctypes.c_int, ctypes.c_double]
API.CmdExecVal.restype = ctypes.c_bool
API.CmdExecIntVal.argtypes = [ctypes.c_int, ctypes.c_int, ctypes.c_double]
API.CmdExecIntVal.restype = ctypes.c_bool

#Helpers
API.OpenFn.argtypes = [ctypes.c_char_p]
API.OpenFn.restype = ctypes.c_int
API.OpenFnW.argtypes = [ctypes.c_wchar_p]
API.OpenFnW.restype = ctypes.c_int

API.OpenCode.argtypes = [ctypes.c_char_p]
API.OpenCode.restype = ctypes.c_int
API.OpenCodeW.argtypes = [ctypes.c_wchar_p]
API.OpenCodeW.restype = ctypes.c_int

API.TestFn.argtypes = [ctypes.c_char_p]
API.TestFn.restype = ctypes.c_int
API.TestFnW.argtypes = [ctypes.c_wchar_p]
API.TestFnW.restype = ctypes.c_int

API.TestCode.argtypes = [ctypes.c_char_p]
API.TestCode.restype = ctypes.c_int
API.TestCodeW.argtypes = [ctypes.c_wchar_p]
API.TestCodeW.restype = ctypes.c_int

API.StartFn.argtypes = [ctypes.c_char_p]
API.StartFn.restype = ctypes.c_bool
API.StartFnW.argtypes = [ctypes.c_wchar_p]
API.StartFnW.restype = ctypes.c_bool

API.StartCode.argtypes = [ctypes.c_char_p]
API.StartCode.restype = ctypes.c_bool
API.StartCodeW.argtypes = [ctypes.c_wchar_p]
API.StartCodeW.restype = ctypes.c_bool


#Info
API.InfoIsInitialized.argtypes = []
API.InfoIsInitialized.restype = ctypes.c_bool
API.InfoSerial.argtypes = []
API.InfoSerial.restype = ctypes.c_int
API.InfoHWVersion.argtypes = []
API.InfoHWVersion.restype = ctypes.c_int
API.InfoSWVersion.argtypes = []
API.InfoSWVersion.restype = ctypes.c_int
API.InfoIsVersionValid.argtypes = []
API.InfoIsVersionValid.restype = ctypes.c_bool

API.InfoWorkPosition.argtypes = [ctypes.c_int]
API.InfoWorkPosition.restype = ctypes.c_double
API.InfoWorkPosition3.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
API.InfoWorkPosition3.restype = ctypes.c_bool
API.InfoWorkPosition9.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
API.InfoWorkPosition9.restype = ctypes.c_bool

API.InfoMotorPosition.argtypes = [ctypes.c_int]
API.InfoMotorPosition.restype = ctypes.c_double
API.InfoMotorPosition3.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
API.InfoMotorPosition3.restype = ctypes.c_bool
API.InfoMotorPosition9.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
API.InfoMotorPosition9.restype = ctypes.c_bool

API.InfoWorkUnitsPosition.argtypes = [ctypes.c_int]
API.InfoWorkUnitsPosition.restype = ctypes.c_double
API.InfoWorkUnitsPosition3.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
API.InfoWorkUnitsPosition3.restype = ctypes.c_bool
API.InfoWorkUnitsPosition9.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
API.InfoWorkUnitsPosition9.restype = ctypes.c_bool

API.InfoMotorUnitsPosition.argtypes = [ctypes.c_int]
API.InfoMotorUnitsPosition.restype = ctypes.c_double
API.InfoMotorUnitsPosition3.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
API.InfoMotorUnitsPosition3.restype = ctypes.c_bool
API.InfoMotorUnitsPosition9.argtypes = [ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double), ctypes.POINTER(ctypes.c_double)]
API.InfoMotorUnitsPosition9.restype = ctypes.c_bool

API.InfoSpeed.argtypes = []
API.InfoSpeed.restype = ctypes.c_double
API.InfoAcceleration.argtypes = []
API.InfoAcceleration.restype = ctypes.c_double
API.InfoSpindle.argtypes = []
API.InfoSpindle.restype = ctypes.c_double
API.InfoSpindleIdx.argtypes = []
API.InfoSpindleIdx.restype = ctypes.c_double
API.InfoSpindleEnc.argtypes = []
API.InfoSpindleEnc.restype = ctypes.c_double
API.InfoSpindleSet.argtypes = []
API.InfoSpindleSet.restype = ctypes.c_double

API.InfoInput.argtypes = []
API.InfoInput.restype = ctypes.c_uint
API.InfoJog.argtypes = []
API.InfoJog.restype = ctypes.c_uint
API.InfoJogPot.argtypes = []
API.InfoJogPot.restype = ctypes.c_uint
API.InfoLimit.argtypes = []
API.InfoLimit.restype = ctypes.c_uint
API.InfoOutput.argtypes = []
API.InfoOutput.restype = ctypes.c_uint
API.InfoOutputFreq.argtypes = [ctypes.c_int]
API.InfoOutputFreq.restype = ctypes.c_uint
API.InfoOutputDuty.argtypes = [ctypes.c_int]
API.InfoOutputDuty.restype = ctypes.c_uint
API.InfoAux.argtypes = [ctypes.c_int]
API.InfoAux.restype = ctypes.c_uint
API.InfoBufferAvailable.argtypes = []
API.InfoBufferAvailable.restype = ctypes.c_uint
API.InfoBufferUtilization.argtypes = []
API.InfoBufferUtilization.restype = ctypes.c_double
	

#Callbacks
__TNGCallbackList = [] 

OnInitialiseCBType = ctypes.CFUNCTYPE(None, ctypes.c_int)
API.SetInitialiseCB.argtypes = [OnInitialiseCBType]
API.SetInitialiseCB.restype = None

OnRefreshCBType = ctypes.CFUNCTYPE(None)
API.SetRefreshCB.argtypes = [OnRefreshCBType]
API.SetRefreshCB.restype = None

OnOpenCBType = ctypes.CFUNCTYPE(None, ctypes.c_int)
API.SetOpenCB.argtypes = [OnOpenCBType]
API.SetOpenCB.restype = None

OnOutputCBType = ctypes.CFUNCTYPE(None, ctypes.c_char_p)
API.SetOutputCB.argtypes = [OnOutputCBType]
API.SetOutputCB.restype = None

OnOutputWCBType = ctypes.CFUNCTYPE(None, ctypes.c_wchar_p)
API.SetOutputWCB.argtypes = [OnOutputWCBType]
API.SetOutputWCB.restype = None

OnIdleCBType = ctypes.CFUNCTYPE(None)
API.SetIdleCB.argtypes = [OnIdleCBType]
API.SetIdleCB.restype = None



__TNGInitialized = False

def OnInitialiseCB(i):
	global __TNGInitialized
	__TNGInitialized = True
	print("TNG InitialiseCB: ", i)

def OnOpenCB(i):
    print("TNG OpenCB: ", i)

def OnOutputCB(s):
    print("TNG OutputCB:", s)
	
def OnOutputWCB(s):
    print("TNG OutputWCB:", s)
	
def OnIdleCB():
    print("TNG IdleCB")
	
class TNGThread(threading.Thread):
	def run(self):
		API.Run(False)
		#API.RunProfileW(False, ctypes.c_wchar_p("PythonProfile"))
		
		
def Run():
	print("Starting PlanetCNC TNG")
	
	OnInitialiseCBPtr = OnInitialiseCBType(OnInitialiseCB)
	__TNGCallbackList.append(OnInitialiseCBPtr)
	API.SetInitialiseCB(OnInitialiseCBPtr)
	
	OnOpenCBPtr = OnOpenCBType(OnOpenCB)
	__TNGCallbackList.append(OnOpenCBPtr)
	API.SetOpenCB(OnOpenCBPtr)
	
	OnOutputWCBPtr = OnOutputWCBType(OnOutputWCB)
	__TNGCallbackList.append(OnOutputWCBPtr)
	API.SetOutputWCB(OnOutputWCBPtr)
	
	OnIdleCBPtr = OnIdleCBType(OnIdleCB)
	__TNGCallbackList.append(OnIdleCBPtr)
	API.SetIdleCB(OnIdleCBPtr)
	
	
	tngthr = TNGThread()
	tngthr.start()
	
	cnt = 0
	while ((cnt < 200) and not __TNGInitialized):
		cnt += 1
		if ((cnt%10) == 0):
			print("  ... Waiting for initialization %d" %(cnt/10))
		time.sleep(0.1)
		

	print("PlanetCNC TNG is running")
	time.sleep(2)
	
	
	
	
	
	
	
		
		
