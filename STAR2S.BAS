SCREEN 13
CONST pi = 3.141593
DO
FOR x = 1 TO 360
y = y + 1
PSET (y, COS(x / 180 * pi) * 32 + 67)
PSET (y - 1, COS((x - 1) / 180 * pi) * 32 + 67), 31
PSET (y - 2, COS((x - 2) / 180 * pi) * 32 + 67), 30
PSET (y - 3, COS((x - 3) / 180 * pi) * 32 + 67), 29
PSET (y - 4, COS((x - 4) / 180 * pi) * 32 + 67), 28
PSET (y - 5, COS((x - 5) / 180 * pi) * 32 + 67), 27
PSET (y - 6, COS((x - 6) / 180 * pi) * 32 + 67), 26
PSET (y - 7, COS((x - 7) / 180 * pi) * 32 + 67), 25
PSET (y - 8, COS((x - 8) / 180 * pi) * 32 + 67), 24
PSET (y - 9, COS((x - 9) / 180 * pi) * 32 + 67), 23
PSET (y - 10, COS((x - 10) / 180 * pi) * 32 + 67), 22
PSET (y - 11, COS((x - 11) / 180 * pi) * 32 + 67), 21
PSET (y - 12, COS((x - 12) / 180 * pi) * 32 + 67), 20
PSET (y - 13, COS((x - 13) / 180 * pi) * 32 + 67), 19
PSET (y - 14, COS((x - 14) / 180 * pi) * 32 + 67), 18
PSET (y - 15, COS((x - 15) / 180 * pi) * 32 + 67), 17
PSET (y - 16, COS((x - 16) / 180 * pi) * 32 + 67), 16
PSET (y - 17, COS((x - 17) / 180 * pi) * 32 + 67), 0

PSET (y, SIN(x / 180 * pi) * 32 + 67)
PSET (y - 1, SIN((x - 1) / 180 * pi) * 32 + 67), 31
PSET (y - 2, SIN((x - 2) / 180 * pi) * 32 + 67), 30
PSET (y - 3, SIN((x - 3) / 180 * pi) * 32 + 67), 29
PSET (y - 4, SIN((x - 4) / 180 * pi) * 32 + 67), 28
PSET (y - 5, SIN((x - 5) / 180 * pi) * 32 + 67), 27
PSET (y - 6, SIN((x - 6) / 180 * pi) * 32 + 67), 26
PSET (y - 7, SIN((x - 7) / 180 * pi) * 32 + 67), 25
PSET (y - 8, SIN((x - 8) / 180 * pi) * 32 + 67), 24
PSET (y - 9, SIN((x - 9) / 180 * pi) * 32 + 67), 23
PSET (y - 10, SIN((x - 10) / 180 * pi) * 32 + 67), 22
PSET (y - 11, SIN((x - 11) / 180 * pi) * 32 + 67), 21
PSET (y - 12, SIN((x - 12) / 180 * pi) * 32 + 67), 20
PSET (y - 13, SIN((x - 13) / 180 * pi) * 32 + 67), 19
PSET (y - 14, SIN((x - 14) / 180 * pi) * 32 + 67), 18
PSET (y - 15, SIN((x - 15) / 180 * pi) * 32 + 67), 17
PSET (y - 16, SIN((x - 16) / 180 * pi) * 32 + 67), 16
PSET (y - 17, SIN((x - 17) / 180 * pi) * 32 + 67), 0

IF y = 336 THEN y = 0
NEXT
LOOP

