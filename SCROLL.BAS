SCREEN 12
INPUT "Vad ska det st†"; s$
CLS
LOCATE 1, 80 - LEN(s$)
PRINT s$
DO '                                   Byt ut  mot annan siffra (3 max om du vill l„sa det) f”r nytt resultat!
FOR x = 639 - c - LEN(s$) * 9 TO 639 - c STEP 1
FOR y = 1 TO 14
PSET (x - 1, y), POINT(x, y)
NEXT
NEXT
c = c + 1
LOOP

