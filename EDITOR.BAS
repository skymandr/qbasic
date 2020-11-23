DIM P(1 TO 30, 1 TO 21)
DIM L(1 TO 30, 1 TO 21)
FOR x = 1 TO 30
        P(x, 21) = 2
NEXT
x = 0
SCREEN 12
Edit:
posx = 1
posy = 1
DO
        a$ = INKEY$
        GOSUB Kontroll
        GOSUB PrintScreen
LOOP UNTIL a$ = CHR$(13)
GOTO BP
Kontroll:
        IF a$ = "+" THEN
                P(posx, posy) = P(posx, posy) + 1
                IF P(posx, posy) > 7 THEN P(posx, posy) = 0
                GOSUB SelectPaint
        END IF
        IF a$ = "-" THEN
                P(posx, posy) = P(posx, posy) - 1
                IF P(posx, posy) < 0 THEN P(posx, posy) = 7
                GOSUB SelectPaint
        END IF
        IF a$ = CHR$(0) + "S" THEN
                P(posx, posy) = 0
                LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, BF
        END IF
        IF a$ = CHR$(0) + "H" AND posy > 1 THEN posy = posy - 1
        IF a$ = CHR$(0) + "K" AND posx > 1 THEN posx = posx - 1
        IF a$ = CHR$(0) + "M" AND posx < 30 THEN posx = posx + 1
        IF a$ = CHR$(0) + "P" AND posy < 20 THEN posy = posy + 1
RETURN
PrintScreen:
        LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), , B
        LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, B
RETURN
SelectPaint:
        LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, BF
        IF plaey = 0 THEN L(posx, posy) = 0
        SELECT CASE P(posx, posy)
        
        CASE 1
        CIRCLE (posx * 20 + 9, posy * 20 + 4), 3
        LINE (posx * 20, posy * 20 + 8)-(posx * 20 + 19, posy * 20 + 8)
        LINE (posx * 20 + 9, posy * 20 + 8)-(posx * 20 + 9, posy * 20 + 12)
        LINE (posx * 20 + 9, posy * 20 + 12)-(posx * 20 + 2, posy * 20 + 19)
        LINE (posx * 20 + 9, posy * 20 + 12)-(posx * 20 + 16, posy * 20 + 19)

        CASE 2
        LINE (posx * 20 + 1, posy * 20 + 1)-(posx * 20 + 18, posy * 20 + 18), 8, BF

        CASE 3
        LINE (posx * 20 + 1, posy * 20 + 1)-(posx * 20 + 18, posy * 20 + 1), 7

        CASE 4
        L(posx, posy) = 1
        LINE (posx * 20 + 1, posy * 20 + 1)-(posx * 20 + 1, posy * 20 + 18)
        LINE (posx * 20 + 18, posy * 20 + 1)-(posx * 20 + 18, posy * 20 + 18)
        LINE (posx * 20 + 1, posy * 20 + 2)-(posx * 20 + 18, posy * 20 + 2)
        LINE (posx * 20 + 1, posy * 20 + 5)-(posx * 20 + 18, posy * 20 + 5)
        LINE (posx * 20 + 1, posy * 20 + 8)-(posx * 20 + 18, posy * 20 + 8)
        LINE (posx * 20 + 1, posy * 20 + 11)-(posx * 20 + 18, posy * 20 + 11)
        LINE (posx * 20 + 1, posy * 20 + 14)-(posx * 20 + 18, posy * 20 + 14)
        LINE (posx * 20 + 1, posy * 20 + 17)-(posx * 20 + 18, posy * 20 + 17)
       
        CASE 5
        LINE (posx * 20 + 1, posy * 20 + 1)-(posx * 20 + 1, posy * 20 + 18)
        LINE (posx * 20 + 18, posy * 20 + 1)-(posx * 20 + 18, posy * 20 + 18)
        LINE (posx * 20 + 1, posy * 20 + 2)-(posx * 20 + 18, posy * 20 + 3)
        LINE (posx * 20 + 1, posy * 20 + 5)-(posx * 20 + 18, posy * 20 + 5)
        LINE (posx * 20 + 1, posy * 20 + 8)-(posx * 20 + 18, posy * 20 + 7)
        LINE (posx * 20 + 1, posy * 20 + 11)-(posx * 20 + 18, posy * 20 + 9)
        LINE (posx * 20 + 1, posy * 20 + 14)-(posx * 20 + 18, posy * 20 + 11)
        LINE (posx * 20 + 1, posy * 20 + 17)-(posx * 20 + 18, posy * 20 + 13)
       
        CASE 6
        LINE (posx * 20 + 9, posy * 20 + 1)-(posx * 20 + 11, posy * 20 + 18)
        LINE (posx * 20 + 9, posy * 20 + 1)-(posx * 20 + 7, posy * 20 + 18)
        LINE (posx * 20 + 7, posy * 20 + 18)-(posx * 20 + 11, posy * 20 + 18)
        PAINT (posx * 20 + 9, posy * 20 + 9)
       
        CASE 7
        CIRCLE (posx * 20 + 9, posy * 20 + 6), 5
        PAINT (posx * 20 + 9, posy * 20 + 6)
        LINE (posx * 20 + 5, posy * 20 + 4)-(posx * 20 + 13, posy * 20 + 4), 0
        LINE (posx * 20 + 5, posy * 20 + 8)-(posx * 20 + 13, posy * 20 + 8), 0
        LINE (posx * 20 + 7, posy * 20 + 2)-(posx * 20 + 7, posy * 20 + 10), 0
        LINE (posx * 20 + 11, posy * 20 + 2)-(posx * 20 + 11, posy * 20 + 10), 0

END SELECT
RETURN
BP:
       
        OPEN "test.bas" FOR OUTPUT AS #1
        FOR posx = 1 TO 30
                FOR posy = 1 TO 20
                         PRINT #1, P(posx, posy)
                NEXT
        NEXT
        CLOSE #1
        FOR posx = 1 TO 30
                FOR posy = 1 TO 20
                        IF P(posx, posy) = 1 THEN GOTO ReallyStart
                NEXT
        NEXT
        END
ReallyStart:
        FOR xz = 1 TO 30
                FOR yz = 1 TO 20
                        IF P(xz, yz) = 1 AND NOT (xz = posx AND yz = posy) THEN
                                P(xz, yz) = 0
                                LINE (xz * 20, yz * 20)-(xz * 20 + 19, yz * 20 + 19), 0, BF
                        END IF
                NEXT
        NEXT
        plaey = 1
        DO
        a$ = INKEY$
        IF P(posx, posy + 1) = 0 AND L(posx, posy) = 0 THEN
                P(posx, posy) = 0
                LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, BF
                posy = posy + 1
                IF P(posx, posy) = 7 THEN GOTO Won
                P(posx, posy) = 1
                GOSUB SelectPaint
                FOR tid = 1 TO 500
                NEXT
        ELSEIF P(posx, posy + 1) = 6 AND L(posx, posy) = 0 THEN
                LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, BF
                END
        ELSE
                GOSUB MerKontroll
        END IF
       
        LOOP

MerKontroll:
        IF a$ = CHR$(0) + "K" AND posx > 1 THEN
                IF P(posx - 1, posy) <> 2 THEN
                        IF L(posx, posy) = 1 THEN
                                P(posx, posy) = 4
                                GOSUB SelectPaint
                        ELSE
                                P(posx, posy) = 0
                                LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, BF
                        END IF
                        posx = posx - 1
                        IF P(posx, posy) = 7 THEN GOTO Won
                        P(posx, posy) = 1
                        GOSUB SelectPaint
                END IF
        END IF
        IF a$ = CHR$(0) + "M" AND posx < 30 THEN
                IF P(posx + 1, posy) <> 2 THEN
                        IF L(posx, posy) = 1 THEN
                                P(posx, posy) = 4
                                GOSUB SelectPaint
                        ELSE
                                P(posx, posy) = 0
                                LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, BF
                        END IF
                        posx = posx + 1
                        IF P(posx, posy) = 7 THEN GOTO Won
                        P(posx, posy) = 1
                        GOSUB SelectPaint
                END IF
        END IF
        IF a$ = CHR$(0) + "H" AND L(posx, posy) = 1 AND posy > 1 THEN
                IF P(posx, posy - 1) <> 2 THEN
                P(posx, posy) = 4
                LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, BF
                LINE (posx * 20 + 1, posy * 20 + 1)-(posx * 20 + 1, posy * 20 + 18)
                LINE (posx * 20 + 18, posy * 20 + 1)-(posx * 20 + 18, posy * 20 + 18)
                LINE (posx * 20 + 1, posy * 20 + 2)-(posx * 20 + 18, posy * 20 + 2)
                LINE (posx * 20 + 1, posy * 20 + 5)-(posx * 20 + 18, posy * 20 + 5)
                LINE (posx * 20 + 1, posy * 20 + 8)-(posx * 20 + 18, posy * 20 + 8)
                LINE (posx * 20 + 1, posy * 20 + 11)-(posx * 20 + 18, posy * 20 + 11)
                LINE (posx * 20 + 1, posy * 20 + 14)-(posx * 20 + 18, posy * 20 + 14)
                LINE (posx * 20 + 1, posy * 20 + 17)-(posx * 20 + 18, posy * 20 + 17)
                posy = posy - 1
                IF P(posx, posy) = 7 THEN GOTO Won
                P(posx, posy) = 1
                GOSUB SelectPaint
                END IF
        END IF
       
        IF a$ = CHR$(0) + "P" AND (L(posx, posy + 1) = 1 OR (L(posx, posy) = 1 AND P(posx, posy + 1) = 0)) THEN
                P(posx, posy) = 0
                GOSUB SelectPaint
                IF L(posx, posy) = 1 THEN
                P(posx, posy) = 4
                LINE (posx * 20, posy * 20)-(posx * 20 + 19, posy * 20 + 19), 0, BF
                LINE (posx * 20 + 1, posy * 20 + 1)-(posx * 20 + 1, posy * 20 + 18)
                LINE (posx * 20 + 18, posy * 20 + 1)-(posx * 20 + 18, posy * 20 + 18)
                LINE (posx * 20 + 1, posy * 20 + 2)-(posx * 20 + 18, posy * 20 + 2)
                LINE (posx * 20 + 1, posy * 20 + 5)-(posx * 20 + 18, posy * 20 + 5)
                LINE (posx * 20 + 1, posy * 20 + 8)-(posx * 20 + 18, posy * 20 + 8)
                LINE (posx * 20 + 1, posy * 20 + 11)-(posx * 20 + 18, posy * 20 + 11)
                LINE (posx * 20 + 1, posy * 20 + 14)-(posx * 20 + 18, posy * 20 + 14)
                LINE (posx * 20 + 1, posy * 20 + 17)-(posx * 20 + 18, posy * 20 + 17)
                ELSE
                P(posx, posy) = 0
                END IF
                posy = posy + 1
                P(posx, posy) = 1
                GOSUB SelectPaint
        END IF

IF a$ <> " " THEN RETURN
plaey = 0
GOTO Edit
Won:
        SCREEN 0
                FOR x = 2 TO 15
                        COLOR x, x
                        FOR y = 1 TO 100
                                PRINT ""
                        NEXT
                NEXT
        LOCATE 10, 35
        PRINT "You made it!"
        SLEEP
DO
INPUT "Vill Du beh†lla banan(j/n)"; a$
LOOP UNTIL a$ = "J" OR a$ = "j" OR a$ = "N" OR a$ = "n"
IF a$ = "N" OR a$ = "n" THEN
KILL "test.bas"
ELSE
OPEN "wherenow.exe" FOR INPUT AS #1
        INPUT #1, a
        SHELL "ren test.bas " + LTRIM$(STR$(a)) + ".sav"
CLOSE #1
KILL "wherenow.exe"
OPEN "wherenow.exe" FOR OUTPUT AS #1
        PRINT #1, a + 1
CLOSE
END IF

