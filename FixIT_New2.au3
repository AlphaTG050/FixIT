#include "include\ButtonConstants.au3"
#include "include\GUIConstantsEx.au3"
#include "include\MsgBoxConstants.au3"
#include "include\StaticConstants.au3"
#include "include\AutoItConstants.au3"
#include "include\Misc.au3"
#include "include\GDIPlus.au3"
#include "include\WinAPIReg.au3"
#include "include\WindowsConstants.au3"
#include "include\EditConstants.au3"
#include "include\Crypt.au3"
#RequireAdmin

; Variable
	; Colour
	Global $White = 0xFFFFFF
	Global $DarkGrey = 0x121212
	Global $LightGrey = 0xDBDEE1
	Global $Blue = 0x89CFF0
	; Registry
	Global $registryLoginFolder = "HKEY_CURRENT_USER\Software\FixIT"
	Global $registryFirstLoginKey = "FirstLoginCheck"
	Global $registryStandardKey = "(Standard)"

; Create Regedit "FixIT"
If Not RegRead($registryLoginFolder, $registryStandardKey) Then
	RegWrite("HKEY_CURRENT_USER\Software", "FixIT", "REG_SZ")
	EndIf

; Check FirstLoginCheck
	If Not RegRead($registryLoginFolder, $registryFirstLoginKey) Then
	Login()
	EndIf



; Functions
Func Login()
; Create LoginGUI
$LoginGUI = GUICreate("Login Screen", 349, 100)
GUISetBkColor($DarkGrey, $LoginGUI)
; Key Label
$KeyLabel = GUICtrlCreateLabel("Key:", 20, 40, 35, 30)
GUICtrlSetColor($KeyLabel, $White)
GUICtrlSetFont($KeyLabel, 12, 700)
; Login Input
$LoginInput = GUICtrlCreateInput("", 70, 40, 187, 20)
GUICtrlSetLimit($LoginInput, 25)
GUICtrlSetFont($LoginInput, 9, 700)
; Button Submit
$SubmitButton = GUICtrlCreateButton("SUBMIT", 270, 35, 60, 30)
GUICtrlSetColor($SubmitButton, $DarkGrey)
GUICtrlSetBKColor($SubmitButton, $Blue)
GUICtrlSetFont($SubmitButton, 9, 700)

GUISetState(@SW_SHOW, $LoginGUI)
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
    EndSwitch
WEnd
EndFunc





; Main GUI
$MainGUI = GUICreate("FixIT", 800, 600)
GUISetBkColor(0x121212, $MainGUI)
GUISetState(@SW_SHOW, $MainGUI)
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd