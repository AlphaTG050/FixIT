#include "ButtonConstants.au3"
#include "GUIConstantsEx.au3"
#include "MsgBoxConstants.au3"
#include "StaticConstants.au3"
#include "AutoItConstants.au3"
#include "Misc.au3"
#include "GDIPlus.au3"
#include "WinAPIReg.au3"
#include "WindowsConstants.au3"
#include "EditConstants.au3"
#include "Crypt.au3"

; Login
Func Login()
    ; LoginGUI
    $LoginGUI = GUICreate("Login", 349, 100, -1, -1, BitOR($WS_CAPTION, $WS_SYSMENU), $WS_EX_TOPMOST)
    WinSetOnTop($LoginGUI, "", 1)
    GUISetState(@SW_SHOW, $LoginGUI)
        ; Layout
        GUISetBkColor($DarkGrey, $LoginGUI)
    ; Label
        ; Key
        $KeyLabel = GUICtrlCreateLabel("Key:", 20, 40, 35, 30)
            ; Layout
            GUICtrlSetColor($KeyLabel, $White)
            GUICtrlSetFont($KeyLabel, 12, 700)
        ; Login
        $LoginInput = GUICtrlCreateInput("", 70, 40, 187, 20)
        GUICtrlSetLimit($LoginInput, 25)
            ; Layout
            GUICtrlSetFont($LoginInput, 9, 700)
    ; Button
        ; Submit
        $SubmitButton = GUICtrlCreateButton("SUBMIT", 270, 35, 60, 30)
            ; Layout
            GUICtrlSetColor($SubmitButton, $DarkGrey)
            GUICtrlSetBKColor($SubmitButton, $Blue)
            GUICtrlSetFont($SubmitButton, 9, 700)
            
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
        Case $SubmitButton
            $inputText = GUICtrlRead($LoginInput)
            If StringInStr($inputText, "Development") Then
                RegWrite($registryLoginFolder, $registryFirstLoginKey, "REG_SZ", $registryStandardKey)
                GUIDelete($LoginGUI)
                ExitLoop
            Else
                MsgBox(16, "Error", "Invalid Key! Please Contact the Owner")
            EndIf
        Case $LoginInput
            If _IsPressed("0D") Then
                ControlClick("Login Screen", "", $SubmitButton)
            EndIf
    EndSwitch
WEnd
EndFunc








; Login [ENTER] Key
Func IsPressedEnterLogin($sHexKey)
    Local $aResult = DllCall("user32.dll", "short", "GetAsyncKeyState", "int", "0x" & $sHexKey)
    If Not @error And BitAND($aResult[0], 0x8000) Then
        Return 1
    EndIf
    Return 0
EndFunc

; SettingsGUI
Func SettingsGUI()
	$GUISettings = GUICreate("Settings", 800, 500)
	GUISetBkColor($DarkGrey, $GUISettings)
	
	; Line
	$MiddleVerticalLine = GUICtrlCreateLabel("", 392, 0, 8, 500)
	GUICtrlSetBkColor($MiddleVerticalLine, $Black)

	; Label
	$OperatingSystemText = GUICtrlCreateLabel("Operation System:", 20, 50, 160, 500)
	GUICtrlSetColor($OperatingSystemText, $LightGrey)
	GUICtrlSetFont($OperatingSystemText, 12, 700)

	; Operating System
	$OperatingSystemVariable = GUICtrlCreateLabel(@OSVersion & " " & @OSArch, 180, 50, 160, 500)
	GUICtrlSetColor($OperatingSystemVariable, $Blue)
	GUICtrlSetFont($OperatingSystemVariable, 12, 700)

	; Username
	$UsernameText = GUICtrlCreateLabel("Username:", 20, 100, 160, 500)
	GUICtrlSetColor($UsernameText, $LightGrey)
	GUICtrlSetFont($UsernameText, 12, 700)

	; Username
	$UsernameVariable = GUICtrlCreateLabel(@UserName, 180, 100, 160, 500)
	GUICtrlSetColor($UsernameVariable, $Blue)
	GUICtrlSetFont($UsernameVariable, 12, 700)

	; Computername
	$ComputernameText = GUICtrlCreateLabel("Computername:", 20, 150, 160, 500)
	GUICtrlSetColor($ComputernameText, $LightGrey)
	GUICtrlSetFont($ComputernameText, 12, 700)

	; Computername
	$UsernameVariable = GUICtrlCreateLabel(@Computername, 180, 150, 160, 500)
	GUICtrlSetColor($UsernameVariable, $Blue)
	GUICtrlSetFont($UsernameVariable, 12, 700)




	GUISetState(@SW_SHOW, $GUISettings)


	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				GUIDelete($GUISettings)
				ExitLoop
		EndSwitch
	WEnd


EndFunc