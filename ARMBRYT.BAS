1 SCREEN 12
LOCATE 1, 1
INPUT "Hur sv†r motst†ndare vill du ha"; Svar
LOCATE 2, 1
INPUT "Vad heter motst†ndaren"; Name$
PI = CDBL(ATN(1) * 4)
RANDOMIZE TIMER
x = 180
CLS
DO
a$ = INKEY$
PINF:
LOCATE 1, 1
PRINT "DU"
LINE (1, 20)-(x, 20)
LINE (460, 20)-(180 + x, 20), 0
LOCATE 1, 80 - LEN(Name$)
PRINT Name$
LINE (460, 20)-(180 - x + 460, 20)
LINE (640, 20)-(640 - x, 20), 0
ACTION:
LINE (30, 200)-(200, 345)
LINE -(SIN(x / 180 * PI) * 130 + 320, COS(x / 180 * PI) * 130 + 345), 0
CIRCLE (SIN(x / 180 * PI) * 130 + 320, COS(x / 180 * PI) * 130 + 345), 10, 0
LINE -(440, 345), 0
IF a$ <> "" THEN x = x + 1
x = x - RND * Svar
LINE (30, 200)-(200, 345)
LINE -(SIN(x / 180 * PI) * 130 + 320, COS(x / 180 * PI) * 130 + 345)
CIRCLE (SIN(x / 180 * PI) * 130 + 320, COS(x / 180 * PI) * 130 + 345), 10
LINE -(440, 345)
LINE -(610, 200)
IF x < 90 THEN BEEP: BEEP: BEEP: LOCATE 21, 30: PRINT Name$; " vann!": EXIT DO
IF x > 270 THEN BEEP: BEEP: BEEP: LOCATE 21, 30: PRINT "Du vann!": EXIT DO
LOOP
SLEEP
GOTO 1

