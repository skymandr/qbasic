SCREEN 12
z = 320
x = 240
DO
CIRCLE (z, x), 3, 4
PAINT (z, x), 4
PSET (z - 1, x - 2), 0
PSET (z + 1, x - 2), 0
LINE (z, x)-(z + 4, x + 5), 4
LINE (z - 1, x)-(z - 4, x + 5), 4
LINE (z, x)-(z + 5, x - 3), 4
LINE (z + 1, x)-(z - 5, x - 3), 4
LOOP UNTIL INKEY$ <> ""

