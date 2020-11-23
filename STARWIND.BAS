SCREEN 12
RANDOMIZE TIMER
TARGET:
DO
FOR dist = 15 TO 0 STEP -.02
A$ = INKEY$
x = 320
y = 240
CIRCLE (x, y), dist / (dist * (dist / 5)), 7
LINE (x - dist / (dist * (dist / 16)), y + dist / (dist * dist / 2))-(x, y - dist / (dist * (dist / 6))), 7
LINE -(x + dist / (dist * (dist / 16)), y + dist / (dist * (dist / 2))), 7
IF A$ = CHR$(9) THEN t = t + 1: tc = 45: SOUND 2345, 1
IF t > 2 THEN t = 0
IF t > 0 THEN
LINE (x - dist / (dist * (dist / 16)), y + 45)-(x - dist / (dist * (dist / 16)), y - 45), 6
LINE (x + dist / (dist * (dist / 16)), y + 45)-(x + dist / (dist * (dist / 16)), y - 45), 6
END IF
IF t = 2 THEN
        IF tc > dist / (dist * (dist / 16)) THEN
                tc = tc - 3
                SOUND 1234, .3
                SOUND 2345, .1
                ELSE tc = dist / (dist * (dist / 16))
        END IF
IF dist / (dist * (dist / 16)) > 45 THEN tc = 45
CIRCLE (x, y), tc, 6
END IF
CLS
NEXT
t = 0
LOOP

