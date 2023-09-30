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

; SettingsGUI
Func SettingsGUI()
    ; SettingsGUI
    Local $SettingsGUI = GUICreate("Settings", 600, 400)
    GUISetState(@SW_SHOW, $SettingsGUI)
        ; Layout
        GUISetBkColor($DarkGrey, $SettingsGUI)
    ; Button
        ; AutoStart Add
        $AutoStartButtonAdd = GUICtrlCreateButton("Activated", 55, 40, 125, 30)
            ; Layout
            GUICtrlSetColor($AutoStartButtonAdd, $Blue)
            GUICtrlSetBkColor($AutoStartButtonAdd, $DarkGrey)
        ; AutoStart Remove
        $AutoStartButtonRemove = GUICtrlCreateButton("Deactivate", 55, 75, 125, 30)
            ; Layout
            GUICtrlSetColor($AutoStartButtonRemove, $Blue)
            GUICtrlSetBkColor($AutoStartButtonRemove, $DarkGrey)
            
; Image
    ; AutoStart
    $AutoStartImage = GUICtrlCreatePic(@ScriptDir & "\assets\images\AutoStart\AutoStart.jpg", 3, 45, 50, 50)

; Label
    ; AutoStart
	$AutoStartLabel = GUICtrlCreateLabel("AutoStart", 20, 13, 90, 20)
    ; Layout
    GUICtrlSetColor($AutoStartLabel, $Blue)
    GUICtrlSetFont($AutoStartLabel, 14, 800, "", "Arial")


; Überprüfe den Status beim GUI-Öffnen
UpdateAutoStartButtons()

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            GUIDelete($SettingsGUI)
            ExitLoop
        Case $AutoStartButtonAdd
            $AutoStartEntry = "FixIT"
            If RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", $AutoStartEntry) <> @ScriptDir & "\" & @ScriptName Then
                ; Eintrag ist nicht vorhanden, füge ihn hinzu
                RegWrite("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", $AutoStartEntry, "REG_SZ", @ScriptDir & "\" & @ScriptName)
            EndIf
            ; Aktualisiere die Schaltflächen
            UpdateAutoStartButtons()
        Case $AutoStartButtonRemove
            $AutoStartEntry = "FixIT"
            If RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", $AutoStartEntry) = @ScriptDir & "\" & @ScriptName Then
                ; Eintrag ist vorhanden, entferne ihn
                RegDelete("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", $AutoStartEntry)
            EndIf
            ; Aktualisiere die Schaltflächen
            UpdateAutoStartButtons()
    EndSwitch
WEnd
EndFunc






Func UpdateAutoStartButtons()
    $AutoStartEntry = "FixIT"
    If RegRead("HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Run", $AutoStartEntry) = @ScriptDir & "\" & @ScriptName Then
        ; Eintrag ist vorhanden, deaktiviere den Button zum Hinzufügen und aktiviere den Button zum Entfernen
        GUICtrlSetState($AutoStartButtonAdd, $GUI_DISABLE)
        GUICtrlSetState($AutoStartButtonRemove, $GUI_ENABLE)
    Else
        ; Eintrag ist nicht vorhanden, aktiviere den Button zum Hinzufügen und deaktiviere den Button zum Entfernen
        GUICtrlSetState($AutoStartButtonAdd, $GUI_ENABLE)
        GUICtrlSetState($AutoStartButtonRemove, $GUI_DISABLE)
    EndIf
EndFunc


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

