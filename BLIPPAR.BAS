DIM eb(1000)
DIM ebt(1000)
RANDOMIZE TIMER
RANDOMIZE RND * 30000
'DO
'PRINT INKEY$;
'LOOP
WHILE fart > 100 OR fart < 1
CLS
INPUT "Vilken fart(1-100)"; fart
WEND
WHILE antal > 2 OR antal < 1
CLS
INPUT "Hur m†nga spelare"; antal
WEND
hajar = antal
fart = fart / 100
SCREEN 12
IF antal = 1 THEN
        r1 = 320
        k1 = 240
haj1lever:   
        DO
                GOSUB ritaskarm1
                GOSUB kontroll1
                GOSUB flytta1
                GOSUB arjagpablipp1
        LOOP


ritaskarm1:
        LOCATE 2, 2
        PRINT "POŽNG "; pong
        LINE (1, 1)-(639, 478), 2, B
        CIRCLE (r1, k1), 5, 11
        FOR x = 1 TO 100 / hajar
        NEXT
        CIRCLE (br1, bk1), 2
        FOR g = 1 TO ebr
                IF r1 > eb(g) - 10 AND r1 < eb(g) + 10 AND k1 > ebt(g) - 10 AND k1 < ebt(g) + 10 THEN GOTO dodhaj1
        NEXT
RETURN
kontroll1:
        a$ = INKEY$
        IF a$ = CHR$(0) + "H" THEN direct1 = 1
        IF a$ = CHR$(0) + "K" THEN direct1 = 2
        IF a$ = CHR$(0) + "M" THEN direct1 = 3
        IF a$ = CHR$(0) + "P" THEN direct1 = 4
RETURN


flytta1:
        CIRCLE (r1, k1), 5, 0
        IF direct1 = 1 THEN k1 = k1 - fart
        IF direct1 = 2 THEN r1 = r1 - fart
        IF direct1 = 3 THEN r1 = r1 + fart
        IF direct1 = 4 THEN k1 = k1 + fart
        IF r1 < 7 OR k1 < 7 OR r1 > 633 OR k1 > 473 THEN
                GOSUB dodhaj1
        END IF
        fart = fart + .001
RETURN


arjagpablipp1:
'        FOR ganger = 1 TO ebr
'                IF r1 > eb(ganger) - 5 AND r1 < eb(ganger) + 5 AND k1 > ebt(ganger) - 5 AND k1 < ebt(ganger) + 5 THEN GOTO dodhaj1
'        NEXT
        IF r1 > br1 - 7 AND r1 < br1 + 7 AND k1 > bk1 - 7 AND k1 < bk1 + 7 THEN
                blipp = 0
                pong = pong + 1
                CIRCLE (br1, bk1), 2, 0
        END IF
        IF blipp = 0 THEN
                ebr = ebr + 1
                eb(ebr) = INT(RND * 626 + 7)
                ebt(ebr) = INT(RND * 466 + 7)
                CIRCLE (eb(ebr), ebt(ebr)), 5, 2
                blipp = 1
                br1 = INT(RND * 626 + 7)
                bk1 = INT(RND * 466 + 7)
        END IF
RETURN
dodhaj1:
        hajar = hajar - 1
        SCREEN 0
        PRINT "Du klarade"; pong; "po„ng."
        IF hajar < 1 THEN
                END
        ELSE
                SLEEP
                GOTO haj2lever
        END IF
RETURN
ELSE
        r1 = 200
        k1 = 240
        r2 = 400
        k2 = 240
        DO
                GOSUB ritaskarm1
                GOSUB ritaskarm2
                GOSUB kontroll1
                GOSUB kontroll2
                GOSUB flytta1
                GOSUB flytta2
                GOSUB arjagpablipp1
                GOSUB arjagpablipp2
        LOOP
      

ritaskarm2:
        LOCATE 2, 70
        PRINT "Po„ng "; pong2
        CIRCLE (r2, k2), 5, 14
        CIRCLE (br2, bk2), 2, 3
RETURN
kontroll2:
        a$ = INKEY$
        IF LCASE$(a$) = "w" THEN direct2 = 1
        IF LCASE$(a$) = "a" THEN direct2 = 2
        IF LCASE$(a$) = "d" THEN direct2 = 3
        IF LCASE$(a$) = "s" THEN direct2 = 4
RETURN
flytta2:
        CIRCLE (r2, k2), 5, 0
        IF direct2 = 1 THEN k2 = k2 - fart
        IF direct2 = 2 THEN r2 = r2 - fart
        IF direct2 = 3 THEN r2 = r2 + fart
        IF direct2 = 4 THEN k2 = k2 + fart
        IF r2 < 7 OR k2 < 7 OR r2 > 633 OR k2 > 473 THEN
                GOSUB dodhaj2
        END IF
RETURN
dodhaj2:
        hajar = hajar - 1
        SCREEN 0
        PRINT "Du klarade"; pong2; " po„ng."
        IF hajar < 1 THEN
                END
        ELSE
                SLEEP
                SCREEN 12
                GOTO haj1lever
        END IF
RETURN
arjagpablipp2:
        IF r2 > br2 - 5 AND r2 < br2 + 5 AND k2 > bk2 - 5 AND k2 < bk2 + 5 THEN
                pong2 = pong2 + 1
                blipp2 = 0
                pong = pong + 1
                CIRCLE (br2, bk2), 2, 0
        END IF
        IF blipp2 = 0 THEN
                blipp2 = 1
                br2 = INT(RND * 626 + 7)
                bk2 = INT(RND * 466 + 7)
        END IF
RETURN
END IF
END

haj2lever:
        SCREEN 12
        DO
                GOSUB ritaskarm3
                GOSUB kontroll2
                GOSUB flytta2
                GOSUB arjagpablipp2
        LOOP


ritaskarm3:
        fart = fart + .001
        LOCATE 2, 2
        PRINT "POŽNG "; pong
        LINE (1, 1)-(639, 479), 2, B
        CIRCLE (r2, k2), 5, 14
        FOR x = 1 TO 100 / hajar
        NEXT
        CIRCLE (br2, bk2), 2, 3
RETURN

