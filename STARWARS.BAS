tim = TIMER
FOR x = 1 TO 10000
NEXT
tim = (TIMER - tim) / 1.5
1 CLS
PRINT SPC(31); "Welcome to..."
SLEEP
PRINT SPC(33); "Star Wars"
INPUT "How Many Tie Fighters"; b%
x = 320
y = 240
dir = 4
speed = 3 * tim
z = 400
c = 400
kills = 0
shield = 3
CLS
SCREEN 12
DO

REM Skeppet
a$ = INKEY$
IF a$ = CHR$(0) + "K" THEN dir = dir - 1
IF a$ = CHR$(0) + "M" THEN dir = dir + 1
IF a$ = CHR$(0) + "H" THEN
PSET (sx, sy), 0
SOUND 1000, 2
sspeed = speed + 5
sdir = dir
sx = x
sy = y
PSET (sx, sy)
END IF
IF sdir = 4 THEN
PSET (sx, sy), 0
sy = sy - sspeed
PSET (sx, sy)
END IF
IF sdir = 3 THEN
PSET (sx, sy), 0
sx = sx - sspeed
PSET (sx, sy)
END IF
IF sdir = 2 THEN
PSET (sx, sy), 0
sy = sy + sspeed
PSET (sx, sy)
END IF
IF sdir = 1 THEN
PSET (sx, sy), 0
sx = sx + sspeed
PSET (sx, sy)
END IF
IF a$ = "+" THEN speed = speed + tim
IF a$ = "-" THEN speed = speed - tim
IF speed < 1 * tim THEN speed = 1 * tim
IF speed > 10 * tim THEN speed = 10 * tim
IF dir > 4 THEN dir = 1
IF dir < 1 THEN dir = 4
LINE (x - 10, y - 10)-(x + 10, y + 10), 0, BF
IF dir = 4 THEN y = y - speed
IF dir = 3 THEN x = x - speed
IF dir = 2 THEN y = y + speed
IF dir = 1 THEN x = x + speed
IF x > 640 THEN x = 0
IF x < 0 THEN x = 640
IF y > 480 THEN y = 0
IF y < 0 THEN y = 480
SELECT CASE dir
CASE 4
LINE (x, y)-(x + 5, y + 10)
LINE (x, y)-(x - 5, y + 10)
CASE 3
LINE (x, y)-(x + 10, y - 5)
LINE (x, y)-(x + 10, y + 5)
CASE 2
LINE (x, y)-(x + 5, y - 10)
LINE (x, y)-(x - 5, y - 10)
CASE 1
LINE (x, y)-(x - 10, y - 5)
LINE (x, y)-(x - 10, y + 5)
END SELECT

REM M„tare
LOCATE 1, 1
PRINT "Speed:"; INT(speed / tim + .5)
PRINT "Kills:"; kills
PRINT "Left:"; b% - kills
PRINT "Shield:"; shield
IF shield < 1 THEN
PRINT SPC(30); "You are space dust!"
SLEEP
PRINT SPC(35); "Game Over"
2 INPUT "Do You Want To Play Again"; a$
IF a$ = "y" OR a$ = "Y" THEN GOTO 1
PRINT "Thanks for playing StarWars 1.0! I hope you enjoyed it!"
SLEEP
STOP
END IF
IF kills = b% THEN
PRINT SPC(33); "You Made It!!!"
GOTO 2
END IF

REM Fiender
CIRCLE (400, 400), 20, 7
CIRCLE (400, 390), 7, 8
PSET (400, 390), 8
LINE (380, 400)-(420, 400), 8
CIRCLE (z, c), 5, 0
IF speed > 5 * tim THEN
espeed = 7 * tim
ELSE
espeed = 5 * tim
END IF
IF z > x THEN
z = z - espeed
edir = 3
END IF
IF z < x THEN
z = z + espeed
edir = 1
END IF
IF c > y THEN
c = c - espeed
edir = 4
END IF
IF c < y THEN
c = c + espeed
edir = 2
END IF
'IF z > x - 6 AND z < x + 6 AND c > y THEN
'SOUND 753, 2
'esspeed = espeed + 5*tim
'esx = z
'esy = c
'esdir = edir
'END IF
'IF z > x - 6 AND z < x + 6 AND c < y THEN
'SOUND 753, 2
'esspeed = espeed + 5*tim
'esx = z
'esy = c
'esdir = edir
'END IF
'IF c > y - 6 AND c < y + 6 AND z > x THEN
'SOUND 753, 2
'esspeed = espeed + 5*tim
'esx = z
'esy = c
'esdir = edir
'END IF
'IF c > y - 6 AND c < y + 6 AND z < x THEN
'SOUND 753, 2
'esspeed = espeed + 5*tim
'esx = z
'esy = c
'esdir = edir
'END IF
IF sx > z - 6 AND sx < z + 6 AND sy > c - 6 AND sy < c + 6 THEN
kills = kills + 1
PSET (sx, sy), 0
sx = -9
sy = -9
sdir = 0
z = 400
c = 400
END IF
CIRCLE (z, c), 5, 7
IF x > z - 9 AND x < z + 9 AND y > c - 9 AND y < c + 9 THEN
CIRCLE (z, c), 5, 0
z = 400
c = 400
shield = shield - 1
kills = kills + 1
END IF
LOOP

