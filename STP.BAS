DECLARE SUB Main ()
DECLARE SUB Alpha1 ()
DECLARE SUB Ord ()
DECLARE SUB Nytt ()
SCREEN 13
FOR a = 16 TO 31
COLOR a
LOCATE 12, 13
PRINT "VéLKOMMEN TILL"
'ON TIMER(1) GOSUB Delay
'TIMER ON
'DO
'LOOP UNTIL d = 1
'd = 0
FOR d = 1 TO 12345
NEXT
NEXT
FOR a = 16 TO 31
COLOR a
LOCATE 12, 13
PRINT "ETT MHS PROGRAM"
FOR d = 1 TO 12345
NEXT
NEXT
FOR a = 16 TO 31
COLOR a
LOCATE 12, 7
PRINT "GJORT SPECIELLT FôR MIN BROR"
FOR d = 1 TO 12345
NEXT
NEXT
CALL Main
'Delay:
'd = 1
'RETURN

SUB Alpha1
CLS
DO
a$ = INKEY$
COLOR 13
LOCATE 1, 1
PRINT "Tryck pÜ SPACE fîr att starta..."
LOOP UNTIL a$ = " "
CLS
Tim = TIMER
COLOR 11
PRINT "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
FOR x = 65 TO 90
DO
a$ = INKEY$
IF a$ = CHR$(27) THEN GOTO 3
IF UCASE$(a$) <> "" AND UCASE$(a$) <> CHR$(x) THEN SOUND 99, 3: Fel = Fel + 1
LOOP UNTIL UCASE$(a$) = CHR$(x)
LOCATE 1, x - 64
COLOR 3
PRINT "*"
NEXT
CLS
time = TIMER - Tim
PRINT time; "sekunder"
PRINT 26 / time; " tecken per sekund"
PRINT Fel; "fel."
Fel = 0
SLEEP
3 CALL Main
END SUB

SUB Main
SCREEN 12
SCREEN 0
COLOR 9
PRINT "                                 Andy Skys"
COLOR 14
PRINT "                               o o"
PRINT "        …ÕÕÕª …ÀÕÀÀª  …ÕÕÀÕÕÀÕÀÀÕÀÀª …ÀÀª …ÀÕÀÀÕÕÕÀÕÀÀÕÀÀÕÀÀÕÀÀÕÀÀÕÀÀÀª"
PRINT "        »ÕÕªÃÕπÃÀº∫»ª…º  ∫  ÃÀºÃÕπ∫»ª∫∫∫»ª∫∫Õª»ÕÕªÃÕºÃÀº∫ ∫∫ÕªÃÀºÃÕπ∫∫∫"
PRINT "        »ÕÕº∫ »∫»Õ∫ »º   ∫  ∫»Õ∫ ∫∫ »π∫∫ »π»Õº»ÕÕº∫  ∫»Õ»Õº»Õº∫»Õ∫ ∫∫ ∫"
COLOR 12
PRINT
PRINT SPC(30); "TrÑna <A>lfabetet"
PRINT SPC(30); "TrÑna <O>rd"
PRINT SPC(27); "Skriv in <N>ya ord"
PRINT SPC(28); "Avsluta <P>rogrammet"
DO
a$ = INKEY$
IF UCASE$(a$) = "A" THEN
CALL Alpha1
ELSEIF LCASE$(a$) = "o" THEN CALL Ord
ELSEIF LCASE$(a$) = "n" THEN CALL Nytt
ELSEIF LCASE$(a$) = "p" THEN SYSTEM: END
END IF
LOOP
END
END SUB

SUB Nytt
CLS
OPEN "ORD.TXT" FOR INPUT AS #1
DO
COLOR 8
INPUT #1, Gord$
PRINT Gord$
x = x + 1
LOOP UNTIL EOF(1)
CLOSE #1
DO
a$ = INKEY$
LOCATE 1, 55
COLOR 9
PRINT "Ta bort dessa ord?(j, n)"
IF UCASE$(a$) = "N" THEN
1 IF x >= 23 THEN CLS : PRINT "Ordlistan Ñr full.": PRINT "Tryck pÜ en tangent...": SLEEP: CALL Main
EXIT DO
ELSEIF LCASE$(a$) = "j" THEN x = 0: KILL "ORD.TXT": EXIT DO
END IF
LOOP
DO
CLS
LOCATE 1, 1
COLOR 10
PRINT "ètergÜ till main genom att skriva en tom rad."
LOCATE 2, 1
COLOR 14
LINE INPUT "Skriv in ett ord: "; Nord$
IF Nord$ = "" THEN
CALL Main
ELSE
x = x + 1
IF x > 23 THEN GOTO 1
OPEN "ORD.TXT" FOR APPEND AS #1
PRINT #1, Nord$
CLOSE #1
END IF
LOOP
END SUB

SUB Ord
OPEN "ORD.TXT" FOR INPUT AS #1
DO
INPUT #1, Test$
t = t + 1
LOOP UNTIL EOF(1)
CLOSE #1
OPEN "ORD.TXT" FOR INPUT AS #1
2 CLS
DO
a$ = INKEY$
COLOR 14
LOCATE 1, 1
PRINT "Tryck pÜ SPACE fîr nÑsta ord eller ESC fîr att ÜtergÜ till Main..."
IF a$ = CHR$(27) THEN CLOSE #1: CALL Main
LOOP UNTIL a$ = " "
CLS
c = c + 1
IF c > t THEN CLOSE #1: CALL Main
INPUT #1, cord$
LOCATE 13, (40 - INT(LEN(cord$) / 2))
COLOR 11
PRINT cord$
Tim = TIMER
FOR x = 1 TO LEN(cord$)
DO
a$ = INKEY$
IF a$ <> "" AND a$ <> MID$(cord$, x, 1) THEN SOUND 99, 3: Fel = Fel + 1
LOOP UNTIL a$ = MID$(cord$, x, 1)
LOCATE 13, (40 - INT(LEN(cord$) / 2)) + x - 1
COLOR 12
PRINT "*"
NEXT
CLS
time = TIMER - Tim
PRINT time; "sekunder"
PRINT LEN(cord$) / time; "tecken per sekund"
PRINT "Motsvarar "; (time / LEN(cord$)) * 26; "sekunder pÜ alfatest"
PRINT Fel; "fel."
Fel = 0
DO
a$ = INKEY$
LOOP UNTIL a$ <> ""
a$ = ""
GOTO 2
END SUB

