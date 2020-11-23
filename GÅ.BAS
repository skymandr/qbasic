CLS
PLAY "MB L64 c9 c9 c9 c2 g2 f9 e9 d9 o5 c2 o4 g4 f9 e9 d9 o5 c2 o4 g4 f9 e9 f9 d3"
PRINT SPC(15); "Welcome to StarWars The Speeder-Bike adventure!"
SLEEP
q = 100
z = 100
x = 320
Y = 240
c = 300
v = 300
speed = 5
SCREEN 12
dir = 4
DO
COLOR 3
a$ = INKEY$
'Styra
IF a$ = CHR$(0) + "K" THEN dir = dir + 1
IF a$ = CHR$(0) + "M" THEN dir = dir - 1
IF a$ = CHR$(32) THEN
SOUND 5000, 3
PSET (sx, sy), 0
sdir = dir
sspeed = speed + 5
sx = x
sy = Y
END IF
IF sdir = 4 THEN
PSET (sx, sy), 0
sy = sy - sspeed
PSET (sx, sy), 6
END IF
IF sdir = 1 THEN
PSET (sx, sy), 0
sx = sx - sspeed
PSET (sx, sy), 6
END IF
IF sdir = 2 THEN
PSET (sx, sy), 0
sy = sy + sspeed
PSET (sx, sy), 6
END IF
IF sdir = 3 THEN
PSET (sx, sy), 0
sx = sx + sspeed
PSET (sx, sy), 6
END IF
IF a$ = CHR$(0) + "H" THEN speed = speed + 1
IF a$ = CHR$(0) + "P" THEN speed = speed - 1
IF dir > 4 THEN dir = 1
IF dir < 1 THEN dir = 4
IF speed > 10 THEN speed = 10
IF speed < -5 THEN speed = -5
IF speed = 0 THEN
LOCATE 1, 1
PRINT "Stopped(speed = 0)  "
END IF
IF speed > 0 THEN
LOCATE 1, 1
PRINT "Forward(speed ="; speed; " )  "
END IF
IF speed < 0 THEN
LOCATE 1, 1
PRINT "Reverse(speed ="; speed; ")  "
END IF
PRINT "Position"; x; ","; Y; "    "
PRINT "Direction"; dir
PRINT "  4 "
PRINT "1 + 3"
PRINT "  2 "
PRINT "Points"; pnt
IF dir = 4 THEN
LINE (x - 15, Y - 15)-(x + 15, Y + 15), 0, BF
Y = Y - speed
END IF
IF dir = 1 THEN
LINE (x - 15, Y - 15)-(x + 15, Y + 15), 0, BF
x = x - speed
END IF
IF dir = 2 THEN
LINE (x - 15, Y - 15)-(x + 15, Y + 15), 0, BF
Y = Y + speed
END IF
IF dir = 3 THEN
LINE (x - 15, Y - 15)-(x + 15, Y + 15), 0, BF
x = x + speed
END IF
SELECT CASE dir
CASE 4
'Speeder
LINE (x, Y)-(x, Y + 14), 6
LINE (x - 1, Y + 1)-(x - 1, Y - 1), 6
LINE (x + 1, Y + 1)-(x + 1, Y - 1), 6
LINE (x - 3, Y + 4)-(x + 3, Y + 4), 6
'Armar
LINE (x - 3, Y + 4)-(x - 1, Y + 6), 7
LINE (x + 3, Y + 4)-(x, Y + 6), 7
'Kropp
LINE (x, Y + 5)-(x, Y + 9), 7
'Ben
LINE (x, Y + 9)-(x - 3, Y + 10), 7
LINE (x, Y + 9)-(x + 3, Y + 10), 7
LINE (x + 3, Y + 10)-(x + 2, Y + 12), 7
LINE (x - 3, Y + 10)-(x - 2, Y + 12), 7
'Huvudet
PSET (x, Y + 5), 12
PSET (x, Y + 4), 12
PSET (x - 1, Y + 5), 12
PSET (x - 1, Y + 4), 12
CASE 3
'Speeder
LINE (x, Y)-(x - 14, Y), 6
LINE (x - 1, Y + 1)-(x + 1, Y + 1), 6
LINE (x - 1, Y - 1)-(x + 1, Y - 1), 6
LINE (x - 4, Y + 3)-(x - 4, Y - 3), 6
'Armar
LINE (x - 4, Y + 3)-(x - 6, Y + 1), 7
LINE (x - 4, Y - 3)-(x - 6, Y), 7
'Kropp
LINE (x - 5, Y)-(x - 9, Y), 7
'Ben
LINE (x - 9, Y)-(x - 10, Y + 3), 7
LINE (x - 9, Y)-(x - 10, Y - 3), 7
LINE -(x - 12, Y - 2), 7
LINE (x - 10, Y + 3)-(x - 12, Y + 2), 7
'Huvudet
PSET (x - 5, Y), 12
PSET (x - 4, Y), 12
PSET (x - 5, Y + 1), 12
PSET (x - 4, Y + 1), 12
CASE 2
'Speeder
LINE (x, Y)-(x, Y - 14), 6
LINE (x + 1, Y - 1)-(x + 1, Y + 1), 6
LINE (x - 1, Y - 1)-(x - 1, Y + 1), 6
LINE (x + 3, Y - 4)-(x - 3, Y - 4), 6
'Armar
LINE (x + 3, Y - 4)-(x + 1, Y - 6), 7
LINE (x - 3, Y - 4)-(x, Y - 6), 7
'Kropp
LINE (x, Y - 5)-(x, Y - 9), 7
'Ben
LINE (x, Y - 9)-(x + 3, Y - 10), 7
LINE (x, Y - 9)-(x - 3, Y - 10), 7
LINE (x - 3, Y - 10)-(x - 2, Y - 12), 7
LINE (x + 3, Y - 10)-(x + 2, Y - 12), 7
'Huvudet
PSET (x, Y - 5), 12
PSET (x, Y - 4), 12
PSET (x - 1, Y - 5), 12
PSET (x - 1, Y - 4), 12
CASE 1
'Speeder
LINE (x, Y)-(x + 14, Y), 6
LINE (x + 1, Y - 1)-(x - 1, Y - 1), 6
LINE (x + 1, Y + 1)-(x - 1, Y + 1), 6
LINE (x + 4, Y - 3)-(x + 4, Y + 3), 6
'Armar
LINE (x + 4, Y - 3)-(x + 6, Y - 1), 7
LINE (x + 4, Y + 3)-(x + 6, Y), 7
'Kropp
LINE (x + 5, Y)-(x + 9, Y), 7
'Ben
LINE (x + 9, Y)-(x + 10, Y - 3), 7
LINE (x + 9, Y)-(x + 10, Y + 3), 7
LINE -(x + 12, Y + 2), 7
LINE (x + 10, Y - 3)-(x + 12, Y - 2), 7
'Huvudet
PSET (x + 5, Y), 12
PSET (x + 4, Y), 12
PSET (x + 5, Y - 1), 12
PSET (x + 4, Y - 1), 12
END SELECT
IF x > 640 THEN GOTO 1
IF x < 0 THEN GOTO 1
IF Y > 480 THEN GOTO 1
IF Y < 0 THEN GOTO 1

'Spiror
CIRCLE (120, 120), 5, 5
CIRCLE (210, 200), 5, 5
CIRCLE (230, 120), 5, 5
CIRCLE (220, 90), 5, 5
CIRCLE (110, 310), 5, 5
CIRCLE (280, 320), 5, 5
CIRCLE (120, 220), 5, 5
IF x > 216 AND x < 224 AND Y > 86 AND Y < 94 THEN GOTO 1
IF x > 116 AND x < 124 AND Y > 216 AND Y < 224 THEN GOTO 1
IF x > 106 AND x < 114 AND Y > 306 AND Y < 314 THEN GOTO 1
IF x > 226 AND x < 234 AND Y > 116 AND Y < 124 THEN GOTO 1
IF x > 206 AND x < 214 AND Y > 196 AND Y < 204 THEN GOTO 1
IF x > 116 AND x < 124 AND Y > 116 AND Y < 124 THEN GOTO 1
IF x > 276 AND x < 284 AND Y > 316 AND Y < 324 THEN
1 LOCATE 25, 1
PRINT "You chrashed into a stone spire on your way to the spacecraft. You have failed."
END
END IF

'Speeders
CIRCLE (c, v), 5, 0
espeed = speed - 1
IF espeed < 1 THEN espeed = 1
IF c > x THEN c = c - espeed
IF c < x THEN c = c + espeed
IF v > Y THEN v = v - espeed
IF v < Y THEN v = v + espeed
IF c > 216 AND c < 224 AND v > 96 AND v < 104 THEN GOTO 3
IF c > 116 AND c < 124 AND v > 216 AND v < 224 THEN GOTO 3
IF c > 106 AND c < 114 AND v > 306 AND v < 314 THEN GOTO 3
IF c > 196 AND c < 204 AND v > 116 AND v < 124 THEN GOTO 3
IF c > 196 AND c < 204 AND v > 196 AND v < 204 THEN GOTO 3
IF c > 116 AND c < 124 AND v > 116 AND v < 124 THEN
3 v = 450
c = 450
END IF
IF sx > c - 5 AND sx < c + 5 AND sy > v - 5 AND sy < v + 5 THEN
kills = kills + 1
pnt = pnt + 1
PSET (sx, sy), 0
sx = -9
sy = -9
sdir = 0
CIRCLE (c, v), 5, 0
v = 450
c = 450
END IF
IF x > c - 4 AND x < c + 4 AND Y > v - 4 AND Y < v + 4 THEN
2 LOCATE 25, 1
PRINT "You were shot down by a imperial speeder-bike. You have failed."
END
END IF
CIRCLE (c, v), 5, 8

'Klart
IF kills < 4 THEN GOTO 4
CIRCLE (q, z), 9, 2
IF x > q - 9 AND x < q + 9 AND Y > z - 9 AND Y < z + 9 THEN
LOCATE 25, 1
PRINT "You made it to the space craft!"
pnt = pnt + 10
PRINT "You got"; pnt; "points!"
PLAY "MB L64 c9 c9 c9 c2 g2 f9 e9 d9 o5 c2 o4 g4 f9 e9 d9 o5 c2 o4 g4 f9 e9 f9 d3"
END
END IF
4 LOOP

