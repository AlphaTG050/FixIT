#include <GUIConstantsEx.au3>

Global $hGUI, $Button, $ButtonState = False

$hGUI = GUICreate("Zweizustands-Button", 300, 100)
$Button = GUICtrlCreateButton("Deaktiviert", 100, 20, 100, 30)

GUISetState(@SW_SHOW)

While 1
    Switch GUIGetMsg()
        Case $GUI_EVENT_CLOSE
            Exit
        Case $Button
            $ButtonState = Not $ButtonState ; Ändere den Zustand des Buttons
            If $ButtonState Then
                GUICtrlSetData($Button, "Aktiviert")
                GUICtrlSetBkColor($Button, 0x567896)
                ; Hier kannst du den Code für den "Aktiviert"-Zustand ausführen
            Else
                GUICtrlSetData($Button, "Deaktiviert")
                GUICtrlSetBkColor($Button, 0x629786)
                ; Hier kannst du den Code für den "Deaktiviert"-Zustand ausführen
            EndIf
    EndSwitch
WEnd
