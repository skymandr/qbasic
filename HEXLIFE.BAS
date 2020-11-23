SCREEN 12

RANDOMIZE TIMER
gen = 1
cells = 0
r = 1

DIM c(0 TO 89, 0 TO 88) AS INTEGER

COLOR 2
start:
CLS
PRINT " - HEX-Life v1.0 - by SkyMan -"
PRINT ""
INPUT "   Would you like instructions(y/n)? ", help$
IF help$ = "y" OR help$ = "Y" THEN GOSUB help
INPUT "   Main color(1-15): ", col%
INPUT "   Cell color(not same as above): ", ccol%
INPUT "   Density(1/I, 1 means no cells): ", i%

INPUT "   New cell condition 1: ", born1%
INPUT "   New cell condition 2: ", born2%
IF born1% = born2% THEN GOTO survive
INPUT "   New cell condition 3: ", born3%
IF born2% = born3% THEN GOTO survive
INPUT "   New cell condition 4: ", born4%
IF born3% = born4% THEN GOTO survive
INPUT "   New cell condition 5: ", born5%
IF born4% = born5% THEN GOTO survive
INPUT "   New cell condition 6: ", born6%
IF born5% = born6% THEN GOTO survive
INPUT "   New cell condition 7: ", born7%

survive:
INPUT "   Survival condition 1: ", live1%
INPUT "   Survival condition 2: ", live2%
IF live2% = live1% THEN GOTO logfile

INPUT "   Survival condition 3: ", live3%
IF live3% = live2% THEN GOTO logfile
INPUT "   Survival condition 4: ", live4%
IF live4% = live3% THEN GOTO logfile
INPUT "   Survival condition 5: ", live5%
IF live5% = live4% THEN GOTO logfile
INPUT "   Survival condition 6: ", live6%
IF live6% = live5% THEN GOTO logfile
INPUT "   Survival condition 7: ", live7%

logfile:
INPUT "   Log to file(y/n)? ", f$
IF f$ = "y" OR f$ = "Y" THEN INPUT "   Enter filename: ", file$

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
PRINT "HEX-Life v1.0 - SkyTech 2000";

DO
   IF f$ = "y" OR f$ = "Y" THEN
      OPEN file$ FOR APPEND AS #1
         PRINT #1, gen, cells
      CLOSE #1
   END IF
  

   FOR x = 1 TO 88
      FOR y = 1 TO 43
         n = 0
         IF c(x, y - 1) = 1 OR c(x, y - 1) = 3 THEN n = n + 1
         IF c(x, y + 1) = 1 OR c(x, y + 1) = 3 THEN n = n + 1
         IF c(x - 1, y) = 1 OR c(x - 1, y) = 3 THEN n = n + 1
         IF c(x + 1, y) = 1 OR c(x + 1, y) = 3 THEN n = n + 1
         IF ((x) / 2) = INT((x) / 2) THEN
            IF c(x - 1, y + 1) = 1 OR c(x - 1, y + 1) = 3 THEN n = n + 1
            IF c(x + 1, y + 1) = 1 OR c(x + 1, y + 1) = 3 THEN n = n + 1
         ELSE
            IF c(x - 1, y - 1) = 1 OR c(x - 1, y - 1) = 3 THEN n = n + 1
            IF c(x + 1, y - 1) = 1 OR c(x + 1, y - 1) = 3 THEN n = n + 1
         END IF
         IF n = born1% AND c(x, y) = 0 OR n = born2% AND c(x, y) = 0 OR n = born3% AND c(x, y) = 0 OR n = born4% AND c(x, y) = 0 OR n = born5% AND c(x, y) = 0 OR n = born6% AND c(x, y) = 0 OR n = born7% AND c(x, y) = 0 THEN c(x, y) = 2
         IF NOT (n = live1%) AND NOT (n = live2%) AND NOT (n = live3%) AND NOT (n = live4%) AND NOT (n = live5%) AND NOT (n = live6%) AND NOT (n = live7%) AND c(x, y) = 1 THEN c(x, y) = 3
      NEXT
   NEXT

   cells = 0

   FOR x = 1 TO 88
      FOR y = 1 TO 43
         IF c(x, y) = 1 THEN
            cells = cells + 1
         END IF
         IF c(x, y) = 2 THEN
            PAINT (x * 7 + 6, y * 10 + 6), ccol%, col%
            c(x, y) = 1
            cells = cells + 1
         END IF
         IF c(x, y) = 3 THEN
            PAINT (x * 7 + 6, y * 10 + 6), 0, col%
            c(x, y) = 0
         END IF
      NEXT
   NEXT
  
   a$ = INKEY$
   IF a$ = "x" OR a$ = "X" THEN r = 0
   IF a$ = "e" OR a$ = "E" THEN GOSUB edit
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
      PAINT (x * 7 + 6, y * 10 + 6), ccol%, col%
      PAINT (x * 7 + 6, y * 10 + 6), 0, col%
      IF a$ = CHR$(0) + "H" AND y > 1 THEN PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%: y = y - 1
      IF a$ = CHR$(0) + "K" AND x > 1 THEN PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%: x = x - 1
      IF a$ = CHR$(0) + "M" AND x < 88 THEN PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%: x = x + 1
      IF a$ = CHR$(0) + "P" AND y < 43 THEN PAINT (x * 7 + 6, y * 10 + 6), c(x, y) * ccol%, col%: y = y + 1
      IF a$ = "x" OR a$ = "X" THEN r = 0
      IF a$ = CHR$(32) THEN
         IF c(x, y) = 1 THEN
            c(x, y) = 0
         ELSE
            c(x, y) = 1
         END IF
      END IF
   LOOP WHILE r = 1
   r = 1
   PAINT (x * 5 + 5, y * 9 + 5), c(x, y) * ccol%, col%
   LOCATE 29, 31
   PRINT "  E-Edit   X-Exit  ";
RETURN

help:
   CLS
   PRINT " - HEX-Life v1.0 - Instructions -"
   PRINT ""
   PRINT "*  What is HEX-Life?"
   PRINT "A program for visualising a Cellular Automaton based on hexagons."
   PRINT ""
   PRINT "*  What are the settings in the beginning?"
   PRINT "The first two sets the colour of the grid and the cells."
   PRINT "The colors are:"
   FOR x = 1 TO 15
      COLOR x
      PRINT x;
   NEXT
   COLOR 2
   PRINT "The density sets the how crowded with cells the field is."
   PRINT "The following 14 inputs lets you set how many neighbours an empty cell needs to become a living cell and how many neighbours a living cell needs to surive. 0 is not suggested as a birth-condition since it is not realistic."
   PRINT "To skip more conditions enter two identical in a row."
   PRINT "If you wish to save the statistics for future use the answer 'y' to the next question. Population data will then be saved to a file of your choice."
   PRINT ""
   PRINT "*  What can I do in the simulator?"
   PRINT "Pressing 'x' exits the program, pressing 'e' takes you to the edit mode."
   PRINT "In the edit mode you move your marker using the cursor-keys and toggle the condition of a cell using 'space'."
   PRINT ""
   PRINT "If you find a set of rules or patterns that are interesting then please mail me:"
   COLOR 1
   PRINT "   skyman@telia.com"
   COLOR 2
   PRINT "Feel free to write about most other things as well!"
   PRINT ""
   PRINT "   -SkyMan, 9/2 - 2000"
  
   a$ = ""
   DO
      a$ = INKEY$
   LOOP WHILE a$ = ""
RETURN start

