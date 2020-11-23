SCREEN 13

RANDOMIZE TIMER
cells = 0
r = 1
Cheat = 0
Slow = 0
col% = 2
GridX = 120
GridY = 120
skala3 = 4

DIM c(0 TO GridX + 1, 0 TO GridY + 1) AS INTEGER
DIM tmp(0 TO GridX + 1, 0 TO GridY + 1) AS INTEGER

COLOR 2
start:

r:
CLS
PRINT " - Experiment v1.0 - by SkyMan -"
PRINT ""
INPUT "   Do you want instructions(Y/N)"; Hlp$
IF Hlp$ = "y" OR Hlp$ = "Y" THEN
PRINT "This is a program made for simulating a system of particles obeying certain rules."
PRINT "The program will spray a grid with particles with an averge density set by ou."
PRINT "PRESS ANY KEY."
SLEEP
PRINT "There are currently 4 'SCALES' in which you can view the system. All but one of those will most probably be removed in the final version."
PRINT "The scales are:"
PRINT "2 - the scale with the highest resolution; 4 energy levels."
PRINT "3 - midscale; 2 density levels."
PRINT "4 - the lowest resolution; 16 energy levels."
PRINT "You can change scale while running by pressing the respective key."
PRINT "The 'ENERGY LEVEL' is a representation of the probablity of finding a particle at a certain position. It is represented by a shade of gray where black is very low and white is very high."
PRINT "PRESS ANY KEY."
SLEEP
PRINT "To engage 'SLOW MODE' press 'S'. This will cause the program to halt and wait for Your input between iterations. This allows You to study each moment in detail."
PRINT "Pressing 'X' will exit the program and pressing 'R' will restart."
PRINT "All keyboard commands are a bit slow so DON'T PANIC if nothing happens directly when you've pressed a key."
PRINT "So what is Your task? You are the observer, it is You task to try to understand the principles governing the system of particles. See if You can find any interesting correlations!"
PRINT "Good Luck!"
PRINT "PRESS ANY KEY."
SLEEP
GOTO r
END IF

INPUT "   Density(1/I, 1: no particles): ", i%
INPUT "   Scale(2, 3 or 4): ", skala

gen = 1
born1% = 3
born2% = 3

live1% = 2
live2% = 3

CLS

COLOR col%

LINE (0, 0)-(GridX + 1, GridY + 1), col%, B

FOR y = 1 TO GridY
   FOR x = 1 TO GridX
      c(x, y) = INT(RND * i%)
      IF NOT (c(x, y) = 1) THEN c(x, y) = 0
      tmp(x, y) = c(x, y)
   NEXT
NEXT
  
FOR x = 1 TO GridX STEP skala
   FOR y = 1 TO GridY STEP skala
      n = 0
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
         IF n >= skala3 THEN
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
         LINE (x, y)-(x + 3, y + 3), n + 16, BF
      END IF
   NEXT
NEXT


'LOCATE 23, 1
'PRINT "Cells:"; cells;
LOCATE 23, 15
PRINT "Time:"; gen;


DO
  
   'f”delse och d”d:
   FOR x = 1 TO GridX
      FOR y = 1 TO GridY
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

   'ritar och r„knar:
   FOR x = 1 TO GridX STEP skala
      FOR y = 1 TO GridY STEP skala
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
            IF n >= skala3 THEN
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
            LINE (x, y)-(x + 3, y + 3), n + 16, BF
         END IF
      NEXT
   NEXT
  
   FOR x = 1 TO GridX
      FOR y = 1 TO GridY
         c(x, y) = tmp(x, y)
         IF Cheat = 1 THEN
            IF c(x, y) = 1 THEN
               PSET (x + GridX + 30, y), 15
            ELSE
               PSET (x + GridX + 30, y), 0
            END IF
         END IF
      NEXT
   NEXT

   'tangentbordskommandon
   a$ = INKEY$
   IF a$ = "s" OR a$ = "S" THEN
      IF Slow = 0 THEN
         Slow = 1
         LOCATE 23, 1
         PRINT "SLOW MODE"
      ELSE
         Slow = 0
         LOCATE 23, 1
         PRINT "         "
      END IF
   END IF
   IF a$ = "x" OR a$ = "X" THEN r = 0
   IF a$ = "2" THEN skala = 2
   IF a$ = "3" THEN skala = 3
   IF a$ = "4" THEN skala = 4
   IF a$ = "c" OR a$ = "C" THEN
      IF Cheat = 0 THEN
         Cheat = 1
         LINE (0 + GridX + 30, 0)-(2 * GridX + 1 + 30, GridY + 1), col%, B
      ELSE
         Cheat = 0
         LINE (0 + GridX + 30, 0)-(2 * GridX + 1 + 30, GridY + 1), 0, BF
      END IF
   END IF
  'IF a$ = "e" OR a$ = "E" THEN GOSUB edit
   IF a$ = "r" THEN GOTO r
   a$ = ""
 
  'LOCATE 23, 1
  'PRINT "Cells:"; cells;
   LOCATE 23, 15
   gen = gen + 1
   PRINT "Time:"; gen
   IF Slow = 1 THEN SLEEP
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

