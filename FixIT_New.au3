#include <GUIConstantsEx.au3>
#include <FileConstants.au3>

; Main GUI
$MainGUI = GUICreate("FixIT", 1200, 600)

; Set background color
GUISetBkColor(0x121212, $MainGUI)

; Show Main GUI
GUISetState(@SW_SHOW, $MainGUI)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            ExitLoop
    EndSwitch
WEnd

