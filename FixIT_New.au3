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
	; Colour
	$White = 0xFFFFFF
	$DarkGrey = 0x121212
	$LightGrey = 0xDBDEE1
	$Blue = 0x89CFF0




; Login
	; GUI
	$LoginGUI = GUICreate("Login Screen", 350, 100)
		; Layout
			; Set background color
			GUISetBkColor($DarkGrey, $LoginGUI)	
	; Label
	$KeyLabel = GUICtrlCreateLabel("Key", 20, 40, 200, 30)
		; Layout
			; Font Colour
			GUICtrlSetColor($KeyLabel, $White)
			; Font Size
			GUICtrlSetFont($KeyLabel, 12, 700)
	; Input
	$LoginInput = GUICtrlCreateInput("", 85, 40, 150, 20)
	; Button Submit
	$SubmitButton = GUICtrlCreateButton("SUBMIT", 260, 35, 60, 30)
		; Layout
			; Font Colour
			GUICtrlSetColor($SubmitButton, $White)
			; Button Colour
			GUICtrlSetBKColor($SubmitButton, $Blue)
			; Font Size
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
	; Show Main GUI
	GUISetState(@SW_SHOW, $MainGUI)
		; Layout
			; Set background color
			GUISetBkColor(0x121212, $MainGUI)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            ExitLoop
    EndSwitch
WEnd


