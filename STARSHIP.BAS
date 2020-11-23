bejing:
CLS
SCREEN 12
health = 30
hk = 10
vk = 10
shild = 20
x = 320
y = 240

DO
a$ = INKEY$
GOSUB RegenerationPhase
GOSUB Maetare
GOSUB Skotten
GOSUB Tecknaskepp
GOSUB Kontroll:
LOOP


RegenerationPhase:
IF vk < 10 THEN vk = vk + .01
IF hk < 10 THEN hk = hk + .01
IF shild < 20 THEN shild = shild + .005
RETURN


Maetare:
LINE (10, 10)-(15, 40), 1, BF
LINE (10, 10)-(15, vk * 3 + 10), 13, BF
LINE (630, 10)-(635, 40), 1, BF
LINE (630, 10)-(635, hk * 3 + 10), 13, BF
LINE (290, 455)-(350, 460), 1, BF
LINE (290, 455)-(shild * 3 + 290, 460), 11, BF
LINE (290, 5)-(350, 10), 1, BF
LINE (290, 5)-(health * 2 + 290, 10), 4, BF
RETURN


Skotten:
hshoty = hshoty - 1
vshoty = vshoty - 1
PRESET (vshotx, vshoty + 3)
PRESET (hshotx, hshoty + 3)
PSET (hshotx, hshoty), 14
PSET (vshotx, vshoty), 14
RETURN


Tecknaskepp:
REM Skrovet
LINE (x - 10, y)-(x + 10, y), 12
LINE (x, y)-(x, y + 15), 12
REM Mysko motorer
LINE (x - 8, y + 1)-(x - 8, y + 6), 2
LINE (x + 8, y + 1)-(x + 8, y + 6), 2
REM Kanoner
LINE (x - 6, y - 2)-(x - 6, y + 1), 3
LINE (x + 6, y + 1)-(x + 6, y - 2), 3
REM cockpit
CIRCLE (x, y - 4), 3, 1
PAINT (x, y - 4), 1
RETURN


Kontroll:

IF a$ = "s" THEN health = health - 1
IF health <= 0 THEN
LOCATE 15, 35
PRINT "GAME OVER!"
SLEEP
INPUT "                       Vill Du spela en g†ng till[jn]"; a$
IF a$ = "j" OR a$ = "J" THEN GOTO bejing
END
END IF
IF a$ = CHR$(0) + "K" THEN
PAINT (x, y), 0
x = x - 2
END IF

IF a$ = CHR$(0) + "M" THEN
PAINT (x, y), 0
x = x + 2
END IF

IF a$ = CHR$(0) + "H" THEN
PAINT (x, y), 0
y = y - 2
END IF

IF a$ = CHR$(0) + "P" THEN
PAINT (x, y), 0
y = y + 2
END IF

IF a$ = CHR$(0) + "R" AND shild >= 1 THEN
shield = shild / 2
shild = shild - 1
ELSE shield = shield - .1
END IF

IF shield > 0 THEN CIRCLE (x, y + 4), 15, 11
CIRCLE (x, y + 4), 15, 0

IF a$ = CHR$(0) + "G" AND vk >= 1 THEN
LINE (vshotx, vshoty)-(vshotx, vshoty + 3), 0
vshotx = x - 6
vshoty = y - 2
vk = vk - 1
END IF

IF a$ = CHR$(0) + "I" AND hk >= 1 THEN
LINE (hshotx, hshoty)-(hshotx, hshoty + 3), 0
hshotx = x + 6
hshoty = y - 2
hk = hk - 1
END IF
RETURN

