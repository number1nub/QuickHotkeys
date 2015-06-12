#NoEnv
#SingleInstance, Force
SetWorkingDir, %A_ScriptDir%
;auto_version

global homeToggle
return

*MButton::
{
	mod := GetMods()
	
	if (mod = "^!") {
		RegRead, fpath, HKCU, Software\WSNHapps\CustomHotstrings, EditorPath
		if (ErrorLevel || !fpath)
			return
		Run, %fpath%
	}
	else if (mod = "!")
		Run, C:\OneDrive\AHK\GUI Tools\Get Color Code.ahk
	return
}	


ScrollLock::
homeToggle := !homeToggle
TrayTip, Insert/Home Toggle:, % (homeToggle ? "ON" : "OFF"), 1.5, 1
return


#if homeToggle
$*Insert::SendInput, {Blind}{Home}
$*Home::SendInput, {Blind}{End}
#if



#Include <m>
#Include <GetMods>
#Include <Hotkeys>