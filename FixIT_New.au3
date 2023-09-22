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

; Variables
; Farben
Global $White = 0xFFFFFF
Global $DarkGrey = 0x121212
Global $LightGrey = 0xDBDEE1
Global $Blue = 0x89CFF0
; Registry
Global $registryLoginFolder = "HKEY_CURRENT_USER\Software\FixIT"
Global $registryFirstLoginKey = "FirstLoginCheck"
Global $registryStandardKey = "(Standard)"

; Create Regedit "FixIT"
RegWrite("HKEY_CURRENT_USER\Software\FixIT", "", "REG_SZ", "")



; Create Login GUI 
$LoginGUI = GUICreate("Login Screen", 349, 100)
GUISetBkColor($DarkGrey, $LoginGUI)
; Key Label
$KeyLabel = GUICtrlCreateLabel("Key:", 20, 40, 35, 30)
GUICtrlSetColor($White, $KeyLabel)
GUICtrlSetFont($KeyLabel, 12, 700)
; Login Input
$LoginInput = GUICtrlCreateInput("", 70, 40, 187, 20)
GUICtrlSetLimit(25, $LoginInput)
GUICtrlSetFont($LoginInput, 9, 700)
; Button Submit
$SubmitButton = GUICtrlCreateButton("SUBMIT", 270, 35, 60, 30)
GUICtrlSetColor($DarkGrey, $SubmitButton)
GUICtrlSetBKColor($Blue, $SubmitButton)
GUICtrlSetFont($SubmitButton, 9, 700)
GUISetState(@SW_SHOW)
While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit  
    EndSwitch
WEnd

















; Main GUI
$MainGUI = GUICreate("FixIT", 800, 600)
GUISetBkColor(0x121212, $MainGUI)
GUISetState(@SW_SHOW)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
    EndSwitch
WEnd
