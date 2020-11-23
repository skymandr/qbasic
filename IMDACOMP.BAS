SCREEN 12
CONST pi = 3.14159265#
DO
FOR x = 1 TO 360
y = y + .015
PSET (COS(x / 180 * pi) * y + 240, SIN(x / 180 * pi) * y + 200)
PSET (SIN(x / 180 * pi) * y + 400, COS(x / 180 * pi) * y + 200)
NEXT
z = z + 1
IF z = 6 THEN EXIT DO
LOOP
FOR x = -60 TO 60 STEP .1
PSET (SIN(x / 180 * pi) * 150 + 320, COS(x / 180 * pi) * 150 + 240)
NEXT
' F”r glad dator tag bort dessa linjer
LINE (200, 135)-(295, 185)
LINE (440, 135)-(335, 185)

