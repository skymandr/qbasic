SCREEN 12

RANDOMIZE TIMER
gen = 1
cells = 0
r = 1
col% = 9
ccol% = 3

DIM c(0 TO 89, 0 TO 88) AS INTEGER
DIM tmp(0 TO 89, 0 TO 88) AS INTEGER

COLOR 2
start:
CLS
PRINT " - HEX-Death v1.0 - by SkyMan -"
PRINT ""
r:
INPUT "   Density(1/I, 1 means no cells): ", i%

born1% = 1
born2% = 1

live1% = 1
live2% = 2
live3% = 2

CLS

COLOR col%

FOR y = 1 TO 43
   FOR x = 1 TO 88
      IF INT(x / 2) = (x / 2) THEN
         LINE (x * 7, y * 10 + 10)-(x * 7 + 3, y * 10 + 5)
         LINE -(x * 7 + 7, y * 10 + 5)
         LINE -(x * 7 + 10, y * 10 + 10)
         LINE -(x * 7 + 7, y * 10 + 15)
         LINE -(x * 7 + 3, y * 10 + 15)
         LINE -(x * 7, y * 10 + 10)
      ELSE
         LINE (x * 7, y * 10 + 5)-(x * 7 + 3, y * 10)
         LINE -(x * 7 + 7, y * 10)
         LINE -(x * 7 + 10, y * 10 + 5)
         LINE -(x * 7 + 7, y * 10 + 10)
         LINE -(x * 7 + 3, y * 10 + 10)
         LINE -(x * 7, y * 10 + 5)
      END IF
      
   NEXT
NEXT

FOR y = 1 TO 43
   FOR x = 1 TO 88
      c(x, y) = INT(RND * i%)
      IF NOT (c(x, y) = 1) THEN c(x, y) = 0
      IF c(x, y) = 1 THEN cells = cells + 1
      tmp(x, y) = c(x, y)
   NEXT
NEXT
  
FOR y = 1 TO 43
   FOR x = 1 TO 88
      IF c(x, y) = 1 THEN
         PAINT (x * 7 + 6, y * 10 + 6), ccol%, col%
      END IF
   NEXT
NEXT


LOCATE 29, 2
PRINT "Cells:"; cells;
LOCATE 29, 15
PRINT "Generation:"; gen;
LOCATE 29, 33
PRINT "E-Edit   X-Exit";
LOCATE 29, 51
PRINT "HEX-Death v1.0 - SkyTech 2001";
         
DO
   FOR x = 1 TO 88
      FOR y = 1 TO 43
         n = 0
         IF c(x, y) <> -1 THEN
            IF ((x) / 2) = INT((x) / 2) THEN
               n = c(x - 1, y + 1) + c(x + 1, y + 1)
            ELSE
               n = c(x - 1, y - 1) + c(x + 1, y - 1)
            END IF
            n = n + c(x, y - 1) + c(x, y + 1) + c(x - 1, y) + c(x + 1, y)
            IF c(x, y) = 0 THEN
               IF (n = born1% OR n = born2%) THEN tmp(x, y) = 1
            ELSEIF c(x, y) = 1 THEN
               IF (n <> live1% AND n <> live2% AND n <> live3%) THEN
                  tmp(x, y) = -1
               ELSE
                  tmp(x, y) = 1
               END IF
            END IF
         ELSE tmp(x, y) = 0
         END IF
      NEXT
   NEXT

   cells = 0

   FOR x = 1 TO 88
      FOR y = 1 TO 43
         IF tmp(x, y) = 1 THEN
            IF NOT (c(x, y) = 1) THEN
               PAINT (x * 7 + 6, y * 10 + 6), ccol%, col%
            END IF
            cells = cells + 1
         END IF
         IF tmp(x, y) = 0 THEN
            IF NOT (c(x, y) = 0) THEN
               PAINT (x * 7 + 6, y * 10 + 6), 0, col%
            END IF
         END IF
         IF tmp(x, y) = -1 THEN
            PAINT (x * 7 + 6, y * 10 + 6), 15, col%
         END IF
         c(x, y) = tmp(x, y)
      NEXT
   NEXT
  
   a$ = INKEY$
   IF a$ = "x" OR a$ = "X" THEN r = 0
   IF a$ = "e" OR a$ = "E" THEN GOSUB edit
   IF a$ = "r" THEN GOTO r
   LOCATE 29, 2
   PRINT "Cells:"; cells;
   LOCATE 29, 15
   gen = gen + 1
   PRINT "Generation:"; gen;
LOOP WHILE r = 1
END

edit:
   x = 1
   y = 1
   LOCATE 29, 31
   PRINT "Space-Edit  X-Exit";
   DO
      a$ = INKEY$
      PAINT (x * 7 + 6, y * 10 + 6), 1, col%
      PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%
      IF a$ = CHR$(0) + "H" AND y > 1 THEN PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%: y = y - 1
      IF a$ = CHR$(0) + "K" AND x > 1 THEN PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%: x = x - 1
      IF a$ = CHR$(0) + "M" AND x < 88 THEN PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%: x = x + 1
      IF a$ = CHR$(0) + "P" AND y < 43 THEN PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%: y = y + 1
      IF a$ = "x" OR a$ = "X" THEN r = 0
      IF a$ = CHR$(32) THEN
         IF c(x, y) = 1 THEN
            c(x, y) = -1
         ELSEIF c(x, y) = -1 THEN
            c(x, y) = 0
         ELSE c(x, y) = 1
         END IF
      END IF
   LOOP WHILE r = 1
   r = 1
   PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%
   LOCATE 29, 31
   PRINT "  E-Edit   X-Exit  ";
RETURN

