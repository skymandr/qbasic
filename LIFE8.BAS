SCREEN 13

RANDOMIZE TIMER
gen = 1
cells = 0
r = 1

'Main colour:
col% = 9

'Set Gridsize:
gridX = 64
gridY = 64

DIM c(0 TO gridX + 1, 0 TO gridY + 1) AS INTEGER
DIM tmp(0 TO gridX + 1, 0 TO gridY + 1) AS INTEGER

COLOR 2
start:
CLS
PRINT " - Life v1.0 - by SkyMan -"
PRINT ""
r:
INPUT "   Density(1/I, 1 means no cells): ", i%

born1% = 3
born2% = 3

live1% = 2
live2% = 3

CLS

COLOR col%


FOR y = 1 TO gridY
   FOR x = 1 TO gridX
      c(x, y) = INT(RND * i%)
      IF NOT (c(x, y) = 1) THEN c(x, y) = 0
      IF c(x, y) = 1 THEN
         cells = cells + 1
         PSET (x, y)
      END IF
      tmp(x, y) = c(x, y)
   NEXT
NEXT


LOCATE 23, 1
PRINT "Cells:"; cells;
LOCATE 23, 15
PRINT "Generation:"; gen;
         
DO
   FOR x = 1 TO gridX
      FOR y = 1 TO gridY
         n = c(x - 1, y + 1) + c(x, y + 1) + c(x + 1, y + 1)
         n = n + c(x - 1, y) + c(x + 1, y)
         n = n + c(x - 1, y - 1) + c(x, y - 1) + c(x + 1, y - 1)
         tmp(x, y) = 0
         IF c(x, y) = 0 THEN
             IF (n = born1% OR n = born2%) THEN tmp(x, y) = 1
         ELSEIF c(x, y) = 1 THEN
             IF (n = live1% OR n = live2%) THEN tmp(x, y) = 1
'For random Deaths uncomment the line below:
             'IF (INT(RND * 100 + 1) <= 10) THEN tmp(x, y) = 0
         END IF
      NEXT
   NEXT

   cells = 0

   FOR x = 1 TO gridX
      FOR y = 1 TO gridY
         IF tmp(x, y) = 1 THEN
            IF NOT (c(x, y) = 1) THEN PSET (x, y)
            cells = cells + 1
         END IF
         IF tmp(x, y) = 0 THEN
            IF NOT (c(x, y) = 0) THEN PSET (x, y), 0
         END IF
         c(x, y) = tmp(x, y)
      NEXT
   NEXT
  
   a$ = INKEY$
   IF a$ = "x" OR a$ = "X" THEN r = 0
   IF a$ = "e" OR a$ = "E" THEN GOSUB edit
   IF a$ = "r" THEN GOTO r
   LOCATE 23, 1
   PRINT "Cells:"; cells;
   LOCATE 23, 15
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

