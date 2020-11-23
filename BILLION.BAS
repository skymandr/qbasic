CLS
a = TIMER
FOR i = 1 TO 1000000 '7000000000
PRINT i
NEXT
b = TIMER
PRINT (b - a)
PRINT (b - a) / 60
PRINT (1000 * (b - a)) / 60
DO
a$ = INKEY$
BEEP
LOOP UNTIL a$ <> ""
DO
LOOP

