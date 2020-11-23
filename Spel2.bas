SCREEN 12
RANDOMIZE TIMER
sx = -9
sy = -9
x = 9
y = 9
dir = 6
DO
RANDOMIZE TIMER
a$ = INKEY$
IF a$ <> "" THEN
CIRCLE (x, y), 5, 0
IF dir = 8 THEN
LINE (x, y)-(x, y - 5), 0
ELSEIF dir = 4 THEN LINE (x, y)-(x - 5, y), 0
ELSEIF dir = 6 THEN LINE (x, y)-(x + 5, y), 0
ELSEIF dir = 2 THEN LINE (x, y)-(x, y + 5), 0
END IF
END IF
CIRCLE (sx, sy), 2, 0
IF a$ = CHR$(0) + "H" THEN
y = y - 3: dir = 8
ELSEIF a$ = CHR$(0) + "K" THEN x = x - 3: dir = 4
ELSEIF a$ = CHR$(0) + "M" THEN x = x + 3: dir = 6
ELSEIF a$ = CHR$(0) + "P" THEN y = y + 3: dir = 2
ELSEIF a$ = " " THEN CIRCLE (sx, sy), 2, 0: sdir = dir: sx = x: sy = y
END IF
CIRCLE (x, y), 5
IF dir = 8 THEN
LINE (x, y)-(x, y - 5)
ELSEIF dir = 4 THEN LINE (x, y)-(x - 5, y)
ELSEIF dir = 6 THEN LINE (x, y)-(x + 5, y)
ELSEIF dir = 2 THEN LINE (x, y)-(x, y + 5)
END IF
IF sdir = 8 THEN
sy = sy - 5
ELSEIF sdir = 4 THEN sx = sx - 3
ELSEIF sdir = 6 THEN sx = sx + 3
ELSEIF sdir = 2 THEN sy = sy + 3
END IF
CIRCLE (sx, sy), 2, 5
LOOP

