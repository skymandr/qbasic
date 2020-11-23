CLS
SCREEN 0
PRINT "F:\>";
COLOR 23
PRINT "_"
COLOR 7
FOR a = 1 TO 3
DO
a$ = INKEY$
IF a$ <> "" THEN PRINT "ERROR": PRINT "Error Code 0169"
LOOP UNTIL a$ <> ""
BEEP
NEXT
SCREEN 12
FOR u = 1 TO 12345
NEXT
LINE (0, 0)-(640, 480), , BF
Y = 480
FOR I = 1 TO 240
LINE (0, x)-(640, x), 0
x = x + 1
LINE (0, Y)-(640, Y), 0
Y = Y - 1
FOR w = 1 TO 2048
NEXT
NEXT I

x = 0
Y = 640

FOR I = 1 TO 320
PSET (x, 240), 0
x = x + 1

PSET (Y, 240), 0
Y = Y - 1
FOR w = 1 TO 1024
NEXT

NEXT I
SLEEP 1
FOR z = 1 TO 9999
NEXT
CLS
DO
LOOP

