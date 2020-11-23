CLS
SCREEN 12
x = 320
y = 240
DO
RANDOMIZE TIMER
'D S
CIRCLE (320, 240), 200, 7
LINE (120, 240)-(520, 240), 8
CIRCLE (320, 135), 75, 8
CIRCLE (320, 135), 1, 8
'R
LINE (x - 3, y)-(x - 3, y + 6), 0
LINE (x + 3, y)-(x + 3, y + 6), 0
LINE -(x - 3, y + 6), 0
LINE (x, y + 6)-(x, y + 13), 0
LINE -(x - 1, y + 13), 0
LINE (x, y + 13)-(x + 2, y + 13), 0
LINE -(x + 2, y + 10), 0
LINE -(x - 2, y + 10), 0
LINE -(x - 2, y + 13), 0
LINE (x - 1, y + 14)-(x + 1, y + 14), 0
y = y + 10
x = x - 1
LINE (x - 3, y)-(x - 3, y + 6)
LINE (x + 3, y)-(x + 3, y + 6)
LINE -(x - 3, y + 6)
LINE (x, y + 6)-(x, y + 13)
LINE -(x - 1, y + 13)
LINE (x, y + 13)-(x + 2, y + 13)
LINE -(x + 2, y + 10)
LINE -(x - 2, y + 10)
LINE -(x - 2, y + 13)
LINE (x - 1, y + 14)-(x + 1, y + 14)
IF y > 500 THEN EXIT DO
LOOP
col = 15
DO
xp = xp + 1
CIRCLE (320, 240), xp, col
PSET (320, 240), col
IF xp > 400 THEN
xp = 0
col = 0
ti = ti + 1
IF ti = 2 THEN EXIT DO
END IF
IF ti = 1 AND xp = 190 THEN CIRCLE (320, 135), 75, 0
LOOP
PRINT "YOU MADE IT!"
PLAY "MB L64 c9 c9 c9 c2 g2 f9 e9 d9 o5 c2 o4 g4 f9 e9 d9 o5 c2 o4 g4 f9 e9 f9 d2"

