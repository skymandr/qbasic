SCREEN 13
FOR X& = 1 TO 31
PALETTE X&, (X&) * 2
NEXT
FOR X& = 0 TO 31
PALETTE X& + 32, (X& * 256) * 2
NEXT
FOR X& = 0 TO 31
PALETTE X& + 64, (X& * 256 * 256) * 2
NEXT
FOR X& = 0 TO 31
PALETTE X& + 96, (X& + X& * 256) * 2
NEXT
FOR X& = 0 TO 31
PALETTE X& + 128, (X& + X& * 256 * 256) * 2
NEXT
FOR X& = 0 TO 31
PALETTE X& + 160, (X& * 256 + X& * 256 * 256) * 2
NEXT
FOR X& = 0 TO 31
PALETTE X& + 192, (X& + X& * 256 + X& * 256 * 256) * 2
NEXT
PALETTE 255, &H1F1F1F
PALETTE 254, &H3F3F3F
START:
FOR X% = 1 TO 126 STEP 5
LINE (X%, 1)-(X%, 126), 255
LINE (1, X%)-(126, X%), 255
NEXT
X% = 0
LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
DO
A$ = INKEY$

IF A$ = CHR$(0) + "H" THEN
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 255, B
        IF Drw% = 0 THEN PAINT (X% * 5 + 2, Y% * 5 + 2), CFarg%, 255
        IF Drw% = 0 THEN PSET (X% + 294, Y% + 174), CFarg%
        IF Drw% = -1 THEN PSET (X% + 294, Y% + 174), Farg%
        Y% = Y% - 1
        IF Y% < 0 THEN Y% = 24
        CFarg% = POINT(X% + 294, Y% + 174)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF
IF A$ = CHR$(0) + "K" THEN
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 255, B
        IF Drw% = 0 THEN PAINT (X% * 5 + 2, Y% * 5 + 2), CFarg%, 255
        IF Drw% = 0 THEN PSET (X% + 294, Y% + 174), CFarg%
        IF Drw% = -1 THEN PSET (X% + 294, Y% + 174), Farg%
        X% = X% - 1
        IF X% < 0 THEN X% = 24
        CFarg% = POINT(X% + 294, Y% + 174)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF
IF A$ = CHR$(0) + "M" THEN
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 255, B
        IF Drw% = 0 THEN PAINT (X% * 5 + 2, Y% * 5 + 2), CFarg%, 255
        IF Drw% = 0 THEN PSET (X% + 294, Y% + 174), CFarg%
        IF Drw% = -1 THEN PSET (X% + 294, Y% + 174), Farg%
        X% = X% + 1
        IF X% > 24 THEN X% = 0
        CFarg% = POINT(X% + 294, Y% + 174)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF
IF A$ = CHR$(0) + "P" THEN
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 255, B
        IF Drw% = 0 THEN PAINT (X% * 5 + 2, Y% * 5 + 2), CFarg%, 255
        IF Drw% = 0 THEN PSET (X% + 294, Y% + 174), CFarg%
        IF Drw% = -1 THEN PSET (X% + 294, Y% + 174), Farg%
        Y% = Y% + 1
        IF Y% > 24 THEN Y% = 0
        CFarg% = POINT(X% + 294, Y% + 174)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF
IF A$ = CHR$(0) + "G" THEN
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 255, B
        IF Drw% = 0 THEN PAINT (X% * 5 + 2, Y% * 5 + 2), CFarg%, 255
        IF Drw% = 0 THEN PSET (X% + 294, Y% + 174), CFarg%
        IF Drw% = -1 THEN PSET (X% + 294, Y% + 174), Farg%
        X% = X% - 1: Y% = Y% - 1
        IF X% < 0 THEN X% = 24
        IF Y% < 0 THEN Y% = 24
        CFarg% = POINT(X% + 294, Y% + 174)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF
IF A$ = CHR$(0) + "I" THEN
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 255, B
        IF Drw% = 0 THEN PAINT (X% * 5 + 2, Y% * 5 + 2), CFarg%, 255
        IF Drw% = 0 THEN PSET (X% + 294, Y% + 174), CFarg%
        IF Drw% = -1 THEN PSET (X% + 294, Y% + 174), Farg%
        X% = X% + 1: Y% = Y% - 1
        IF X% > 24 THEN X% = 0
        IF Y% < 0 THEN Y% = 24
        CFarg% = POINT(X% + 294, Y% + 174)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF
IF A$ = CHR$(0) + "O" THEN
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 255, B
        IF Drw% = 0 THEN PAINT (X% * 5 + 2, Y% * 5 + 2), CFarg%, 255
        IF Drw% = 0 THEN PSET (X% + 294, Y% + 174), CFarg%
        IF Drw% = -1 THEN PSET (X% + 294, Y% + 174), Farg%
        X% = X% - 1: Y% = Y% + 1
        IF X% < 0 THEN X% = 24
        IF Y% > 24 THEN Y% = 0
        CFarg% = POINT(X% + 294, Y% + 174)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF
IF A$ = CHR$(0) + "Q" THEN
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 255, B
        IF Drw% = 0 THEN PAINT (X% * 5 + 2, Y% * 5 + 2), CFarg%, 255
        IF Drw% = 0 THEN PSET (X% + 294, Y% + 174), CFarg%
        IF Drw% = -1 THEN PSET (X% + 294, Y% + 174), Farg%
        X% = X% + 1: Y% = Y% + 1
        IF X% > 24 THEN X% = 0
        IF Y% > 24 THEN Y% = 0
        CFarg% = POINT(X% + 294, Y% + 174)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF

PAINT (X% * 5 + 2, Y% * 5 + 2), Farg%, 254
COLOR 254
KEY(1) ON
LOCATE 23, 1
PRINT "F1 FOR HELP"
ON KEY(1) GOSUB HELP
KEY(1) STOP
IF A$ = " " THEN CFarg% = Farg%: PSET (X% + 294, Y% + 174), CFarg%
IF A$ = CHR$(13) THEN Drw% = NOT Drw%
IF LCASE$(A$) = "c" THEN LOCATE 20, 1: LINE INPUT "REALLY CLEAR(Y/N)?", C$: IF LCASE$(C$) = "y" THEN CLS : GOTO START ELSE LOCATE 20, 1: PRINT SPACE$(40)
IF LCASE$(A$) = "g" THEN Farg% = POINT(X% + 294, Y% + 174): Farg1% = Farg% MOD 32: Farg! = Farg%: Farg2% = INT(Farg! / 32): PAINT (X% * 5 + 2, Y% * 5 + 2), Farg%, 254


IF LCASE$(A$) = "s" THEN
        LOCATE 20, 1
        LINE INPUT "SAVE AS:", Fil$
        ON ERROR GOTO Ratt
        OPEN Fil$ FOR INPUT AS #1
        CLOSE #1
        LOCATE 21, 1
        PRINT "OVERWRITE "; Fil$;
        LINE INPUT "(Y/N)?", C$
        IF LCASE$(C$) = "y" THEN ON ERROR GOTO Ratt: LOCATE -125, -125: PRINT "TJOHO"
BACKSAVE:
        A$ = ""
        ON ERROR GOTO 0
        LOCATE 20, 1
        PRINT SPACE$(80)
        LINE (X% * 5 + 1, Y% * 5 + 1)-(X% * 5 + 6, Y% * 5 + 6), 254, B
END IF


IF LCASE$(A$) = "r" THEN
        LOCATE 20, 1
        LINE INPUT "RESTORE:", Fil$
        ON ERROR GOTO Fel
        OPEN Fil$ FOR INPUT AS #1
                ON ERROR GOTO 0
                FOR X% = 1 TO 126 STEP 5
                        LINE (X%, 1)-(X%, 126), 255
                        LINE (1, X%)-(126, X%), 255
                NEXT
                FOR X2% = 294 TO 318
                        FOR Y2% = 174 TO 198
                                Tjo% = ASC(INPUT$(1, 1)) - 1
                                PSET (X2%, Y2%), Tjo%
                                PAINT ((X2% - 294) * 5 + 2, (Y2% - 174) * 5 + 2), Tjo%, 255
                        NEXT
                NEXT
        CLOSE #1
        LOCATE 20, 1
        PRINT SPACE$(80)
END IF


IF A$ = "+" THEN Farg1% = Farg1% + 1: IF Farg1% = 32 THEN Farg1% = 0
IF A$ = "-" THEN Farg1% = Farg1% - 1: IF Farg1% = -1 THEN Farg1% = 31
IF A$ = "/" THEN Farg2% = Farg2% + 1: IF Farg2% = 7 THEN Farg2% = 0
IF A$ = "*" THEN Farg2% = Farg2% - 1: IF Farg2% = -1 THEN Farg2% = 6
Farg% = Farg1% + Farg2% * 32

'LINE (200, 50)-(205, 55), Farg%, BF

'LINE (187, 52)-(190, 53), Farg% - 2, BF
'LINE (193, 51)-(197, 54), Farg% - 1, BF
'LINE (208, 51)-(212, 54), Farg% + 1, BF
'LINE (215, 52)-(218, 53), Farg% + 2, BF

'LINE (202, 38)-(203, 40), Farg%, BF
'LINE (201, 43)-(204, 47), Farg%, BF
'LINE (201, 58)-(204, 62), Farg%, BF
'LINE (202, 65)-(203, 67), Farg%, BF

LOOP UNTIL LCASE$(A$) = "q"
SYSTEM


Ratt:
OPEN Fil$ FOR OUTPUT AS #1
FOR X2% = 294 TO 318
FOR Y2% = 174 TO 198
PRINT #1, CHR$(POINT(X2%, Y2%) + 1);
NEXT
NEXT
PRINT #1, "MIN BitMaPFIL"
CLOSE #1
RESUME BACKSAVE

Fel:
LOCATE 21, 1
PRINT "FILE DOES NOT EXIST."
SLEEP
RESUME BACKSAVE

HELP:
RETURN

