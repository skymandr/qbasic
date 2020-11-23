KILL "TEST.IG"
INPUT a$
FOR x = 1 TO LEN(a$)
MID$(a$, x, 1) = CHR$(ASC(MID$(a$, x, 1)) + 3 - 6 + x / 2 * 3 * LEN(a$) / 4 - 5 * 3 * 3 + 5)
NEXT
OPEN "TEST.IG" FOR APPEND AS #1
PRINT #1, a$
CLOSE
PRINT a$

