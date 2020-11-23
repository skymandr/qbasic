SCREEN 13
x = 220
y = 45
DO
a$ = INKEY$
FOR q = 1 TO 123
NEXT
LINE (x - 56, y - 12)-(x + 23, y + 99), 0, BF
ax = x - 9
ay = y + 23
abx = x + 10
aby = y + 18
fx = x
fy = y + 85
hx = x + 10
hy = y + 85
kx = x + 2
ky = y + 60
IF a$ = CHR$(0) + "K" THEN
x = x - 5
ELSEIF a$ = CHR$(0) + "M" THEN x = x + 5
END IF
IF a$ = CHR$(13) THEN kx = x - 28: ky = y + 45: hx = x - 45: hy = y + 50: fx = x - 53: fy = y + 47
IF a$ = "+" THEN kx = x - 28: ky = y + 45: hx = x - 32: hy = y + 65: fx = x - 36: fy = y + 68
IF a$ = " " THEN abx = x - 18: aby = y + 13: ax = x - 29: ay = y + 12
IF a$ = "-" THEN abx = x - 12: ax = x - 20: ay = y + 6
'Head n' body
CIRCLE (x, y), 7
PAINT (x, y)
PSET (x - 4, y - 2), 0
LINE (x, y)-(x, y + 40)
'Vb
LINE -(kx, ky)
LINE -(hx, hy)
LINE -(fx, fy)
'Hb
LINE (x, y + 41)-(x - 9, y + 60)
LINE -(x - 7, y + 85)
LINE -(x - 15, y + 85)
'Va
LINE (x, y + 7)-(abx, aby)
LINE -(ax, ay)
'Ha
LINE (x, y + 7)-(x - 4, y + 18)
LINE -(x - 16, y + 24)
LOOP

