CLS
INPUT "Startpos: ", x1%, y1%
INPUT "Slutpos: ", x2%, y2%
Svar% = x2% * y2%
CLS
FOR vx = 1 TO Svar%
LOCATE 1, 1
PRINT "Calculating..."
PRINT vx
NEXT
DIM Bilden%(1 TO Svar%)
SCREEN 12
a = x2% / 2 + x1%
b = y2% / 2 + y1%
LINE (a + 8, b + 8)-(a - 8, b - 8), 12, BF
CIRCLE (a, b), 6
PSET (a - 2, b - 2)
PSET (a + 2, b - 2)
LINE (a - 2, b + 2)-(a + 2, b + 2)
GET (x1%, y1%)-(x2%, y2%), Bilden%
        'FOR q = 1 TO Svar%
        'PRINT Bilden%(q);
        'NEXT
        'SLEEP
DO
RANDOMIZE TIMER
a$ = INKEY$
PUT (RND * 480 + 1, RND * 320 + 1), Bilden%, PRESET
LOOP UNTIL a$ = CHR$(27)

