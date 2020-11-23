DECLARE SUB PRNCOL (ROW!, COL!, TEXT$)
DECLARE SUB STOPIN (ROW!, COL!)
SCREEN 0
COLOR 8
CLS

DIM SHARED pass$
DIM SHARED juPp
DIM SHARED NOPE

OPEN "PASS.TXT" FOR INPUT SHARED AS #1
INPUT #1, pass$
CLOSE #1

PRNCOL 12, 25, "PassWord:"
COLOR 8

STOPIN 12, 35
PRINT ""
IF NOPE = 1 THEN
        PRNCOL 14, 25, "Access Denied"
        LOCATE 1, 1, 0
        DO
        LOOP UNTIL INKEY$ <> ""
        CLS
        END
END IF

CLS
PRNCOL 2, 23, "The Secret Base of the North"
PRNCOL 4, 27, "1. Change Password"
PRNCOL 6, 24, "2. Add a New Secret Message"
PRNCOL 8, 23, "3. Read an Old Secret Message"
PRNCOL 10, 24, "4. Delete a Secret Message"

SUB PRNCOL (ROW, COL, TEXT$)

LIGHT1$ = LEFT$(TEXT$, 1)
LIGHT2$ = RIGHT$(TEXT$, 1)

COL1$ = LEFT$(TEXT$, 2): COL1$ = RIGHT$(COL1$, 1)
COL2$ = RIGHT$(TEXT$, 2): COL2$ = LEFT$(COL2$, 1)

LOCATE ROW, COL
COLOR 8
PRINT TEXT$
LOCATE ROW, COL

COLOR 13
PRINT LIGHT1$;
COLOR 5
PRINT COL1$
LOCATE ROW, COL + LEN(TEXT$) - 2
PRINT COL2$;
COLOR 13
PRINT LIGHT2$

END SUB

SUB STOPIN (ROW, COL)

R = ROW
C = COL
T = COL + 10
DO
DO
A$ = INKEY$
LOCATE R, C, 1, 6, 7
LOOP UNTIL A$ <> ""

IF ASC(A$) < 31 THEN SKIP = 1

IF A$ = CHR$(8) AND C > COL THEN
        C = C - 1
        svar$ = LEFT$(svar$, LEN(svar$) - 1)
        LOCATE R, C
        PRINT " "
END IF

IF SKIP = 0 THEN
        C = C + 1
        svar$ = svar$ + A$
        IF C > T THEN svar$ = LEFT$(svar$, LEN(svar$) - 1): C = T: SKIP = 1
        LOCATE R, C - 1
        PRINT MID$(pass$, LEN(svar$), 1)'"¨"  'SVAR$
END IF
SKIP = 0

LOOP UNTIL A$ = CHR$(13)

svar$ = UCASE$(svar$)

FOR I = 1 TO LEN(svar$)
UT$ = LEFT$(svar$, I)
UT$ = RIGHT$(UT$, 1)
UT$ = CHR$(ASC(UT$) + 10)
OUT$ = OUT$ + UT$
NEXT I

IF OUT$ = pass$ THEN juPp = 1 ELSE juPp = 1


END SUB

