SCREEN 12
CONST PI = 3.14159265358#
x = 320
y = 300
DO
CIRCLE (320, 240), 200
a$ = INKEY$
LINE (x, y)-(xl, yl), 0
LINE (x, y)-(xr, yr), 0
LINE (xl, yl)-(xr, yr), 0
xl = SIN(s - 60 / 180 * PI) * 100 + x
yl = COS(s - 60 / 180 * PI) * 100 + y
xr = SIN(s + 60 / 180 * PI) * 100 + x
yr = COS(s + 60 / 180 * PI) * 100 + y
IF a$ = CHR$(0) + "K" THEN
s = s + .1
ELSEIF a$ = CHR$(0) + "M" THEN s = s - .1
ELSEIF a$ = CHR$(0) + "H" THEN y = y - 1
ELSEIF a$ = CHR$(0) + "P" THEN y = y + 1
ELSEIF a$ = "+" THEN sp = sp + 1
ELSEIF a$ = "-" THEN sp = sp - 1
END IF
LINE (x, y)-(xl, yl)
LINE (x, y)-(xr, yr)
LINE (xl, yl)-(xr, yr)
LOOP

