z = 1
SCREEN 12
1 LOCATE 1, 1: LINE INPUT "Vad ska det st†? "; staa$
CLS
PRINT staa$
FOR x = 0 TO 80
FOR y = 0 TO 14
IF POINT(x, y) > 0 THEN LOCATE y + 2, x + 1: PRINT "Û±"'CHR$(SCREEN(1, z))
PRESET (x, y)
NEXT
a = a + 1
IF a = 8 THEN z = z + 1: a = 0
NEXT
GOTO 1

