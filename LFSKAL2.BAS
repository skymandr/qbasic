SCREEN 13

RANDOMIZE TIMER
gen = 1
cells = 0
r = 1
col% = 9
gridX = 120
gridY = 120


COLOR 2
start:
CLS
PRINT " - Life v1.0 - by SkyMan -"
PRINT ""
r:
INPUT "   Density(1/I, 1 means no cells): ", i%
INPUT "   Scale(2, 3 or 4): ", skala

DIM c(0 TO gridX + 1, 0 TO gridY + 1) AS INTEGER
DIM tmp(0 TO gridX + 1, 0 TO gridY + 1) AS INTEGER
DIM visual(0 TO gridX / skala + 1, 0 TO gridY / skala + 1) AS INTEGER


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
      tmp(x, y) = c(x, y)
   NEXT
NEXT
  
FOR x = 1 TO gridX STEP skala
   FOR y = 1 TO gridY STEP skala
        
         IF skala = 2 THEN
            n = tmp(x, y) + tmp(x + 1, y) + tmp(x, y + 1) + tmp(x + 1, y + 1)
            IF n = 0 OR n = 1 THEN LINE (x, y)-(x + 1, y + 1), 0, BF
            IF n = 2 THEN LINE (x, y)-(x + 1, y + 1), 8, BF
            IF n = 3 THEN LINE (x, y)-(x + 1, y + 1), 7, BF
            IF n = 4 THEN LINE (x, y)-(x + 1, y + 1), 15, BF
         END IF
         IF skala = 3 THEN
            n = 0
            FOR xx = 0 TO 2
               FOR yy = 0 TO 2
                  n = n + tmp(x + xx, y + yy)
               NEXT
            NEXT
            IF n > 4 THEN LINE (x, y)-(x + 2, y + 2), 15, BF
         END IF
         IF skala = 4 THEN
            FOR xx = 0 TO 3
               FOR yy = 0 TO 3
                  n = n + tmp(x + xx, y + yy)
               NEXT
            NEXT
            LINE (x, y)-(x + 3, y + 3), n + 16, BF
         END IF
       
   NEXT
NEXT


'LOCATE 23, 1
'PRINT "Cells:"; cells;
LOCATE 23, 15
PRINT "Generation:"; gen;
         
DO
   'f”delse och d”d:
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
         END IF
      NEXT
   NEXT

   cells = 0

   'ritar och r„knar:
   FOR x = 1 TO gridX STEP skala
      FOR y = 1 TO gridY STEP skala
         n = 0
         IF skala = 2 THEN
            n = tmp(x, y) + tmp(x + 1, y) + tmp(x, y + 1) + tmp(x + 1, y + 1)
            IF n = 0 OR n = 1 THEN LINE (x, y)-(x + 1, y + 1), 0, BF
            IF n = 2 THEN LINE (x, y)-(x + 1, y + 1), 8, BF
            IF n = 3 THEN LINE (x, y)-(x + 1, y + 1), 7, BF
            IF n = 4 THEN LINE (x, y)-(x + 1, y + 1), 15, BF
         END IF
         IF skala = 3 THEN
            FOR xx = 0 TO 2
               FOR yy = 0 TO 2
                  n = n + tmp(x + xx, y + yy)
               NEXT
            NEXT
            IF n > 4 THEN
               LINE (x, y)-(x + 2, y + 2), 15, BF
            ELSE
               LINE (x, y)-(x + 2, y + 2), 0, BF
            END IF
         END IF
         IF skala = 4 THEN
            FOR xx = 0 TO 3
               FOR yy = 0 TO 3
                  n = n + tmp(x + xx, y + yy)
               NEXT
            NEXT
            LINE (x, y)-(x + 3, y + 3), n, BF
         END IF
         c(x, y) = tmp(x, y)
      NEXT
   NEXT
  
   a$ = INKEY$
   IF a$ = "x" OR a$ = "X" THEN r = 0
   'IF a$ = "e" OR a$ = "E" THEN GOSUB edit
   IF a$ = "r" THEN GOTO r
   'LOCATE 23, 1
   'PRINT "Cells:"; cells;
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

