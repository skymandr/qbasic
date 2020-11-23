DECLARE SUB Intro ()
DIM SHARED c$
DIM SHARED dir
DIM SHARED x
DIM SHARED y
CLS
y = 1
DO
a$ = INKEY$
LOCATE 9 + y, 33
PRINT " "
IF a$ = CHR$(0) + "H" THEN y = y - 1
IF y < 1 THEN y = 2
IF a$ = CHR$(0) + "P" THEN y = y + 1
IF y > 2 THEN y = 1
LOCATE 9 + y, 33
PRINT "@"
LOCATE 10, 35
PRINT "Kristina = "
LOCATE 11, 35
PRINT "Jakob    = "
LOOP UNTIL a$ = CHR$(13)
IF y = 1 THEN c$ = "":  ELSE c$ = ""
CALL Intro
x = 3
y = 5
CLS
DO
a$ = INKEY$
LOCATE y, x
PRINT " "
IF a$ = CHR$(0) + "K" THEN
dir = 4
x = x - 1
ELSEIF a$ = CHR$(0) + "H" THEN dir = 8: y = y - 1
ELSEIF a$ = CHR$(0) + "M" THEN dir = 6: x = x + 1
ELSEIF a$ = CHR$(0) + "P" THEN dir = 2: y = y + 1
END IF
LOCATE y, x
PRINT c$
LOOP

DO
LOCATE 1, 1
PRINT " /\^^/\   ^^/\     "
PRINT "³/ÕÑÎÑ¸\³  ÕÎ¸\ ³"
PRINT "³ ³ÃÐ´³ ³ ÄÙ×Ù \³"
PRINT "   Á Á     /"; CHR$(34); "\"
PRINT "          Á   Á"
LOCATE 10, 10
PRINT " "
FOR d = 1 TO 65
NEXT
LOCATE 10, 10
PRINT "+"
FOR d = 1 TO 65
NEXT
LOCATE 10, 10
PRINT "*"
FOR d = 1 TO 65
NEXT
LOCATE 10, 10
PRINT ""
FOR d = 1 TO 65
NEXT
LOOP

SUB Intro
CLS
COLOR 5, 1
LOCATE 10, 36
PRINT "  Û  Û  "
LOCATE 11, 36
PRINT "  ÛÜÜÛÜ "
LOCATE 12, 36
COLOR 4, 1
PRINT " JUNI";
COLOR 4, 5
PRINT "O";
COLOR 4, 1
PRINT "R "
COLOR 5, 1
LOCATE 13, 36
PRINT "     Û  "
COLOR 12, 0
SLEEP
LOCATE 15
PRINT c$
COLOR 4
FOR y = 1 TO 15
FOR d = 1 TO 65
NEXT
LOCATE y, 35
PRINT "         "
LOCATE y + 1, 35
PRINT " /\^^/\ "
LOCATE y + 2, 35
PRINT "³/ÕÑÎÑ¸\³"
LOCATE y + 3, 35
PRINT "³ ³ÃÐ´³ ³"
LOCATE y + 4, 35
PRINT "   Á Á   "
NEXT
PRINT "He he he... Ni f†r aldrig tillbaka eran 4!"
COLOR 12
SLEEP
PRINT "Jag ska stoppa dig!"
y = 15
x = 1
FOR x = 1 TO 35
LOCATE y, x
PRINT " "; c$
FOR d = 1 TO 65
NEXT
NEXT
COLOR 4
LOCATE 16, 35
PRINT "         "
LOCATE 17, 35
PRINT "         "
LOCATE 18, 35
PRINT "         "
LOCATE 19, 35
PRINT "         "
LOCATE 22
PRINT "He he he..."
COLOR 12
PRINT "Vart tog den v„gen? Jag m†ste ha tillbaka 4:an!"
SLEEP
END SUB

