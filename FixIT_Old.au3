#RequireAdmin
#Region ;**** Directives created by AutoIt3Wrapper_GUI ****
;#AutoIt3Wrapper_Icon=assets\images\logo\fixit.ico
#AutoIt3Wrapper_Res_Fileversion=2.21.6.2
#AutoIt3Wrapper_Res_Fileversion_AutoIncrement=y
#AutoIt3Wrapper_Res_LegalCopyright=Gürkan Cevik
#AutoIt3Wrapper_Res_LegalTradeMarks=Gürkan Cevik
#AutoIt3Wrapper_Res_Language=1031
#EndRegion ;**** Directives created by AutoIt3Wrapper_GUI ****
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

; Variable Directory
Global $tempWindows = "C:\Windows\Temp\"

; Variable Registry
Global $registryLoginFolder = "HKEY_CURRENT_USER\Software\FixIT"
Global $registryFirstLoginKey = "FirstLoginCheck"
Global $registryStandardKey = "(Standard)"

; Variable Colour
Global $grey = 0x26292B
Global $lightGrey = 0x2E3239
Global $purple = 0x5F7ADB
Global $lightPurple = 0xA2B2EE
Global $green = 0x64AD6A
Global $red = 0xDD3439
Global $black = 0x000000
Global $white = 0xFFFFFF
Global $lightBlue = 0x55FFF8


Func CheckAndStartAdminRights()
; Chec
	If Not IsAdmin() Then
		Local $sParams = '"' & @ScriptFullPath & '" ' & $CmdLineRaw
		Local $iResult = ShellExecute(@AutoItExe, $sParams, "", "runas", @SW_HIDE)
		
		If $iResult <= 32 Then
			MsgBox(16, "Error", "Failed to run with administrator rights!" & @CRLF & "No Administrations rights!")
		EndIf
		Exit
	EndIf
EndFunc

Func ScriptLogin()
    ; [Login]
     Then
    Else
        Local $guiLogin = GUICreate("Login", 290, 170)
        GUISetState(@SW_SHOW)

        ; Username
        Local $textUsername = GUICtrlCreateLabel("Username:", 20, 30)
        Local $inputUsername = GUICtrlCreateInput("", 120, 25, 150)
        GUICtrlSetState($inputUsername, 256)

        ; Password
        Local $textPassword = GUICtrlCreateLabel("Password:", 20, 70)
        Local $inputPassword = GUICtrlCreateInput("", 120, 65, 150, 20, $ES_PASSWORD)

        ; Login
        Local $buttonLogin = GUICtrlCreateButton("Login", 90, 130, 100, 30)

        While 1
            Switch GUIGetMsg()
                Case $gui_Event_Close
                    Exit
                Case $buttonLogin
                    $sUsername = GUICtrlRead($inputUsername)
                    $sPassword = GUICtrlRead($inputPassword)
                    If $sUsername = "FixIT" And $sPassword = "1234" Then
                        RegWrite($registryLoginFolder, $registryFirstLoginKey, "REG_DWORD", 1)
                        GUISetState(@SW_HIDE, $guiLogin)
                        ExitLoop
                    Else
                        MsgBox(16, "Error", "Invalid login information")
                    EndIf
            EndSwitch
        WEnd
    EndIf
EndFunc


; Check and Start Script with Administrations Rights
CheckAndStartAdminRights()

 ; Create Registry Folder "FixIT"
If RegRead($registryLoginFolder, "") = "" Then
    RegWrite($registryLoginFolder, "", "REG_SZ", "")
EndIf

; Show Script Loginscreen
ScriptLogin()

; GUI
	; Install Programs
	$guiInstallPrograms = GUICreate("FixIT", 1180, 475)
	GUISetState(@SW_SHOW)
		; layout
		GUISetBkColor($lightGrey, $guiInstallPrograms)

; Images
	; AlphaTG
	;$buttonAlphaTG = GUICtrlCreateIcon(@ScriptDir & "\assets\images\logo\round.ico", 100, 1080, 50, 60, 60)


  
; ____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
; [Text]
	; Lower Line
	$text_lowerline = GUICtrlCreateLabel("", 10, 405, 1020, 1.5)
		; Layout
		GUICtrlSetBkColor($text_lowerline, $white)
	; Right Line
	$text_rightline = GUICtrlCreateLabel("", 1035, 10, 1.5, 455)
		; Layout
		GUICtrlSetBkColor($text_rightline, $white)
	; Head of Delevopment
	$text_headofdevelopment = GUICtrlCreateLabel("Head of Development", 1050, 10, 120, 15)
		; Layout
		GUICtrlSetColor($text_headofdevelopment, $lightblue)
		GUICtrlSetFont($text_headofdevelopment, 9, 700, "", "Albert-Jan Pool")
	; AlphaTG
	$text_alphatg = GUICtrlCreateLabel("AlphaTG", 1087, 30, 120, 15)
		; Layout
		GUICtrlSetColor($text_alphatg, 0xd4cac0)
		GUICtrlSetFont($text_alphatg, 9, 700, "", "Albert-Jan Pool")

	
; ___________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
; [Button]
	; Install
	$button_install = GUICtrlCreateButton("INSTALL", 820, 360, 90, 30)
		; Layout
		GUICtrlSetBkColor($button_install, $green)
		GUICtrlSetColor($button_install, $white)
		GUICtrlSetFont($button_install, 8, 800, "", "Albert-Jan Pool")
	; Uninstall
	$button_uninstall = GUICtrlCreateButton("UNINSTALL", 925, 360, 90, 30)
		; Layout
		GUICtrlSetBkColor($button_uninstall, $red)
		GUICtrlSetColor($button_uninstall, $white)
		GUICtrlSetFont($button_uninstall, 8, 800, "", "Albert-Jan Pool")		
	; Game 1
	$button_game1 = GUICtrlCreateButton("✂🗿📃", 625, 420, 50, 30)
	; Upgrade Programs
	$button_upgradeprograms = GUICtrlCreateButton("UpgradePrograms", 20, 420, 100, 30)
	; Program & Features
	$button_programfeatures = GUICtrlCreateButton("Program/Features", 130, 420, 110, 30)
	; Standard Apps
	$button_standardapps = GUICtrlCreateButton("StandardApps", 250, 420, 90, 30)
	; Autostart
	$button_autostart = GUICtrlCreateButton("AutoStart", 350, 420, 70, 30)
	; Delete Tempfolder
	$button_deletetemp = GUICtrlCreateButton("DelTemp", 430, 420, 70, 30)
	; Restart
	;Local $button_restart = GUICtrlCreatePic(@ScriptDir & "\assets\images\Restart\Restart.jpg", 910, 420, 40, 40)
	; Shutdown
	;Local $button_shutdown = GUICtrlCreatePic(@ScriptDir & "\assets\images\Shutdown\Shutdown.jpg", 970, 420, 40, 40)
	; App-Installer
	;Local $button_appinstaller = GUICtrlCreateIcon(@ScriptDir & "\assets\images\App-Installer\appinstaller.ico", 0, 20, 345, 45, 45)
	
	
; ____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
; [Checkbox]
	; OperaGX
	$checkbox_operagx = GUICtrlCreateCheckbox("", 20, 40, 15, 20)
	$checkboxtext_operagx = GUICtrlCreateLabel("OperaGX", 40, 43, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_operagx, $lightpurple)
		GUICtrlSetFont($checkboxtext_operagx, 9, 700, "", "Albert-Jan Pool")
	; Opera
	$checkbox_opera = GUICtrlCreateCheckbox("", 20, 60, 15, 20)
	$checkboxtext_opera = GUICtrlCreateLabel("Opera", 40, 63, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_opera, $lightpurple)
		GUICtrlSetFont($checkboxtext_opera, 9, 700, "", "Albert-Jan Pool")
	; GoogleChrome
	$checkbox_chrome = GUICtrlCreateCheckbox("", 20, 80, 15, 20)
	$checkboxtext_chrome = GUICtrlCreateLabel("Chrome", 40, 83, 75, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_chrome, $lightpurple)
		GUICtrlSetFont($checkboxtext_chrome, 9, 700, "", "Albert-Jan Pool")
	; FireFox
	$checkbox_firefox = GUICtrlCreateCheckbox("", 20, 100, 15, 20)
	$checkboxtext_firefox = GUICtrlCreateLabel("Firefox", 40, 103, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_firefox, $lightpurple)
		GUICtrlSetFont($checkboxtext_firefox, 9, 700, "", "Albert-Jan Pool")
	; Edge
	$checkbox_edge = GUICtrlCreateCheckbox("", 20, 120, 15, 20)
	$checkboxtext_edge = GUICtrlCreateLabel("Edge", 40, 123, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_edge, $lightpurple)
		GUICtrlSetFont($checkboxtext_edge, 9, 700, "", "Albert-Jan Pool")
	; Tor Browser
	$checkbox_torbrowser = GUICtrlCreateCheckbox("", 20, 140, 15, 20)
	$checkboxtext_torbrowser = GUICtrlCreateLabel("Tor Browser", 40, 143, 70, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_torbrowser, $lightpurple)
		GUICtrlSetFont($checkboxtext_torbrowser, 9, 700, "", "Albert-Jan Pool")
	; Steam
	$checkbox_steam = GUICtrlCreateCheckbox("", 695, 40, 15, 20)
	$checkboxtext_steam = GUICtrlCreateLabel("Steam", 715, 43, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_steam, $lightpurple)
		GUICtrlSetFont($checkboxtext_steam, 9, 700, "", "Albert-Jan Pool")
	; Epic Games Launcher
	$checkbox_epicgameslauncher = GUICtrlCreateCheckbox("", 695, 60, 15, 20)
	$checkboxtext_epicgameslauncher = GUICtrlCreateLabel("Epic Games Launcher", 715, 63, 140, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_epicgameslauncher, $lightpurple)
		GUICtrlSetFont($checkboxtext_epicgameslauncher, 9, 700, "", "Albert-Jan Pool")
	; EA
	$checkbox_ea = GUICtrlCreateCheckbox("", 695, 80, 15, 20)
	$checkboxtext_ea = GUICtrlCreateLabel("EA", 715, 83, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_ea, $lightpurple)
		GUICtrlSetFont($checkboxtext_ea, 9, 700, "", "Albert-Jan Pool")
	; Ubisoft Connect
	$checkbox_ubisoftconnect = GUICtrlCreateCheckbox("", 695, 100, 15, 20)
	$checkboxtext_ubisoftconnect = GUICtrlCreateLabel("Ubisoft Connect", 715, 103, 100, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_ubisoftconnect, $lightpurple)
		GUICtrlSetFont($checkboxtext_ubisoftconnect, 9, 700, "", "Albert-Jan Pool")
	; GOG GALAXY
	$checkbox_goggalaxy = GUICtrlCreateCheckbox("", 695, 120, 15, 20)
	$checkboxtext_goggalaxy = GUICtrlCreateLabel("GOG GALAXY", 715, 123, 100, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_goggalaxy, $lightpurple)
		GUICtrlSetFont($checkboxtext_goggalaxy, 9, 700, "", "Albert-Jan Pool")
	; Minecraft
	$checkbox_minecraft = GUICtrlCreateCheckbox("", 695, 140, 15, 20)
	$checkboxtext_minecraft = GUICtrlCreateLabel("Minecraft", 715, 143, 60, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_minecraft, $lightpurple)
		GUICtrlSetFont($checkboxtext_minecraft, 9, 700, "", "Albert-Jan Pool")
			; Lunar Client
			$checkbox_lunarclient = GUICtrlCreateCheckbox("", 715, 160, 15, 20)
			$checkboxtext_lunarclient = GUICtrlCreateLabel("Lunar Client", 735, 163, 80, 20)
				; Layout
				GUICtrlSetColor($checkboxtext_lunarclient, 0xbcacff)
				GUICtrlSetFont($checkboxtext_lunarclient, 9, 700, "", "Albert-Jan Pool")	
			; Badlion Client
			$checkbox_badlionclient = GUICtrlCreateCheckbox("", 715, 180, 15, 20)
			$checkboxtext_badlionclient = GUICtrlCreateLabel("Badlion Client", 735, 183, 80, 20)
				; Layout
				GUICtrlSetColor($checkboxtext_badlionclient, 0xbcacff)
				GUICtrlSetFont($checkboxtext_badlionclient, 9, 700, "", "Albert-Jan Pool")		
	; 4K Video Downloader
	$checkbox_4kvideodownloader = GUICtrlCreateCheckbox("", 155, 40, 15, 20)
	$checkboxtext_4kvideodownloader = GUICtrlCreateLabel("4K Video Downloader", 175, 43, 140, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_4kvideodownloader, $lightpurple)
		GUICtrlSetFont($checkboxtext_4kvideodownloader, 9, 700, "", "Albert-Jan Pool")
	; Advanced IP Scanner
	$checkbox_advancedipscanner = GUICtrlCreateCheckbox("", 155, 60, 15, 20)
	$checkboxtext_advancedipscanner = GUICtrlCreateLabel("Advanced IP Scanner", 175, 63, 140, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_advancedipscanner, $lightpurple)
		GUICtrlSetFont($checkboxtext_advancedipscanner, 9, 700, "", "Albert-Jan Pool")	
	; Ear Trumpet
	$checkbox_eartrumpet = GUICtrlCreateCheckbox("", 155, 80, 15, 20)
	$checkboxtext_eartrumpet = GUICtrlCreateLabel("Ear Trumpet", 175, 83, 100, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_eartrumpet, $lightpurple)
		GUICtrlSetFont($checkboxtext_eartrumpet, 9, 700, "", "Albert-Jan Pool")
	; Everything
	$checkbox_everything = GUICtrlCreateCheckbox("", 155, 100, 15, 20)
	$checkboxtext_everything = GUICtrlCreateLabel("Everything", 175, 103, 70, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_everything, $lightpurple)
		GUICtrlSetFont($checkboxtext_everything, 9, 700, "", "Albert-Jan Pool")
	; File Converter
	$checkbox_fileconverter = GUICtrlCreateCheckbox("", 155, 120, 15, 20)
	$checkboxtext_fileconverter = GUICtrlCreateLabel("File Converter", 175, 123, 80, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_fileconverter, $lightpurple)
		GUICtrlSetFont($checkboxtext_fileconverter, 9, 700, "", "Albert-Jan Pool")
	; IObit Unlocker
	$checkbox_iobitunlocker = GUICtrlCreateCheckbox("", 155, 140, 15, 20)
	$checkboxtext_iobitunlocker = GUICtrlCreateLabel("IObit Unlocker", 175, 143, 80, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_iobitunlocker, $lightpurple)
		GUICtrlSetFont($checkboxtext_iobitunlocker, 9, 700, "", "Albert-Jan Pool")
	; MiniToolPartitionWizard
	$checkbox_minitoolpartitionwizard = GUICtrlCreateCheckbox("", 155, 160, 15, 20)
	$checkboxtext_minitoolpartitionwizard = GUICtrlCreateLabel("MiniTool Partition Wizard", 175, 163, 140, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_minitoolpartitionwizard, $lightpurple)
		GUICtrlSetFont($checkboxtext_minitoolpartitionwizard, 9, 700, "", "Albert-Jan Pool")
	; Nmap
	$checkbox_nmap = GUICtrlCreateCheckbox("", 155, 180, 15, 20)
	$checkboxtext_nmap = GUICtrlCreateLabel("Nmap", 175, 183, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_nmap, $lightpurple)
		GUICtrlSetFont($checkboxtext_nmap, 9, 700, "", "Albert-Jan Pool")
	; Quicklook
	$checkbox_quicklook = GUICtrlCreateCheckbox("", 155, 200, 15, 20)
	$checkboxtext_quicklook = GUICtrlCreateLabel("Quicklook", 175, 203, 60, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_quicklook, $lightpurple)
		GUICtrlSetFont($checkboxtext_quicklook, 9, 700, "", "Albert-Jan Pool")	
	; TreeSizeFree
	$checkbox_treesizefree = GUICtrlCreateCheckbox("", 155, 220, 15, 20)
	$checkboxtext_treesizefree = GUICtrlCreateLabel("TreeSizeFree", 175, 223, 100, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_treesizefree, $lightpurple)
		GUICtrlSetFont($checkboxtext_treesizefree, 9, 700, "", "Albert-Jan Pool")	
	; Wireshark
	$checkbox_wireshark = GUICtrlCreateCheckbox("", 155, 240, 15, 20)
	$checkboxtext_wireshark = GUICtrlCreateLabel("Wireshark", 175, 243, 70, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_wireshark, $lightpurple)
		GUICtrlSetFont($checkboxtext_wireshark, 9, 700, "", "Albert-Jan Pool")	
	; Powetoys
	$checkbox_powertoys = GUICtrlCreateCheckbox("", 155, 260, 15, 20)
	$checkboxtext_powertoys = GUICtrlCreateLabel("Powertoys", 175, 263, 70, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_powertoys, $lightpurple)
		GUICtrlSetFont($checkboxtext_powertoys, 9, 700, "", "Albert-Jan Pool")			
	; Visual Studio Code
	$checkbox_visualstudiocode = GUICtrlCreateCheckbox("", 360, 40, 15, 20)
	$checkboxtext_visualstudiocode = GUICtrlCreateLabel("Visual Studio Code", 380, 43, 120, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_visualstudiocode, $lightpurple)
		GUICtrlSetFont($checkboxtext_visualstudiocode, 9, 700, "", "Albert-Jan Pool")	
	; IntelliJ Community
	$checkbox_intellijcommunity = GUICtrlCreateCheckbox("", 360, 60, 15, 20)
	$checkboxtext_intellijcommunity = GUICtrlCreateLabel("IntelliJ Community", 380, 63, 110, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_intellijcommunity, $lightpurple)
		GUICtrlSetFont($checkboxtext_intellijcommunity, 9, 700, "", "Albert-Jan Pool")
	; IntelliJ Educational
	$checkbox_intellijeducational = GUICtrlCreateCheckbox("", 360, 80, 15, 20)
	$checkboxtext_intellijeducational = GUICtrlCreateLabel("IntelliJ Educational", 380, 83, 110, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_intellijeducational, $lightpurple)
		GUICtrlSetFont($checkboxtext_intellijeducational, 9, 700, "", "Albert-Jan Pool")
	; IntelliJ Ultimate
	$checkbox_intellijultimate = GUICtrlCreateCheckbox("", 360, 100, 15, 20)
	$checkboxtext_intellijultimate = GUICtrlCreateLabel("IntelliJ Ultimate", 380, 103, 90, 20)		
		; Layout
		GUICtrlSetColor($checkboxtext_intellijultimate, $lightpurple)
		GUICtrlSetFont($checkboxtext_intellijultimate, 9, 700, "", "Albert-Jan Pool")
	; AutoIT
	$checkbox_autoit = GUICtrlCreateCheckbox("", 360, 120, 15, 20)
	$checkboxtext_autoit = GUICtrlCreateLabel("AutoIT", 380, 123, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_autoit, $lightpurple)
		GUICtrlSetFont($checkboxtext_autoit, 9, 700, "", "Albert-Jan Pool")
	; Android Studio
	$checkbox_androidstudio = GUICtrlCreateCheckbox("", 360, 140, 15, 20)
	$checkboxtext_androidstudio = GUICtrlCreateLabel("Android Studio", 380, 143, 90, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_androidstudio, $lightpurple)
		GUICtrlSetFont($checkboxtext_androidstudio, 9, 700, "", "Albert-Jan Pool")
	; XAMPP
	$checkbox_xampp = GUICtrlCreateCheckbox("", 360, 160, 15, 20)
	$checkboxtext_xampp = GUICtrlCreateLabel("XAMPP", 380, 163, 70, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_xampp, $lightpurple)
		GUICtrlSetFont($checkboxtext_xampp, 9, 700, "", "Albert-Jan Pool")
	; Windows SDK
	$checkbox_windowssdk = GUICtrlCreateCheckbox("", 360, 180, 15, 20)
	$checkboxtext_windowssdk = GUICtrlCreateLabel("Windows SDK", 380, 183, 90, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_windowssdk, $lightpurple)
		GUICtrlSetFont($checkboxtext_windowssdk, 9, 700, "", "Albert-Jan Pool")
	; Python
	$checkbox_python = GUICtrlCreateCheckbox("", 360, 200, 15, 20)
	$checkboxtext_python = GUICtrlCreateLabel("Python", 380, 203, 70, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_python, $lightpurple)
		GUICtrlSetFont($checkboxtext_python, 9, 700, "", "Albert-Jan Pool")
	; Discord
	$checkbox_discord = GUICtrlCreateCheckbox("", 535, 40, 15, 20)
	$checkboxtext_discord = GUICtrlCreateLabel("Discord", 555, 43, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_discord, $lightpurple)
		GUICtrlSetFont($checkboxtext_discord, 9, 700, "", "Albert-Jan Pool")
	; Teamspeak
	$checkbox_teamspeak = GUICtrlCreateCheckbox("", 535, 60, 15, 20)
	$checkboxtext_teamspeak = GUICtrlCreateLabel("TeamSpeak", 555, 63, 80, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_teamspeak, $lightpurple)
		GUICtrlSetFont($checkboxtext_teamspeak, 9, 700, "", "Albert-Jan Pool")
	; Microsoft Teams
	$checkbox_microsoftteams = GUICtrlCreateCheckbox("", 535, 80, 15, 20)
	$checkboxtext_microsoftteams = GUICtrlCreateLabel("Microsoft Teams", 555, 83, 100, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_microsoftteams, $lightpurple)
		GUICtrlSetFont($checkboxtext_microsoftteams, 9, 700, "", "Albert-Jan Pool")
	; Whatsapp
	$checkbox_whatsapp = GUICtrlCreateCheckbox("", 535, 100, 15, 20)
	$checkboxtext_whatsapp = GUICtrlCreateLabel("Whatsapp [MS]", 555, 103, 100, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_whatsapp, $lightpurple)
		GUICtrlSetFont($checkboxtext_whatsapp, 9, 700, "", "Albert-Jan Pool")
	; Zoom
	$checkbox_zoom = GUICtrlCreateCheckbox("", 535, 120, 15, 20)
	$checkboxtext_zoom = GUICtrlCreateLabel("Zoom", 555, 123, 80, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_zoom, $lightpurple)
		GUICtrlSetFont($checkboxtext_zoom, 9, 700, "", "Albert-Jan Pool")
	; Google Meet
	$checkbox_googlemeet = GUICtrlCreateCheckbox("", 535, 140, 15, 20)
	$checkboxtext_googlemeet = GUICtrlCreateLabel("Google Meet", 555, 143, 80, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_googlemeet, $lightpurple)
		GUICtrlSetFont($checkboxtext_googlemeet, 9, 700, "", "Albert-Jan Pool")
	; VLC
	$checkbox_vlc = GUICtrlCreateCheckbox("", 885, 40, 15, 20)
	$checkboxtext_vlc = GUICtrlCreateLabel("VLC", 905, 43, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_vlc, $lightpurple)
		GUICtrlSetFont($checkboxtext_vlc, 9, 700, "", "Albert-Jan Pool")
	; Adobe Acrobat
	$checkbox_adobeacrobat = GUICtrlCreateCheckbox("", 885, 60, 15, 20)
	$checkboxtext_adobeacrobat = GUICtrlCreateLabel("Adobe Acrobat", 905, 63, 90, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_adobeacrobat, $lightpurple)
		GUICtrlSetFont($checkboxtext_adobeacrobat, 9, 700, "", "Albert-Jan Pool")
	; CurseForge
	$checkbox_curseforge = GUICtrlCreateCheckbox("", 885, 80, 15, 20)
	$checkboxtext_curseforge = GUICtrlCreateLabel("CurseForge", 905, 83, 80, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_curseforge, $lightpurple)
		GUICtrlSetFont($checkboxtext_curseforge, 9, 700, "", "Albert-Jan Pool")
	; Gmail
	$checkbox_gmail = GUICtrlCreateCheckbox("", 885, 100, 15, 20)
	$checkboxtext_gmail = GUICtrlCreateLabel("Gmail", 905, 103, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_gmail, $lightpurple)
		GUICtrlSetFont($checkboxtext_gmail, 9, 700, "", "Albert-Jan Pool")
	; Google Drive
	$checkbox_googledrive = GUICtrlCreateCheckbox("", 885, 120, 15, 20)
	$checkboxtext_googledrive = GUICtrlCreateLabel("Google Drive", 905, 123, 80, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_googledrive, $lightpurple)
		GUICtrlSetFont($checkboxtext_googledrive, 9, 700, "", "Albert-Jan Pool")
	; Java
	$checkbox_java = GUICtrlCreateCheckbox("", 885, 140, 15, 20)
	$checkboxtext_java  = GUICtrlCreateLabel("Java", 905, 143, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_java, $lightpurple)
		GUICtrlSetFont($checkboxtext_java, 9, 700, "", "Albert-Jan Pool")
	; Notepad++
	$checkbox_notepad = GUICtrlCreateCheckbox("", 885, 160, 15, 20)
	$checkboxtext_notepad = GUICtrlCreateLabel("Notepad++", 905, 163, 70, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_notepad, $lightpurple)
		GUICtrlSetFont($checkboxtext_notepad, 9, 700, "", "Albert-Jan Pool")
	; Teamviewer
	$checkbox_teamviewer = GUICtrlCreateCheckbox("", 885, 180, 15, 20)
	$checkboxtext_teamviewer = GUICtrlCreateLabel("Teamviewer", 905, 183, 80, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_teamviewer, $lightpurple)
		GUICtrlSetFont($checkboxtext_teamviewer, 9, 700, "", "Albert-Jan Pool")
	; TeamviewerHost
	$checkbox_teamviewerhost = GUICtrlCreateCheckbox("", 885, 200, 15, 20)
	$checkboxtext_teamviewerhost = GUICtrlCreateLabel("Teamviewer Host", 905, 203, 120, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_teamviewerhost, $lightpurple)
		GUICtrlSetFont($checkboxtext_teamviewerhost, 9, 700, "", "Albert-Jan Pool")
	; WeMod
	$checkbox_wemod = GUICtrlCreateCheckbox("", 885, 220, 15, 20)
	$checkboxtext_wemod = GUICtrlCreateLabel("WeMod", 905, 223, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_wemod, $lightpurple)
		GUICtrlSetFont($checkboxtext_wemod, 9, 700, "", "Albert-Jan Pool")
	; WinRAR
	$checkbox_winrar = GUICtrlCreateCheckbox("", 885, 240, 15, 20)
	$checkboxtext_winrar = GUICtrlCreateLabel("WinRAR", 905, 243, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_winrar, $lightpurple)
		GUICtrlSetFont($checkboxtext_winrar, 9, 700, "", "Albert-Jan Pool")
	; 7-Zip
	$checkbox_7zip = GUICtrlCreateCheckbox("", 885, 260, 15, 20)
	$checkboxtext_7zip = GUICtrlCreateLabel("7-Zip", 905, 263, 50, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_7zip, $lightpurple)
		GUICtrlSetFont($checkboxtext_7zip, 9, 700, "", "Albert-Jan Pool")
	; Spotify
	$checkbox_spotify = GUICtrlCreateCheckbox("", 885, 280, 15, 20)
	$checkboxtext_spotify = GUICtrlCreateLabel("Spotify [MS]", 905, 283, 70, 20)
		; Layout
		GUICtrlSetColor($checkboxtext_spotify, $lightpurple)
		GUICtrlSetFont($checkboxtext_spotify, 9, 700, "", "Albert-Jan Pool")


; ____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
; [Category]
	$category_browser = GUICtrlCreateLabel("Browser", 20, 20, 100, 20)
		; Layout
		GUICtrlSetFont($category_browser, 12, 700, "", "Albert-Jan Pool")
		GUICtrlSetColor($category_browser, $white)
	$category_tools = GUICtrlCreateLabel("Tools", 155, 20, 60, 20)
		; Layout
		GUICtrlSetFont($category_tools, 12, 700, "", "Albert-Jan Pool")
		GUICtrlSetColor($category_tools, $white)
	$category_development = GUICtrlCreateLabel("Development", 360, 20, 120, 20)
		; Layout
		GUICtrlSetFont($category_development, 12, 700, "", "Albert-Jan Pool")
		GUICtrlSetColor($category_development, $white)
	$category_social = GUICtrlCreateLabel("Social", 535, 20, 120, 20)
		; Layout
		GUICtrlSetFont($category_social, 12, 700, "", "Albert-Jan Pool")
		GUICtrlSetColor($category_social, $white)	
	$category_gaming= GUICtrlCreateLabel("Gaming", 695, 20, 100, 20)
		; Layout
		GUICtrlSetFont($category_gaming, 12, 700, "", "Albert-Jan Pool")
		GUICtrlSetColor($category_gaming, $white)	
	$category_other = GUICtrlCreateLabel("Others", 885, 20, 50, 20)
		; Layout
		GUICtrlSetFont($category_other, 12, 700, "", "Albert-Jan Pool")
		GUICtrlSetColor($category_other, $white)	


; ____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
; [Button Function]
	While True
		Switch GUIGetMsg()
			Case $gui_event_close
				ExitLoop
			Case $button_install
				Local $selectedPrograms = ""
				InstallPrograms('Install')
			Case $button_uninstall
				Local $selectedPrograms = ""
				InstallPrograms('Uninstall')
			;Case $button_shutdown
			;	Local $ianswer = MsgBox(BitOR($mb_yesno, $mb_iconquestion), "Shutdown", "Do you want to shut down the PC?")
			;	If $iAnswer = $IDNO Then
			;		MsgBox(0, "Cancel", "Shutdown cancelled.")
			;	Else
			;		Run('shutdown /s /t 10')
			;	EndIf
			;Case $button_restart
				;Local $ianswer = MsgBox(BitOR($mb_yesno, $mb_iconquestion), "Restart", "Do you want to restart the PC?")
				;If $ianswer = $idno Then
				;	MsgBox(0, "Cancel", "Restart cancelled.")
				;Else
				;	Run('shutdown /r /t 10')
				;EndIf
			Case $button_game1
				$randomNumber = Random(1, 3, 1)
				Switch $randomNumber
				Case 1
					MsgBox(0, "Rock paper scissors", "Rock")
				Case 2
					MsgBox(0, "Rock paper scissors", "Paper")
				Case 3
					MsgBox(0, "Rock paper scissors", "Scissors")
				EndSwitch
			;Case $button_appinstaller
			;	ShellExecute("ms-windows-store://pdp/?ProductId=9nblggh4nns1")
			Case $button_upgradeprograms
				Run('winget upgrade --all')
			Case $button_programfeatures
				ShellExecute("control.exe", "appwiz.cpl")
			Case $button_standardapps
				ShellExecute("ms-settings:defaultapps", "", "", "", @SW_SHOW)
			Case $button_autostart
				ShellExecute(@StartupDir)
				ShellExecute(@StartupCommonDir)
				ShellExecute("taskmgr.exe")
			;Case $buttonAlphaTG
			;	soundPlay(@Scriptdir & "\assets\sound\wolfhowl.wav")
			Case $button_deletetemp
				RunWait(@ComSpec & ' /c del /q /s "' & $tempwindows & '\*.*" & rmdir /q /s "' & $tempwindows & '"')
				RunWait(@ComSpec & ' /c del /q /s "' & @TempDir & '\*.*" & rmdir /q /s "' & @TempDir & '"')
				If @error = 0 Then
					MsgBox($mb_ok, "Success", "Temp Folders have been cleared!")
				Else
					MsgBox($mb_iconerror, "Error", "Temp Folders have not been cleared!")
				EndIf
		EndSwitch
	WEnd


; ____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
; [Function  "Install" and "Uninstall"]
	Func InstallPrograms($param)
		Local $selectedPrograms = ""


; ____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
; [Selected Checkbox]
	; OperaGX
	If BitAND(GUICtrlRead($checkbox_operagx), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Opera.OperaGX '
	EndIf
	; Opera
	If BitAND(GUICtrlRead($checkbox_opera), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Opera.Opera '
	EndIf
	; Google Chrome
	If BitAND(GUICtrlRead($checkbox_chrome), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Google.Chrome '
	EndIf
	; Firefox
	If BitAND(GUICtrlRead($checkbox_firefox), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Mozilla.Firefox '
	EndIf
	; Edge
	If BitAND(GUICtrlRead($checkbox_edge), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Microsoft.Edge '
	EndIf
	; Tor Browser
	If BitAND(GUICtrlRead($checkbox_torbrowser), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'TorProject.TorBrowser '
	EndIf
	; Steam
	If BitAND(GUICtrlRead($checkbox_steam), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Valve.Steam '
	EndIf
	; Epic Games Launcher
	If BitAND(GUICtrlRead($checkbox_epicgameslauncher), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'EpicGames.EpicGamesLauncher '
	EndIf
	; EA
	If BitAND(GUICtrlRead($checkbox_ea), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'ElectronicArts.EADesktop '
	EndIf
	; Ubisoft Connect
	If BitAND(GUICtrlRead($checkbox_ubisoftconnect), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Ubisoft.Connect '
	EndIf
	; GOG GALAXY
	If BitAND(GUICtrlRead($checkbox_goggalaxy), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'GOG.Galaxy '
	EndIf
	; 4K Video Downloader
	If BitAND(GUICtrlRead($checkbox_4kvideodownloader), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'OpenMedia.4KVideoDownloader '
	EndIf
	; Advanced IP Scanner
	If BitAND(GUICtrlRead($checkbox_advancedipscanner), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Famatech.AdvancedIPScanner '
	EndIf
	; Ear Trumpet
	If BitAND(GUICtrlRead($checkbox_eartrumpet), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'File-New-Project.EarTrumpet '
	EndIf
	; Everything
	If BitAND(GUICtrlRead($checkbox_everything), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'voidtools.Everything '
	EndIf
	; File Converter
	If BitAND(GUICtrlRead($checkbox_fileconverter), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'AdrienAllard.FileConverter '
	EndIf
	; IObit Unlocker
	If BitAND(GUICtrlRead($checkbox_iobitunlocker), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'IObit.IObitUnlocker '
	EndIf
	; MiniTool Partition Wizard
	If BitAND(GUICtrlRead($checkbox_minitoolpartitionwizard), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'MiniTool.PartitionWizard.Free '
	EndIf
	; Nmap
	If BitAND(GUICtrlRead($checkbox_nmap), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Insecure.Nmap '
	EndIf
	; Quicklook
	If BitAND(GUICtrlRead($checkbox_quicklook), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'QL-Win.QuickLook '
	EndIf
	; TreeSizeFree
	If BitAND(GUICtrlRead($checkbox_treesizefree), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'JAMSoftware.TreeSize.Free '
	EndIf
	; Wireshark
	If BitAND(GUICtrlRead($checkbox_wireshark), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'WiresharkFoundation.Wireshark '
	EndIf
	; VisualStudioCode
	If BitAND(GUICtrlRead($checkbox_visualstudiocode), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Microsoft.VisualStudioCode '
	EndIf
	; IntelliJ Community
	If BitAND(GUICtrlRead($checkbox_intellijcommunity), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'JetBrains.IntelliJIDEA.Community '
	EndIf
	; IntelliJ Educational
	If BitAND(GUICtrlRead($checkboxtext_intellijeducational), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'JetBrains.IntelliJIDEA.Edu '
	EndIf
	; IntelliJ Ultimate
	If BitAND(GUICtrlRead($checkboxtext_intellijultimate), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'JetBrains.IntelliJIDEA.Ultimate '
	EndIf
	; AutoIT
	If BitAND(GUICtrlRead($checkbox_autoit), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'AutoIt.AutoIt '
	EndIf
	; Android Studio
	If BitAND(GUICtrlRead($checkbox_androidstudio), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Google.AndroidStudio '
	EndIf
	; XAMPP
	If BitAND(GUICtrlRead($checkbox_xampp), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'ApacheFriends.Xampp.8.2 '
	EndIf
	; Windows SDK
	If BitAND(GUICtrlRead($checkbox_windowssdk), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Microsoft.WindowsSDK.10.0.22621 '
	EndIf
	; Python
	If BitAND(GUICtrlRead($checkbox_python), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Python.Python.3.12 '
	EndIf
	; Discord
	If BitAND(GUICtrlRead($checkbox_discord), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Discord.Discord '
	EndIf
	; TeamSpeak
	If BitAND(GUICtrlRead($checkbox_teamspeak), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'TeamSpeakSystems.TeamSpeakClient '
	EndIf
	; Microsoft Teams
	If BitAND(GUICtrlRead($checkbox_microsoftteams), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Microsoft.Teams '
	EndIf
	; Whatsapp
	If BitAND(GUICtrlRead($checkbox_whatsapp), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= '9NKSQGP7F2NH '
	EndIf
	; Zoom
	If BitAND(GUICtrlRead($checkbox_zoom), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Zoom.Zoom '
	EndIf
	; Google Meet
	If BitAND(GUICtrlRead($checkbox_googlemeet), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'arjun-g.google-meet-desktop '
	EndIf
	; VLC
	If BitAND(GUICtrlRead($checkbox_vlc), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'VideoLAN.VLC '
	EndIf
	; Adobe Acrobat
	If BitAND(GUICtrlRead($checkbox_adobeacrobat), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Adobe.Acrobat.Reader.64-bit '
	EndIf
	; CurseForge
	If BitAND(GUICtrlRead($checkbox_curseforge), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Overwolf.CurseForge '
	EndIf
	; Gmail
	If BitAND(GUICtrlRead($checkbox_gmail), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'timche.gmail-desktop '
	EndIf
	; Google Drive
	If BitAND(GUICtrlRead($checkbox_googledrive), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Google.Drive '
	EndIf
	; Java
	If BitAND(GUICtrlRead($checkbox_java), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Oracle.JavaRuntimeEnvironment '
	EndIf
	; Minecraft
	If BitAND(GUICtrlRead($checkbox_minecraft), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Mojang.MinecraftLauncher '
	EndIf
	; Notepad++
	If BitAND(GUICtrlRead($checkbox_notepad), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Notepad++.Notepad++ '
	EndIf
	; Teamviewer
	If BitAND(GUICtrlRead($checkbox_teamviewer), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'TeamViewer.TeamViewer '
	EndIf
	; Teamviewer Host
	If BitAND(GUICtrlRead($checkbox_teamviewerhost), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'TeamViewer.TeamViewer.Host '
	EndIf
	; WeMod
	If BitAND(GUICtrlRead($checkbox_wemod), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'WeMod.WeMod '
	EndIf
	; WinRAR
	If BitAND(GUICtrlRead($checkbox_winrar), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'RARLab.WinRAR '
	EndIf
	; 7-Zip
	If BitAND(GUICtrlRead($checkbox_7zip), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= '7zip.7zip '
	EndIf
	; Spotify
	If BitAND(GUICtrlRead($checkbox_spotify), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= '9NCBCSZSJRSB '
	EndIf
	; Lunar Client
	If BitAND(GUICtrlRead($checkbox_lunarclient), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Moonsworth.LunarClient '
	EndIf
	; Badlion Client
	If BitAND(GUICtrlRead($checkbox_badlionclient), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Badlion.BadlionClient '
	EndIf
	; Powertoys
	If BitAND(GUICtrlRead($checkbox_powertoys), $GUI_CHECKED) = $GUI_CHECKED Then
		$selectedPrograms &= 'Microsoft.PowerToys '
	EndIf


; ____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________
; [Function  "Install" and "Uninstall"]
	If $selectedPrograms <> "" Then
		Local $programList = StringSplit($selectedPrograms, " ")
		For $i = 1 To $programList[0]
			RunWait(@ComSpec & ' /c winget ' & $param & ' --id "' & $programList[$i], "", @SW_SHOW)
		Next
		MsgBox(64, "SUCCESS", '' & $param & ' complete!')
	Else
		MsgBox(64, "ERROR", "No programs selected!")
	EndIf
	EndFunc


; ____________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________

_GDIPlus_Shutdown()
GUIDelete()
