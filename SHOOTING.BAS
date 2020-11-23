'
'
'
'-----------------------------Shooting Gallery-------------------------------
'
'by Ventrue 
'


'The actual program begins here.  Press the F5 key to start!

COLOR 14, 0: CLS
themanspeed = 700
up = 0
row = 1
ccolum = 1
person$ = CHR$(2)
catcher$ = CHR$(208)
anew:
sdf:
RANDOMIZE TIMER
  ccco = INT(RND * 250) + 1
  IF ccco = 7 THEN GOTO sdf
  IF ccco = 11 THEN GOTO sdf
  LET person$ = CHR$(ccco)
  LOCATE 1, 80
RANDOMIZE TIMER
  colum = INT(RND * 80) + 1
  FOR e = 0 TO 80 STEP 2
  IF colum = e THEN GOTO anew
  NEXT e
palay:
LOCATE row, colum
PRINT person$
LOCATE 23, ccolum
PRINT catcher$
DO:
up = up + 1
y$ = INKEY$
IF y$ = "5" THEN
COLOR 2, 4
CLS
GOSUB drawscreen
FOR t = 1 TO 100: NEXT t
 COLOR 14, 0
GOSUB drawscreen
IF ccolum = colum THEN
GOSUB animate
GOTO anew
END IF
END IF
IF y$ = "4" THEN
LET ccolum = ccolum - 2
IF ccolum < 1 THEN ccolum = 1
 COLOR 14, 0: CLS
LOCATE row, colum
PRINT person$
LOCATE 23, ccolum
PRINT catcher$
END IF
IF y$ = "6" THEN
ccolum = ccolum + 2
IF ccolum > 79 THEN ccolum = 79
 COLOR 14, 0: CLS
LOCATE row, colum
PRINT person$
LOCATE 23, ccolum
PRINT catcher$
END IF
LOOP WHILE up <> themanspeed
 COLOR 14, 0: CLS
up = 0
row = row + 1
IF row = 23 THEN
GOTO eend
END IF
IF freddy = 1 THEN
freddy = 0
GOTO anew
END IF
GOTO palay
eend:
 COLOR 14, 0: CLS
PRINT "GAME OVER!"
PRINT "Points:"; pts
SYSTEM
drawscreen:
LOCATE row, colum
PRINT perosn$
LOCATE 23, ccolum
PRINT catcher$
RETURN
animate:
COLOR 4, 0
LOCATE row, colum
PRINT CHR$(177)
FOR t = 1 TO 1000: NEXT t
LOCATE row, colum
PRINT CHR$(178)
FOR t = 1 TO 1000: NEXT t
LOCATE row, colum
PRINT CHR$(176)
FOR t = 1 TO 1000: NEXT t
LET pts = pts + 1
LET row = 1
LET colum = 1
RETURN
RETURN

