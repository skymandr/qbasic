SCREEN 12
DO
INPUT k
IF k = 0 THEN END
FOR x = 1 TO 700 STEP .3
PSET (x, 200), 4
PSET (x - 58, 200), 0
NEXT
PRINT 1080 / k
PRINT 1800 / k
PRINT 2200 / k
LOOP

