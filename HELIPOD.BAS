DECLARE SUB DrawShip (dir!, speed!)
' Om datorn „r l†ngsam s† ta bort alla ':ar nedan f”r
SCREEN 12
x = 320
y = 240
dir = 4
fuel = 100
DO
a$ = INKEY$
IF a$ = CHR$(13) AND x - 123 > 315 AND x - 123 < 325 AND y + 234 > 235 AND y + 234 < 245 AND fuel < 100 THEN GOSUB MoreFuel
IF a$ = CHR$(0) + "K" THEN
dir = dir - 1
'LINE (310, 230)-(330, 250), 0, BF
ELSEIF a$ = CHR$(0) + "M" THEN dir = dir + 1': LINE (310, 230)-(330, 250), 0, BF
END IF
IF dir > 4 THEN dir = 1
IF dir < 1 THEN dir = 4
IF a$ = CHR$(0) + "H" THEN
speed = speed + .5
'LINE (310, 230)-(330, 250), 0, BF
ELSEIF a$ = CHR$(0) + "P" THEN speed = speed - .5': LINE (310, 230)-(330, 250), 0, BF
END IF
IF speed > 5 THEN speed = 5
IF speed < 0 THEN speed = 0
'LINE (x + 20, y + 20)-(x - 20, y - 20), 0, BF
'LINE (x - 345, y + 345)-(x - 355, y + 355), 0, BF
'LINE (0, 0)-(639, 479), 0, B
CALL DrawShip(dir, speed)
'CIRCLE (x - 123, y + 234), 30, 0
'CIRCLE (x - 123, y + 234), 25, 0
'CIRCLE (x - 123, y + 234), 20, 0
'CIRCLE (x - 123, y + 234), 15, 0
'CIRCLE (x - 123, y + 234), 10, 0
CLS
IF dir = 4 THEN
y = y + speed
ELSEIF dir = 3 THEN x = x + speed
ELSEIF dir = 1 THEN x = x - speed
ELSEIF dir = 2 THEN y = y - speed
END IF
fuel = fuel - (speed * 3 / fuel)
LINE (x + 20, y + 20)-(x - 20, y - 20), 12, BF
LINE (x + 10, y + 15)-(x + 10, y - 15), 0
LINE (x - 10, y + 15)-(x - 10, y - 15), 0
LINE (x + 10, y)-(x - 10, y), 0
LINE (x - 345, y + 345)-(x - 355, y + 355), 12, BF
LINE (0, 0)-(639, 479), 12, B
CALL DrawShip(dir, speed)
CIRCLE (x - 123, y + 234), 30, 9
CIRCLE (x - 123, y + 234), 25, 9
CIRCLE (x - 123, y + 234), 20, 9
CIRCLE (x - 123, y + 234), 15, 9
CIRCLE (x - 123, y + 234), 10, 9
LOCATE 2, 2
PRINT "Speed:"; speed; "  "
LOCATE 3, 2
PRINT "Fuel:"; INT(fuel)
LOOP
MoreFuel:
BEEP
BEEP
BEEP
DO
a$ = INKEY$
FOR c = 10 TO 30 STEP 5
CIRCLE (x - 123, y + 234), c, 14
SOUND c * 37 + 2, 1
FOR c2 = 10 TO 30 STEP 5
CIRCLE (x - 123, y + 234), c2, 12
NEXT
NEXT
fuel = fuel + 1
LOCATE 2, 2
PRINT "Speed:"; speed; "  "
LOCATE 3, 2
PRINT "Fuel:"; INT(fuel)
LOOP UNTIL fuel >= 100 OR a$ = CHR$(13)
RETURN

SUB DrawShip (dir, speed)
IF dir = 2 THEN
CIRCLE (320, 240), 5
CIRCLE (313, 240 - (speed / 2)), 3
CIRCLE (327, 240 - (speed / 2)), 3
CIRCLE (320, 242), 2
ELSEIF dir = 4 THEN
CIRCLE (320, 240), 5
CIRCLE (313, 240 + (speed / 2)), 3
CIRCLE (327, 240 + (speed / 2)), 3
CIRCLE (320, 238), 2
ELSEIF dir = 1 THEN
CIRCLE (320, 240), 5
CIRCLE (320 - (speed / 2), 233), 3
CIRCLE (320 - (speed / 2), 247), 3
CIRCLE (322, 240), 2
ELSEIF dir = 3 THEN
CIRCLE (320, 240), 5
CIRCLE (320 + (speed / 2), 233), 3
CIRCLE (320 + (speed / 2), 247), 3
CIRCLE (318, 240), 2
END IF

END SUB

