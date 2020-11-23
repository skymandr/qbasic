DECLARE SUB rita (n, xx, yy)
SCREEN 12
RANDOMIZE TIMER
      
DIM SHARED mask(1 TO 8, 1 TO 8) AS INTEGER

COLOR 1
LOCATE 30, 1
PRINT "- FRACTAL 42 - SkyTeX 2001 - skymandr@dd.chalmers.se - PRESS 'Q' TO QUIT -"

DO
   'Exitfunction:
   a$ = INKEY$
   IF a$ = "q" OR a$ = "Q" THEN STOP
  
   'Sets color:
   c = INT(RND * 15 + 1)
  
   'Creates pattern matrix:
   mask(1, 3) = c
   mask(1, 4) = c
   mask(2, 2) = c
   mask(2, 4) = c
   mask(3, 1) = c
   mask(3, 2) = c
   mask(3, 3) = c
   mask(3, 4) = c
   mask(3, 5) = c
   mask(3, 6) = c

   mask(5, 2) = c
   mask(5, 5) = c
   mask(5, 6) = c
   mask(6, 1) = c
   mask(6, 4) = c
   mask(6, 6) = c
   mask(7, 2) = c
   mask(7, 3) = c
   mask(7, 6) = c

   'Sets number of iterations:
   n = 3
  
   'Lets the fun begin:
   CALL rita(n, 0, 0)
 
   'SLEEP
LOOP

SUB rita (n, xx, yy)

   FOR x = 1 TO 8
      FOR y = 1 TO 8
         IF mask(x, y) > 0 THEN
            IF n = 1 THEN
                  PSET (x + xx, y + yy), mask(x, y)
               ELSE
                  CALL rita(n - 1, (x - 1 + xx) * 8, (y - 1 + yy) * 8)
            END IF
         END IF
      NEXT
   NEXT

END SUB

