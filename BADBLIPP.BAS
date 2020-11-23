OPEN "hajscore.blp" FOR INPUT AS #1
        INPUT #1, HAJSCORE
CLOSE #1
DIM eb(1000)
DIM ebt(1000)
RANDOMIZE TIMER
WHILE fart > 500 OR fart < 1
CLS
INPUT "Vilken fart(1-500)"; fart
WEND
fart = fart / 100
SCREEN 12
r = 320
k = 240
DO
        GOSUB rs
        GOSUB k
        GOSUB f
        GOSUB ajpb
LOOP

rs:
        LOCATE 2, 2
        PRINT "POŽNG "; pong
        LOCATE 2, 68
        PRINT "HAJSCORE "; HAJSCORE
        LINE (1, 1)-(639, 478), 2, B
        CIRCLE (r, k), 5, 11
        FOR x = 1 TO 100
        NEXT
        CIRCLE (br, bk), 2
        FOR g = 1 TO ebr
                IF r > eb(g) - 10 AND r < eb(g) + 10 AND k > ebt(g) - 10 AND k < ebt(g) + 10 THEN GOTO dodhaj
        NEXT
RETURN
k:
        a$ = INKEY$
        IF a$ = CHR$(0) + "H" THEN direct = 1
        IF a$ = CHR$(0) + "K" THEN direct = 2
        IF a$ = CHR$(0) + "M" THEN direct = 3
        IF a$ = CHR$(0) + "P" THEN direct = 4
RETURN


f:
        CIRCLE (r, k), 5, 0
        IF direct = 1 THEN k = k - fart
        IF direct = 2 THEN r = r - fart
        IF direct = 3 THEN r = r + fart
        IF direct = 4 THEN k = k + fart
        IF r < 7 OR k < 7 OR r > 633 OR k > 473 THEN
                GOSUB dodhaj
        END IF
        fart = fart + .001
RETURN


ajpb:
        IF r > br - 7 AND r < br + 7 AND k > bk - 7 AND k < bk + 7 THEN
                blipp = 0
                pong = pong + 1
                CIRCLE (br, bk), 2, 0
        END IF
        IF blipp = 0 THEN
                ebr = ebr + 1
                eb(ebr) = INT(RND * 626 + 7)
                ebt(ebr) = INT(RND * 466 + 7)
                CIRCLE (eb(ebr), ebt(ebr)), 5, 2
                blipp = 1
                br = INT(RND * 626 + 7)
                bk = INT(RND * 466 + 7)
        END IF
RETURN
dodhaj:
        SCREEN 0
        PRINT "Du klarade"; pong; "po„ng."
        SLEEP
        IF pong > HAJSCORE THEN
        PRINT "Nytt Rekord!"
        OPEN "hajscore.blp" FOR OUTPUT AS #1
                PRINT #1, pong
        CLOSE #1
        END IF

