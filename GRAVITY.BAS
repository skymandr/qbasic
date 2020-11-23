SCREEN 11
1 INPUT "Vilken massa ska planeten ha"; mass
IF mass > 111 THEN PRINT "Lite stor kanske...": GOTO 1
IF mass < 11 THEN PRINT "Det var en g†ng en „rta...": GOTO 1
5 INPUT "M„tare(P/A)"; mezz$
IF NOT UCASE$(mezz$) = "A" AND NOT UCASE$(mezz$) = "P" THEN GOTO 5
7 INPUT "Trace(P/A)"; Trace$
IF NOT UCASE$(Trace$) = "A" AND NOT UCASE$(Trace$) = "P" THEN GOTO 5
CLS
RANDOMIZE TIMER
px = 320
py = 240
3 x = RND * 640 + 1
IF x < 320 + mass AND x > 240 - mass THEN GOTO 3
2 y = RND * 480 + 1
IF y < 240 + mass AND y > 240 - mass THEN GOTO 2
sx = x
sy = y
DO
LOCATE 1, 1
IF UCASE$(mezz$) = "A" THEN GOTO 4
PRINT "Startpos x:"; sx
PRINT "Startpos y:"; sy
PRINT "Curpos x:"; x; "         "
PRINT "Curpos y:"; y; "         "
PRINT "Xspeed:"; xspeed; "      "
PRINT "Yspeed:"; yspeed; "      "
'PRINT "Planetx:"; px; " "
'PRINT "Planety:"; py; "         "
PRINT "Planetmass:"; mass
'PRINT "Pxspeed:"; pxs; "        "
'PRINT "Pyspeed:"; pys; "        "
4 CIRCLE (px, py), mass, 0
IF UCASE$(Trace$) = "P" THEN GOTO 8
CIRCLE (x, y), 2, 0
8 IF x < px THEN xspeed = xspeed + mass / 100
IF x > px THEN xspeed = xspeed - mass / 100
IF y < py THEN yspeed = yspeed + mass / 100
IF y > py THEN yspeed = yspeed - mass / 100
x = x + xspeed
y = y + yspeed
'IF px < x THEN pxs = pxs + 2 / 100
'IF px > x THEN pxs = pxs - 2 / 100
'IF py < y THEN pys = pys + 2 / 100
'IF py > y THEN pys = pys - 2 / 100
'px = px + pxs
'py = py + pys
CIRCLE (x, y), 2
CIRCLE (px, py), mass
LOOP

