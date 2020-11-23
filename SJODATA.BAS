OPEN "sjoarea.txt" FOR INPUT AS #1
OPEN "sjonamn.txt" FOR OUTPUT AS #2
OPEN "sjodata.txt" FOR OUTPUT AS #3
   LINE INPUT #1, a$


N = 0
CLS
DO
   LINE INPUT #1, a$
   IF ASC(LEFT$(a$, 1)) >= ASC("A") THEN
      'PRINT a$, ASC(LEFT$(a$, 1))
      firstchr = 1
      lastchr = 1
      WHILE ((ASC(MID$(a$, firstchr, 1)) > ASC("9")) OR (ASC(MID$(a$, firstchr, 1)) < ASC("0")))
          firstchr = firstchr + 1
      WEND
      WHILE (ASC(MID$(a$, LEN(a$) - lastchr, 1)) <> ASC(" "))
         lastchr = lastchr + 1
      WEND
      PRINT #2, LEFT$(a$, firstchr)
      PRINT #3, MID$(a$, firstchr + 1, LEN(a$) - (firstchr + lastchr))
   END IF
LOOP UNTIL (EOF(1))

CLOSE ALL

