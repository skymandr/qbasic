CLS
DIM Row(1 TO 19)
INPUT "MX:", MX$
INPUT "MY:", MY$
OPEN MX$ + MY$ + ".MAP" FOR APPEND AS #1
x = 2
y = 2
FOR r = 1 TO 23
PRINT "º"; STRING$(78, " "); "º"
NEXT
LOCATE 1, 1
PRINT "É"; STRING$(78, "Í"); "»"
LOCATE 21, 1
PRINT "Ì"; STRING$(78, "Í"); "¹"
LOCATE 23, 1
PRINT "È"; STRING$(78, "Í"); "¼"
DO
a$ = INKEY$
LOCATE y, x
PRINT " "
IF a$ = CHR$(0) + "H" THEN
y = y - 1
ELSEIF a$ = CHR$(0) + "K" THEN x = x - 1
ELSEIF a$ = CHR$(0) + "P" THEN y = y + 1
ELSEIF a$ = CHR$(0) + "M" THEN x = x + 1
END IF
IF x > 79 THEN
x = 79
ELSEIF y > 20 THEN y = 20
ELSEIF x < 2 THEN x = 2
ELSEIF y < 2 THEN y = 2
END IF
LOCATE y, x
PRINT y
LOOP

