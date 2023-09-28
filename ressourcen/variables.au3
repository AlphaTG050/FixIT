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

; GUI
Global $MainGUI
Global $LoginGUI

; Line
Global $Line1
Global $Line2
Global $Line3
Global $Line4

; Label
Global $KeyLabel

; Buttons
Global $SubmitButton