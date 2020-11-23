1 SCREEN 12
COLOR 15
LOCATE 1, 1
DO
a$ = INKEY$
IF a$ = CHR$(8) THEN
IF LEN(b$) > 0 THEN b$ = LEFT$(b$, LEN(b$) - 1)
a$ = ""
END IF
IF a$ = CHR$(13) THEN EXIT DO
b$ = b$ + a$
LOCATE 1, 1
PRINT "Vad ska det st†? "; b$; " "
LOOP
4 INPUT "Vilken f„rg(max 15)"; f%
IF f% > 15 THEN GOTO 4
INPUT "Vilken lutning(-1.5 - 1.5 rek)"; l
2 INPUT "Vilken storlek(-5 - 5 rek)"; strlk
IF strlk < .5 AND strlk > -.5 THEN GOTO 2
3 INPUT "Hur fet stil(.5 - 5 rek)"; fs
IF fs < .5 THEN GOTO 3
CLS
COLOR f%
IF strlk < 0 THEN x2 = 620 ELSE x2 = 20
IF l < 0 THEN y2 = 400 ELSE y2 = 100
x = -2
y = 2
LOCATE 1, 1
FOR Text = 1 TO 15
PRINT MID$(b$, Text, 1);
NEXT
DO
FOR Text = -2 TO 12
IF POINT(x + 1, y + Text) > 0 THEN CIRCLE (x2, y2 + Text * strlk), fs
NEXT
x = x + 1
x2 = x2 + strlk
y2 = y2 + l
LOCATE 2, 1
IF x > 130 THEN EXIT DO
LOOP

b$ = ""
GOTO 1

