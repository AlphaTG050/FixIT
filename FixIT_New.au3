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
#RequireAdmin


; Variable
	; Colour
	Global $White = 0xFFFFFF
	Global $DarkGrey = 0x121212
	Global $LightGrey = 0xDBDEE1
	Global $Blue = 0x89CFF0
	Global $Black = 0x000000
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
		Local $LoginGUI = GUICreate("Login Screen", 349, 100)
		GUISetBkColor($DarkGrey, $LoginGUI)
		
		; Key Label
		Local $KeyLabel = GUICtrlCreateLabel("Key:", 20, 40, 35, 30)
		GUICtrlSetColor($KeyLabel, $White)
		GUICtrlSetFont($KeyLabel, 12, 700)
		
		; Login Input
		Local $LoginInput = GUICtrlCreateInput("", 70, 40, 187, 20)
		GUICtrlSetLimit($LoginInput, 25)
		GUICtrlSetFont($LoginInput, 9, 700)
		
		; Button Submit
		Local $SubmitButton = GUICtrlCreateButton("SUBMIT", 270, 35, 60, 30)
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
				Case $LoginInput
					If _IsPressed("0D") Then
						ControlClick("Login Screen", "", $SubmitButton)
					EndIf
			EndSwitch
		WEnd
	EndFunc
	Func IsPressedEnterLogin($sHexKey)
		Local $aResult = DllCall("user32.dll", "short", "GetAsyncKeyState", "int", "0x" & $sHexKey)
		If Not @error And BitAND($aResult[0], 0x8000) Then
			Return 1
		EndIf
		Return 0
	EndFunc

	
; Main GUI
$MainGUI = GUICreate("FixIT", 1000, 600)
GUISetBkColor(0x121212, $MainGUI)
GUISetState(@SW_SHOW, $MainGUI)
; Line
	; Left Senkrecht Line
	$LeftSenkrechhtLine = GUICtrlCreateLabel("", 250, 0, 8, 600)
		; Layout
		GUICtrlSetBkColor($LeftSenkrechhtLine, $Black)
	; Upper Left Horizontal Line
		$UpperLeftHorizontalLine = GUICtrlCreateLabel("", 0, 85, 250, 10)
		; Layout
		GUICtrlSetBkColor($UpperLeftHorizontalLine, $Black)
	; Left Senkrecht Line
		$LeftSenkrechtLine = GUICtrlCreateLabel("", 0, 0, 8, 600)
		; Layout
		GUICtrlSetBkColor($LeftSenkrechtLine, $Black)
	; Left Bottom Senkrecht Line
		$BottomLeftSenkrechtLine = GUICtrlCreateLabel("", 0, 505, 250, 10)
		; Layout
		GUICtrlSetBkColor($BottomLeftSenkrechtLine, $Black)


	
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
	EndSwitch
WEnd

