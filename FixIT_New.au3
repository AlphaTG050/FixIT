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
#include "ressourcen\functions.au3"
#include "ressourcen\variables.au3"
#RequireAdmin


; Create Regedit "FixIT"
If Not RegRead($registryLoginFolder, $registryStandardKey) Then
	RegWrite("HKEY_CURRENT_USER\Software", "FixIT", "REG_SZ")
	EndIf


; Check FirstLoginCheck
	If Not RegRead($registryLoginFolder, $registryFirstLoginKey) Then
	Login()
	EndIf


; Main GUI
	$MainGUI = GUICreate("FixIT", 1000, 600)
	GUISetState(@SW_SHOW, $MainGUI)
		; Layout
		GUISetBkColor($DarkGrey, $MainGUI)
; Line
	; Left Senkrecht Line
	$line1 = GUICtrlCreateLabel("", 250, 0, 8, 600)
		; Layout
		GUICtrlSetBkColor($line1, $Black)
	; Upper Left Horizontal Line
		$line2 = GUICtrlCreateLabel("", 0, 85, 250, 10)
		; Layout
		GUICtrlSetBkColor($line2, $Black)
	; Left Senkrecht Line
		$line3 = GUICtrlCreateLabel("", 0, 0, 8, 600)
		; Layout
		GUICtrlSetBkColor($line3, $Black)
	; Left Bottom Senkrecht Line
		$line4 = GUICtrlCreateLabel("", 0, 505, 250, 10)
		; Layout
		GUICtrlSetBkColor($line4, $Black)

; Images
	; Settings
	$SettingsIcon = GUICtrlCreateIcon(@Scriptdir & "\assets\images\Settings\Settings.ico", 0, 25, 455, 35, 35)
	; Package
;	$PackageIcon = GUICtrlCreateIcon(@Scriptdir & "\assets\images\Package\Package.ico", 0, 25, 105, 50, 50)
	; Function
;	$FunctionIcon = GUICtrlCreateIcon(@Scriptdir & "\assets\images\Function\Function.ico", 0, 25, 175, 45, 45)
	; Team
;	$TeamIcon = GUICtrlCreateIcon(@Scriptdir & "\assets\images\Team\Team.ico", 0, 22, 250, 55, 55)

; Text
	; Package
	$PackageText = GUICtrlCreateLabel("Package", 90, 130, 75, 50)
	GUICtrlSetColor($PackageText, $LightGrey)
	GUICtrlSetFont($PackageText, 14, 700)
	; Function
	$FunctionText = GUICtrlCreateLabel("Function", 90, 190, 75, 50)
	GUICtrlSetColor($FunctionText, $LightGrey)
	GUICtrlSetFont($FunctionText, 14, 700)
	; Team
	$TeamText = GUICtrlCreateLabel("Team", 102, 250, 75, 50)
	GUICtrlSetColor($TeamText, $LightGrey)
	GUICtrlSetFont($TeamText, 14, 700)
	; Settings
	$SettingsText = GUICtrlCreateLabel("Settings", 75, 462, 75, 25)
	GUICtrlSetColor($SettingsText, $LightGrey)
	GUICtrlSetFont($SettingsText, 14, 700)




	
While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			Exit
			Case $SettingsText
				SettingsGUI()
			Case $SettingsIcon
				SettingsGUI()
	EndSwitch
WEnd

