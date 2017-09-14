; Piano Bot

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force

lst := {"FurElise" : "fDfDfadsp tupa uOas ufDfDfadsp tupa usap asdf ogfd ifds udsa ufuffxDfDfDfDfDfDfadsp tupa uOas ufDfDfadsp tupa usap", "Hallelujah" : "uooo oppp uooo oppp opp ppp ooio uooo oppa sss sssd sddd ffdd su opp pouu uopp pou iuy trt"}
Run, https://virtualpiano.net/
Gui, PianoBot: Font, Bold
Gui, PianoBot: Add, Text,, Key Delay
Gui, PianoBot: Add, Edit, x10 y20 w40 vKeyDelay, 250
Gui, PianoBot: Add, Button, x125 y20 gPlayMelody, Play
Gui, PianoBot: Add, DropDownList, x10 y50 w150 vMelodies gMelodySelect
Gui, PianoBot: Add, Edit, x10 y80 R10 w150 vMelody
for key, value in lst
{
	melodiesList .= key "|"
}
GuiControl, PianoBot: , Melodies, % melodiesList
Gui, PianoBot: Color, Aqua
Gui, PianoBot: -MinimizeBox
Gui, PianoBot: +AlwaysOnTop
Gui, PianoBot: Show, Hide
Gui, PianoBot: +LastFound
WinGetPos,,,GuiWidth
Gui, PianoBot: Show, % "x" A_ScreenWidth - GuiWidth " y0"
Return

MelodySelect:
Gui, PianoBot: Submit, Nohide
GuiControl, PianoBot:, Melody
GuiControl, PianoBot:, Melody, % lst[Melodies]
Return

PlayMelody:
WinActivate, ahk_exe chrome.exe
Gui, PianoBot: Submit, Nohide
SetKeyDelay, % KeyDelay
GuiControl, PianoBot: Disable, KeyDelay
GuiControl, PianoBot: Disable, Melody
Melody := StrReplace(Melody, "`n") ; Removes Linefeeds
Melody := StrReplace(Melody, "`r") ; Removes Carrets
Melody := StrReplace(Melody, " ") ; Removes Spaces
Send, % Melody
GuiControl, PianoBot: Enable, KeyDelay
GuiControl, PianoBot: Enable, Melody
Return

PianoBotGuiClose:
ExitApp
Return