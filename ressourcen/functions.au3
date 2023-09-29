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
    ; Input
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
                RegWrite($FixITRegistryFolder, $FirstLoginRegistryKey, "REG_SZ", $registryStandardKey)
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
    ; SettingsGUI
    Local $SettingsGUI = GUICreate("Settings", 600, 400)
    GUISetState(@SW_SHOW, $SettingsGUI)
        ; Layout
        GUISetBkColor($DarkGrey, $SettingsGUI)
    ; Button
        ; AutoStart
        $AutoStartButtonAdd = GUICtrlCreateButton("AutoStart aktivieren", 200, 50, 200, 30)
        $AutoStartButtonRemove = GUICtrlCreateButton("AutoStart deaktivieren", 200, 100, 200, 30)

  
    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                GUIDelete($SettingsGUI)
                ExitLoop
            Case $AutoStartButtonAdd
                RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "FixIT", "REG_SZ", @ScriptDir & "\" & @ScriptName)
            Case $AutoStartButtonRemove
                RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", "FixIT")
        EndSwitch
    WEnd
EndFunc



; FunctionGUI
Func FunctionGUI()
    ; FunctionGUI
    Local $FunctionGUI = GUICreate("Function", 600, 400)
    GUISetState(@SW_SHOW, $FunctionGUI)
        ; Layout
        GUISetBkColor($DarkGrey, $FunctionGUI)
    ; Button
        ; Refresh Button
        Local $RefreshButton = GUICtrlCreateButton("Refresh", 500, 50, 100, 100)


    While 1
        Switch GUIGetMsg()
            Case $GUI_EVENT_CLOSE
                GUIDelete($FunctionGUI)
                ExitLoop
            Case $RefreshButton
                GUIDelete($FunctionGUI)
                FunctionGUI()
                ExitLoop
        EndSwitch
    WEnd
EndFunc