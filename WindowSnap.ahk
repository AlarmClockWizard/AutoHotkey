getMonitorIdentiferOfCurrentWindow()
{
  WinGetPos,x,y,w,h,a,,,
	   
  SysGet, monitorRoi1, MonitorWorkArea, 1  
  SysGet, monitorRoi2, MonitorWorkArea, 2    
  SysGet, monitorRoi3, MonitorWorkArea, 3
  
  ; gbr system                           --------
  ;                                     |        |
  ;   --------------    -------------   |        |
  ;  |              |  |             |  |        |
  ;  |      3       |  |      1      |  |   2    |
  ;  |              |  |             |  |        |
  ;   --------------    -------------   |        |
  ;                                     |        |
  ;                                      --------
  ;
  
  magicXOffset := 8
  position := x + magicXOffset
  bool3 := position < %monitorRoi1Left%
  bool1 := position < 1920 ;%monitorRoi2Left%
  bool2 := position > %monitorRoi1Right%
  
  if(bool3)
  {
	return 3
  }
  if(bool1)
  {
	return 1
  }
  return 2
}

 ; positionIdentifier
 ;
 ; 7 8 9
 ; 4 5 6
 ; 1 2 3
  
moveActiveWindowToPosition(positionIdentifier)
{
  monitorIdentifier := getMonitorIdentiferOfCurrentWindow()

  WinGetPos, windowX, windowY, windowW, windowH, windowA,,,
  WinGetPos,trayX, trayY, trayW, trayH ,ahk_class Shell_TrayWnd,,,
  
  if(monitorIdentifier == 1)
  {
	SysGet, monitorRoi, MonitorWorkArea, 1  
  }
  if(monitorIdentifier == 2)
  {
	SysGet, monitorRoi, MonitorWorkArea, 2  
  }
  if(monitorIdentifier == 3)
  {
	SysGet, monitorRoi, MonitorWorkArea, 3  
  }
  
  ;MsgBox, monitorIdentifier %monitorIdentifier% Left: %monitorRoiLeft% -- Top: %monitorRoiTop% -- Right: %monitorRoiRight% -- Bottom %monitorRoiBottom% -- trayH %trayH%.

  targetX := monitorRoiLeft
  targetY := monitorRoiTop
  targetW := monitorRoiRight - monitorRoiLeft
  targetH := monitorRoiBottom - targetY
  
  monitorWidth := targetW   
  monitorHeight := targetH 
  
  WinMaximize ;maximize window to level playing grounds
  
  {  
	if(positionIdentifier == 1)
	{
	  targetX := targetX
	  targetY := targetY + monitorHeight/2
	  targetW := targetW/2
	  targetH := targetH/2
	}	
	if(positionIdentifier == 2)
	{
	  targetX := targetX
	  targetY := targetY + monitorHeight/2
	  targetW := targetW
	  targetH := targetH/2
	}
	if(positionIdentifier == 3)
	{
	  targetX := monitorRoiLeft + monitorWidth/2
	  targetY := targetY + monitorHeight/2
	  targetW := targetW/2
	  targetH := targetH/2
	}
	if(positionIdentifier == 4)
	{
	  targetX := targetX
	  targetY := targetY
	  targetW := targetW/2
	  targetH := targetH
	}
	if(positionIdentifier == 5)
	{
      ;nothing to do
	}
	if(positionIdentifier == 6)
	{
	  targetX := monitorRoiLeft + monitorWidth/2
	  targetY := targetY
	  targetW := targetW/2
	  targetH := targetH
	}
	if(positionIdentifier == 7)
	{
	  targetX := targetX
	  targetY := targetY
	  targetW := targetW/2
	  targetH := targetH/2
	}
	if(positionIdentifier == 8)
	{
	  targetX := monitorRoiLeft
	  targetY := targetY
	  targetW := targetW
	  targetH := targetH/2
	}
	if(positionIdentifier == 9)
	{
	  targetX := monitorRoiLeft + monitorWidth/2
	  targetY := targetY
	  targetW := targetW/2
	  targetH := targetH/2
	}		

	WinMove,A,,targetX, targetY, targetW, targetH
	;MsgBox, monitorIdentifier %monitorIdentifier% targetX %targetX% targetY %targetY% targetW %targetW% targetH %targetH%  Left: %monitorRoiLeft% -- Top: %monitorRoiTop% -- Right: %monitorRoiRight% -- Bottom %monitorRoiBottom%.
  }
}

; Move window up (Windows + Shift + UP ... NOTE must maximize window first)
#Numpad1::
  moveActiveWindowToPosition(1)
  return
#Numpad2::
  moveActiveWindowToPosition(2)
  return
#Numpad3::
  moveActiveWindowToPosition(3)
  return
#Numpad4::
  moveActiveWindowToPosition(4)
  return
#Numpad5::
  moveActiveWindowToPosition(5)
  return
#Numpad6::
  moveActiveWindowToPosition(6)
  return
#Numpad7::
  moveActiveWindowToPosition(7)
  return
#Numpad8::
  moveActiveWindowToPosition(8)
  return
#Numpad9::
  moveActiveWindowToPosition(9)
  return
