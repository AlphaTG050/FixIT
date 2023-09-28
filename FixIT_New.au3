#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
#AutoIt3Wrapper_Icon=assets\images\FixIT Logo\FixIT_Logo.ico
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
#include "ButtonConstants.au3"
#include "GUIConstantsEx.au3"
#include "MsgBoxConstants.au3"
#include "StaticConstants.au3"
#include "AutoItConstants.au3"
#include "Misc.au3"
#include "WinAPI.au3"
#include "GDIPlus.au3"
#include "WinAPIReg.au3"
#include "WindowsConstants.au3"
#include "EditConstants.au3"
#include "Crypt.au3"
#include "ressourcen\functions.au3"
#include "ressourcen\variables.au3"


; Create Regedit "FixIT"
If Not RegRead($FixITRegistryFolder, $registryStandardKey) Then
	RegWrite("HKEY_CURRENT_USER\Software", "FixIT", "REG_SZ")
	EndIf


; Check FirstLoginCheck
	If Not RegRead($FixITRegistryFolder, $FirstLoginRegistryKey) Then
	Login()
	EndIf


; Main GUI
	$MainGUI = GUICreate("FixIT", 1000, 600)
	GUISetState(@SW_SHOW, $MainGUI)
		; Layout
		GUISetBkColor($DarkGrey, $MainGUI)

; Buttons
	; Package
	Global $PackageButton = GUICtrlCreateButton("Packages", 50, 150, 200, 75)
	Global $FunctionButton = GUICtrlCreateButton("Functions", 275, 150, 200, 75)
	Global $TeamButton = GUICtrlCreateButton("Team", 500, 150, 200, 75)
	Global $SettingsButton = GUICtrlCreateButton("Settings", 725, 150, 200, 75)


	While 1
		Switch GUIGetMsg()
			Case $GUI_EVENT_CLOSE
				Exit
			Case $FunctionButton
				FunctionGUI()
			Case $SettingsButton
				SettingsGUI()
		EndSwitch
	WEnd
