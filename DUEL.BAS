SCREEN 12
CONST pi = 3.141593
x1 = 180
xpos = 120
ypos = 320
xpos1 = 360
ypos1 = 320
DO
        IF shotposx < 500 AND shotposx > 460 AND INT(shotposy) = 240 THEN
                shotposx = 0
                shotposy = 0
                shotspeedx = 0
                shotspeedy = 0
        END IF
        IF shotposx1 < 180 AND shotposx1 > 140 AND INT(shotposy1) = 240 THEN
                shotposx1 = 0
                shotposy1 = 0
                shotspeedx1 = 0
                shotspeedy1 = 0
        END IF
        LINE (140, 240)-(180, 240), 4
        LINE (460, 240)-(500, 240), 1
        a$ = INKEY$
        GOSUB p1
        GOSUB p2
        GOSUB shot
LOOP
p1:     DRAW "C1 TA" + LTRIM$(STR$(x1)) + "BM" + LTRIM$(STR$(INT(ypos1))) + "," + LTRIM$(STR$(INT(xpos1))) + " U10 D20 L10 R20 "
        IF a$ = "/" THEN
                PLAY "o5g64"
                PRESET (shotposx1, shotposy1)
                shotposx1 = ypos1
                shotposy1 = xpos1
                shotspeedx1 = SIN(x1 * pi / 180)
                shotspeedy1 = COS(x1 * pi / 180)
        END IF
        IF a$ = CHR$(0) + "K" THEN
                GOSUB 1
                LINE (ypos1 - 20, xpos1 - 20)-(ypos1 + 20, xpos1 + 20), 0, BF
        END IF
        IF a$ = CHR$(0) + "G" THEN
                GOSUB 3
                GOSUB 1
                LINE (ypos1 - 20, xpos1 - 20)-(ypos1 + 20, xpos1 + 20), 0, BF
        END IF
        IF a$ = CHR$(0) + "I" THEN
                GOSUB 3
                GOSUB 2
                LINE (ypos1 - 20, xpos1 - 20)-(ypos1 + 20, xpos1 + 20), 0, BF
        END IF
        IF a$ = CHR$(0) + "M" THEN
                GOSUB 2
                LINE (ypos1 - 20, xpos1 - 20)-(ypos1 + 20, xpos1 + 20), 0, BF
        END IF
        IF a$ = CHR$(0) + "H" THEN
                GOSUB 3
                LINE (ypos1 - 20, xpos1 - 20)-(ypos1 + 20, xpos1 + 20), 0, BF
        END IF
        IF a$ = CHR$(0) + "O" THEN
                GOSUB 4
                GOSUB 2
                LINE (ypos1 - 20, xpos1 - 20)-(ypos1 + 20, xpos1 + 20), 0, BF
        END IF
        IF a$ = CHR$(0) + "Q" THEN
                GOSUB 4
                GOSUB 1
                LINE (ypos1 - 20, xpos1 - 20)-(ypos1 + 20, xpos1 + 20), 0, BF
        END IF
        IF a$ = CHR$(0) + "P" THEN
                GOSUB 4
                LINE (ypos1 - 20, xpos1 - 20)-(ypos1 + 20, xpos1 + 20), 0, BF
        END IF
RETURN
1       IF x1 >= 360 THEN x1 = x1 - 360
        x1 = x1 + 5
RETURN
2       IF x1 <= -360 THEN x1 = x1 + 360
        x1 = x1 - 5
RETURN
3       ypos1 = ypos1 - 5 * SIN(x1 * pi / 180)
        xpos1 = xpos1 - 5 * COS(x1 * pi / 180)
RETURN
4       ypos1 = ypos1 + 3 * SIN(x1 * pi / 180)
        xpos1 = xpos1 + 3 * COS(x1 * pi / 180)
RETURN
p2:
        DRAW "C4 TA" + LTRIM$(STR$(x)) + "BM" + LTRIM$(STR$(INT(ypos))) + "," + LTRIM$(STR$(INT(xpos))) + " U10 D20 L10 R20 "
        IF a$ = "2" THEN
                PLAY "o6c64"
                PRESET (shotposx, shotposy)
                shotposx = ypos
                shotposy = xpos
                shotspeedx = SIN(x * pi / 180)
                shotspeedy = COS(x * pi / 180)
        END IF
        IF a$ = "a" THEN
                GOSUB 5
                LINE (ypos - 20, xpos - 20)-(ypos + 20, xpos + 20), 0, BF
        END IF
        IF a$ = "q" THEN
                GOSUB 7
                GOSUB 5
                LINE (ypos - 20, xpos - 20)-(ypos + 20, xpos + 20), 0, BF
        END IF
        IF a$ = "e" THEN
                GOSUB 7
                GOSUB 6
                LINE (ypos - 20, xpos - 20)-(ypos + 20, xpos + 20), 0, BF
        END IF
        IF a$ = "d" THEN
                GOSUB 6
                LINE (ypos - 20, xpos - 20)-(ypos + 20, xpos + 20), 0, BF
        END IF
        IF a$ = "w" THEN
                GOSUB 7
                LINE (ypos - 20, xpos - 20)-(ypos + 20, xpos + 20), 0, BF
        END IF
        IF a$ = "z" THEN
                GOSUB 8
                GOSUB 6
                LINE (ypos - 20, xpos - 20)-(ypos + 20, xpos + 20), 0, BF
        END IF
        IF a$ = "c" THEN
                GOSUB 8
                GOSUB 5
                LINE (ypos - 20, xpos - 20)-(ypos + 20, xpos + 20), 0, BF
        END IF
        IF a$ = "x" THEN
                GOSUB 8
                LINE (ypos - 20, xpos - 20)-(ypos + 20, xpos + 20), 0, BF
        END IF
RETURN
5       IF x >= 360 THEN x = x - 360
        x = x + 5
RETURN
6       IF x <= -360 THEN x = x + 360
        x = x - 5
RETURN
7       ypos = ypos - 5 * SIN(x * pi / 180)
        xpos = xpos - 5 * COS(x * pi / 180)
RETURN
8       ypos = ypos + 3 * SIN(x * pi / 180)
        xpos = xpos + 3 * COS(x * pi / 180)
RETURN
shot:
        IF shotposx > ypos1 - 11 AND shotposx < ypos1 + 11 AND shotposy > xpos1 - 11 AND shotposy < xpos1 + 11 THEN
        PLAY "O0G16"
        shotposx = 0
        shotposy = 0
        hilfe1 = hilfe1 - 1
        END IF
        IF shotposx1 > ypos - 11 AND shotposx1 < ypos + 11 AND shotposy1 > xpos - 11 AND shotposy1 < xpos + 11 THEN
        PLAY "O0C16"
        shotposy1 = 0
        shotposx1 = 0
        hilfe = hilfe - 1
        END IF
        IF hilfe1 = -10 THEN
        FOR z = 1 TO 40
                SOUND RND * 40 + 37, .1
                c = INT(RND * 4)
                IF c = 0 THEN clor = 4
                IF c = 1 THEN clor = 6
                IF c = 2 THEN clor = 12
                IF c = 3 THEN clor = 14
                CIRCLE (ypos1 + RND * 10 - 5, xpos1 + RND * 10 - 5), RND * 8, clor
        NEXT
        SLEEP 1
        CLS
        PRINT "Player 2 is Victorious!"
        END
        END IF
       
        IF hilfe = -10 THEN
        FOR z = 1 TO 40
                SOUND RND * 40 + 37, .1
                c = INT(RND * 4)
                IF c = 0 THEN clor = 4
                IF c = 1 THEN clor = 6
                IF c = 2 THEN clor = 12
                IF c = 3 THEN clor = 14
                CIRCLE (ypos + RND * 10 - 5, xpos + RND * 10 - 5), RND * 8, clor
        NEXT
        SLEEP 1
        CLS
        PRINT "Player 1 is Victorious!"
        END
        END IF
       
        PRESET (shotposx1, shotposy1)
        PRESET (shotposx, shotposy)
        shotposy1 = shotposy1 - shotspeedy1
        shotposx1 = shotposx1 - shotspeedx1
        shotposy = shotposy - shotspeedy
        shotposx = shotposx - shotspeedx
        PSET (shotposx1, shotposy1), 11
        PSET (shotposx, shotposy), 12
RETURN

