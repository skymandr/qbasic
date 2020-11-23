SCREEN 12
ON TIMER(1) GOSUB Time
TIMER ON
LINE (210, 130)-(430, 350), , B
LINE (285, 350)-(355, 370), , BF
LINE (210, 350)-(285, 370), , B
LINE -(430, 350), , B
CIRCLE (320, 240), 100
DO
LOOP
Time:
        LOCATE 23, 28
        PRINT TIME$
        LOCATE 23, 46
        Datel$ = DATE$
        MID$(Datel$, 7, 2) = MID$(Datel$, 9, 2)
        Datel$ = LEFT$(Datel$, 8)
        PRINT Datel$
        DRAW "C0TA" + LTRIM$(STR$(-6 * Y)) + "NU80"
        DRAW "TA" + LTRIM$(STR$(-6 * X)) + "NU100"
        DRAW "TA" + LTRIM$(STR$(-6 * Z)) + "NU50"
        Z = INT(TIMER / 3600)
        X = INT(TIMER) - INT(TIMER / 60) * 60
        Y = INT((TIMER / 3600 - INT(TIMER / 3600)) * 60)
        IF Z > 12 THEN Z = Z - 12
        IF X < Z AND Y = 0 THEN SOUND 600, 3
        IF X = 0 AND Y = 30 THEN SOUND 600, 3
        DRAW "C15TA" + LTRIM$(STR$(-6 * Y)) + "NU80"
        DRAW "TA" + LTRIM$(STR$(-6 * X)) + "NU100"
        DRAW "TA" + LTRIM$(STR$(-30 * Z)) + "NU50"
        CIRCLE (320, 240), 100
        CIRCLE (320, 240), 3
RETURN

