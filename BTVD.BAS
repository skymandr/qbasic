SCREEN 12
z = 320
x = 240
dir = 8
DO
a$ = INKEY$
IF dir = 8 THEN
LINE (z - 5, x - 5)-(z + 5, x + 5), 0, BF
x = x - speed
END IF
IF dir = 4 THEN
LINE (z - 5, x - 5)-(z + 5, x + 5), 0, BF
z = z - speed
END IF
IF dir = 2 THEN
LINE (z - 5, x - 5)-(z + 5, x + 5), 0, BF
x = x + speed
END IF
IF dir = 6 THEN
LINE (z - 5, x - 5)-(z + 5, x + 5), 0, BF
z = z + speed
END IF
SELECT CASE dir
CASE 8
CIRCLE (z, x), 4, 4
PAINT (z, x), 4
PSET (z - 1, x - 2), 0
PSET (z + 1, x - 2), 0
CASE 2
CIRCLE (z, x), 4, 4
PAINT (z, x), 4
PSET (z - 1, x + 2), 0
PSET (z + 1, x + 2), 0
CASE 4
CIRCLE (z, x), 4, 4
PAINT (z, x), 4
PSET (z - 2, x - 1), 0
PSET (z - 2, x + 1), 0
CASE 6
CIRCLE (z, x), 4, 4
PAINT (z, x), 4
PSET (z + 2, x - 1), 0
PSET (z + 2, x + 1), 0
END SELECT
IF a$ = " " THEN
SOUND 370, 2
SOUND 400, 2
SELECT CASE dir
CASE 8
PSET (z - 1, x - 2), 3
PSET (z + 1, x - 2), 3
CASE 2
PSET (z - 1, x + 2), 3
PSET (z + 1, x + 2), 3
CASE 4
PSET (z - 2, x - 1), 3
PSET (z - 2, x + 1), 3
CASE 6
PSET (z + 2, x - 1)
PSET (z + 2, x + 1)
END SELECT
END IF
IF a$ = CHR$(0) + "H" THEN dir = 8
IF a$ = CHR$(0) + "K" THEN dir = 4
IF a$ = CHR$(0) + "M" THEN dir = 6
IF a$ = CHR$(0) + "P" THEN dir = 2
IF a$ = "+" THEN speed = speed + .5
IF a$ = "-" THEN speed = speed - .5
IF a$ = "*" THEN speed = 10
IF a$ = "/" THEN speed = .5
IF speed < .5 THEN speed = .5
IF speed > 10 THEN speed = 10
IF x > 480 THEN x = 0
IF x < 0 THEN x = 480
IF z > 640 THEN z = 0
IF z < 0 THEN z = 640
LOOP

