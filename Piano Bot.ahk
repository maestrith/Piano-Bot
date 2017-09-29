; Piano Bot

#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
;SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
#SingleInstance,Force ; prevents script reopening messages

lst := {"FurElise"   : "fDfDfadsp tupa uOas ufDfDfadsp tupa usap asdf ogfd ifds udsa ufuffxDfDfDfDfDfDfadsp tupa uOas ufDfDfadsp tupa usap"
	 , "Hallelujah" : "uooo oppp uooo oppp opp ppp ooio uooo oppa sss sssd sddd ffdd su opp pouu uopp pou iuy trt"
	 , "Mad World"  : "[es] f [ua] s [ep] a [uo] I 9 e u 9 y e s e f [ua] s [ep] a [us] d 9 e y o I u y e [es] f [ua] s [ep] a [uo] I 9 e u 9 y e s e f [ua] s [ep] a [us] d 9 e y o I e [tp] p [es] s [tp] p [tf] [sf] u f t s u [wad] d y d w a y [9pd] d y d 9 s [ya] p e [tp] p [es] s [tp] p [tf] [sf] u f t s u [wad] d y d w a y [9pd] d y d 9 s [ya] p e [tp] p [es] s [tp] p [tf] [sf] u f t s u [wad] d y d w a y [9pd] d y d 9 s [ya] p e [up] p [eps] s [sf] f G [ypd] e d G G [ypd] d [ep] u p [eps] s [sf] [sf] G d [ypd] [ed] G G [ypd] d e [up] p [eps] s [sf] f G [ypd] e d G G [ypd] d [ep] u p [eps] s [sf] [sf] G d [ypd] [ed] G G [ypd] d e [up] p [eps] s [sf] f G [ypd] e d G G [ypd] d [ep] u p [eps] s [sf] [sf] G d [ypd] [ed] G G [ypd] d e u o e s [oaf] [eyp] e a s f a s p o e u o e s [oaf] [eyp] e a s f a s p e [tp] p [es] s [tp] p [tf] [sf] u f t s u [wad] d y d w a y [9pd] d y d 9 s [ya] p e [tp] p [es] s [tp] p [tf] [sf] u f t s u [wad] d y d w a y [9pd] d y d 9 s [ya] p e [up] p [eps] s [sf] f G [ypd] e d G G [ypd] d [ep] u p [eps] s [sf] [sf] G [ypd] e G G [ypd] d e u o e s [oaf] [eyp] e a s f a s p o e u o e s [oaf] [eyp] e a s f a s p [es] f [ua] s [ep] a [uo] I 9 e u 9 y e s e f [ua] s [ep] a [us] d 9 e y o I u y e [es] f [ua] s [ep] a [uo] I 9 e u 9 y e s e f [ua] s [ep] a [us] d 9 e y o I"}
Run, https://virtualpiano.net/
Gui, Font, Bold
Gui, Add, Text,, Key Delay
;Gui, Add, Edit, x10 y20 w40 vKeyDelay, 250
Gui, Add, Slider, x10 y20 w50 Range0-1000 vKeyDelay gSlider Tooltip, 250
Gui, Add, Button, x125 y20 gPlayMelody, Play
Gui, Add, DropDownList, x10 y50 w150 vMelodies gMelodySelect
Gui, Add, Edit, x10 y80 R10 w150 vMelody
for key, value in lst ;*[Piano Bot]
{
	melodiesList .= key "|"
}
GuiControl, , Melodies, % melodiesList
Gui, Color, Aqua
Gui, -MinimizeBox +AlwaysOnTop +LastFound
Gui, Show, Hide
WinGetPos,,,GuiWidth
Gui, Show, % "x" A_ScreenWidth - GuiWidth " y0"
Return

MelodySelect:
Gui, Submit, Nohide
GuiControl, , Melody
GuiControl, , Melody, % lst[Melodies]
Return

PlayMelody:
WinActivate, ahk_exe chrome.exe
Gui, Submit, Nohide
SetKeyDelay, % KeyDelay
GuiControl, Disable, KeyDelay
GuiControl, Disable, Melody
Melody := StrReplace(Melody, "`n") ; Removes Linefeeds
Melody := StrReplace(Melody, "`r") ; Removes Carrets
Melody := StrReplace(Melody, " ") ; Removes Spaces
Send, % Melody
GuiControl, Enable, KeyDelay
GuiControl, Enable, Melody
Return

Slider:
Gui, Submit, NoHide
Return

GuiClose:
ExitApp