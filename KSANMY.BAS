SCREEN 13
ex = 160
ey = 100
DO
a$ = INKEY$
'LINE (ex - 35, ey - 40)-(ex + 35, ey + 35), 0, BF
CIRCLE (ex, ey), 20, 0
LINE (ex - 10, ey + 18)-(ex + 25, ey + 18), 0
CIRCLE (ex + 20, ey - 25), 15, 0
CIRCLE (ex + 25, ey - 30), 2, 0
LINE (ex, ey - 5)-(eax, eay), 0
LINE -(ehx, ehy), 0
LINE (emx, emy)-(etx, ety), 0
'PAINT (ex + 25, ey - 30), 0
eax = ex + 5
eay = ey + 5
ehx = ex + 25
ehy = ey + 5
tung = 0
IF a$ = CHR$(0) + "K" THEN
ex = ex - 5
ELSEIF a$ = CHR$(0) + "M" THEN ex = ex + 5
ELSEIF a$ = " " THEN eax = ex + 15: eay = ey + 3: ehx = ex + 35: ehy = ey
ELSEIF a$ = CHR$(13) THEN emx = ex + 33: emy = ey - 20: etx = ex + 65: ety = ey - 10: tung = 1
END IF
CIRCLE (ex, ey), 20, 8
LINE (ex - 10, ey + 18)-(ex + 25, ey + 18), 7
CIRCLE (ex + 20, ey - 25), 15, 8
CIRCLE (ex + 25, ey - 30), 2, 2
LINE (ex, ey - 5)-(eax, eay), 7
LINE -(ehx, ehy), 7
IF tung = 1 THEN LINE (emx, emy)-(etx, ety), 6
'PAINT (ex + 25, ey - 30), 2
LOOP
ex = 16
ey = 10
CIRCLE (ex, ey), 4, 8
LINE (ex - 2, ey + 4)-(ex + 5, ey + 4), 7
CIRCLE (ex + 4, ey - 5), 3, 8
LINE (ex, ey - 1)-(ex + 1, ey + 1), 7
LINE -(ex + 5, ey + 1), 7
PSET (ex + 5, ey - 6), 2

