;C:\Users\gbr\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup
#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.

openOneNote(createNewPage) 
{
	IfWinNotExist ahk_exe ONENOTE.EXE
	{
		;start one note
		Run C:\Program Files (x86)\Microsoft Office\Office14\ONENOTE.EXE
		return
	}
	if(createNewPage <> false)
	{
		IfWinActive ahk_exe OneNote.exe
		{
			;create new page
			Send, ^n
			return
		}
	}
	IfWinExist ahk_exe OneNote.exe
	{
		;focus
		WinActivate
		return
	}
}



#F20:: ;click erasor on pen
openOneNote(false) 
return

#F19::  ;double click erasor on pen
	run, SnippingTool.exe
	Sleep, 500
	send, ^{PrintScreen}
	Sleep, 5000
	WinClose, ahk_exe SnippingTool.exe
	return


#F18:: ;long click erasor on 
openOneNote(true) 
return

;IfWinExist ahk_class screenClass
;{
;	Send {B}
;	return
;}
;IfWinActive ahk_exe Powerpnt.exe
;{
;	Send {F5}
;	return
;}
;else
;{
;	send {LWin Down}{PrintScreen}{LWin Up}
;	sleep 500
;	return
;}


;if in firefox flat pen button an click is middle click
;IfWinActive ahk_class MozillaWindowClass
;{
;	msgbox in firefox
;}