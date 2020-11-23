DECLARE SUB NMY ()
SCREEN 12
RANDOMIZE TIMER
DIM SHARED Mx
DIM SHARED My
DIM SHARED Ex
DIM SHARED Ey
DIM SHARED Dist
DIM SHARED t
Mx = x
My = y
OE = INT(RND * 2)
IF OE = 0 THEN Ex = -RND * 345:  ELSE Ex = RND * 345
OE = INT(RND * 2)
IF OE = 0 THEN Ey = -RND * 345:  ELSE Ey = RND * 345
Dist = RND * 15 + 10
DO
a$ = INKEY$
PSET (320, 240)
PSET (320 - Mx, 240 - My), 0
CIRCLE (320 + Ex - Mx, 240 + Ey - My), Dist / (Dist * (Dist / 5)), 0
LINE (320 + Ex - Dist / (Dist * (Dist / 16)) - Mx, 240 + Ey + Dist / (Dist * Dist / 2) - My)-(320 + Ex - Mx, 240 + Ey - Dist / (Dist * (Dist / 6)) - My), 0
LINE -(320 + Ex + Dist / (Dist * (Dist / 16)) - Mx, 240 + Ey + Dist / (Dist * (Dist / 2)) - My), 0
IF a$ = CHR$(0) + "H" THEN
My = My - 1
ELSEIF a$ = CHR$(0) + "K" THEN Mx = Mx - 1
ELSEIF a$ = CHR$(0) + "M" THEN Mx = Mx + 1
ELSEIF a$ = CHR$(0) + "P" THEN My = My + 1
'ELSEIF a$ = CHR$(9) THEN t = 1'TargetClosest
END IF
IF Ex > Mx THEN Ex = Ex - .5
IF Ex < Mx THEN Ex = Ex + .5
IF Ey > My THEN Ey = Ey - .5
IF Ey < My THEN Ey = Ey + .5
CALL NMY
PSET (320 - Mx, 240 - My)
CIRCLE (320 + Ex - Mx, 240 + Ey - My), Dist / (Dist * (Dist / 5)), 7
LINE (320 + Ex - Dist / (Dist * (Dist / 16)) - Mx, 240 + Ey + Dist / (Dist * Dist / 2) - My)-(320 + Ex - Mx, 240 + Ey - Dist / (Dist * (Dist / 6)) - My), 7
LINE -(320 + Ex + Dist / (Dist * (Dist / 16)) - Mx, 240 + Ey + Dist / (Dist * (Dist / 2)) - My), 7
'LINE (Ex - Dist / (Dist * (Dist / 16)) + x, Ey + 45 + y)-(Ex - Dist / (Dist * (Dist / 16)) + x, Ey - 45 + y), 0
'LINE (Ex + Dist / (Dist * (Dist / 16)) + x, Ey + 45 + y)-(Ex + Dist / (Dist * (Dist / 16)) + x, Ey - 45 + y), 0
LOCATE 1, 1
PRINT Mx, My
LOCATE 2, 1
PRINT Ex, Ey
LOCATE 3, 1
PRINT Dist, t
LOOP

SUB NMY
espeed = .2
Dist = Dist - espeed
IF Dist < -0 THEN
OE = INT(RND * 2)
IF OE = 0 THEN Ex = -RND * 500:  ELSE Ex = RND * 500
OE = INT(RND * 2)
IF OE = 0 THEN Ey = -RND * 500:  ELSE Ey = RND * 500
Dist = RND * 15 + 10
END IF
IF t > 2 THEN t = 0
IF t > 0 THEN
LINE (Ex - Dist / (Dist * (Dist / 16)) + x, Ey + 45 + y)-(Ex - Dist / (Dist * (Dist / 16)) + x, Ey - 45 + y), 6
LINE (Ex + Dist / (Dist * (Dist / 16)) + x, Ey + 45 + y)-(Ex + Dist / (Dist * (Dist / 16)) + x, Ey - 45 + y), 6
END IF
IF t = 2 THEN
        IF tc > Dist / (Dist * (Dist / 16)) THEN
                tc = tc - 3
                SOUND 1234, .5
                SOUND 2345, .1
                ELSE tc = Dist / (Dist * (Dist / 16))
        END IF
IF Dist / (Dist * (Dist / 16)) > 45 THEN tc = 45
CIRCLE (x, y), tc, 6
END IF
END SUB

