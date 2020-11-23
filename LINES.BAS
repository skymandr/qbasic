SCREEN 13
'320*200
RANDOMIZE TIMER
xa = INT(RND * 300) + 1
xb = INT(RND * 300) + 1
xc = INT(RND * 300) + 1
ya = INT(RND * 190) + 1
yb = INT(RND * 190) + 1
yc = INT(RND * 190) + 1
dira = INT(RND * 8) + 1
dirb = INT(RND * 8) + 1
dirc = INT(RND * 8) + 1
DO
RANDOMIZE TIMER
LINE (xa, ya)-(xb, yb), 0
LINE (xb, yb)-(xc, yc), 0
LINE (xa, ya)-(xc, yc), 0
IF dira = 1 THEN
xa = xa - 1
ya = ya + 1
END IF
IF dirb = 1 THEN
xb = xb - 1
yb = yb + 1
END IF
IF dirc = 1 THEN
xc = xc - 1
yc = yc + 1
END IF
IF dira = 2 THEN ya = ya + 1
IF dirb = 2 THEN yb = yb + 1
IF dirc = 2 THEN yc = yc + 1
IF dira = 3 THEN
xa = xa + 1
ya = ya + 1
END IF
IF dirb = 3 THEN
xb = xb + 1
yb = yb + 1
END IF
IF dirc = 3 THEN
xc = xc + 1
yc = yc + 1
END IF
IF dira = 4 THEN xa = xa - 1
IF dirb = 4 THEN xb = xb - 1
IF dirc = 4 THEN xc = xc - 1
IF dira = 5 THEN xa = xa + 1
IF dirb = 5 THEN xb = xb + 1
IF dirc = 5 THEN xc = xc + 1
IF dira = 6 THEN
xa = xa - 1
ya = ya - 1
END IF
IF dirb = 6 THEN
xb = xb - 1
yb = yb - 1
END IF
IF dirc = 6 THEN
xc = xc - 1
yc = yc - 1
END IF
IF dira = 7 THEN ya = ya - 1
IF dirb = 7 THEN yb = yb - 1
IF dirc = 7 THEN yc = yc - 1
IF dira = 8 THEN
xa = xa + 1
ya = ya - 1
END IF
IF dirb = 8 THEN
xb = xb + 1
yb = yb - 1
END IF
IF dirc = 8 THEN
xc = xc + 1
yc = yc - 1
END IF
IF xa < 0 THEN
xa = 5
dira = INT(RND * 8) + 1
END IF
IF xb < 0 THEN
xb = 5
dirb = INT(RND * 8) + 1
END IF
IF xc < 0 THEN
xc = 5
dirc = INT(RND * 8) + 1
END IF
IF ya < 0 THEN
ya = 5
dira = INT(RND * 8) + 1
END IF
IF yb < 0 THEN
yb = 5
dirb = INT(RND * 8) + 1
END IF
IF yc < 0 THEN
yc = 5
dirc = INT(RND * 8) + 1
END IF
IF ya > 200 THEN
ya = 195
dira = INT(RND * 8) + 1
END IF
IF yb > 200 THEN
yb = 195
dirb = INT(RND * 8) + 1
END IF
IF yc > 200 THEN
yc = 195
dirc = INT(RND * 8) + 1
END IF
IF xa > 320 THEN
xa = 315
dira = INT(RND * 8) + 1
END IF
IF xb > 320 THEN
xb = 315
dirb = INT(RND * 8) + 1
END IF
IF xc > 320 THEN
xc = 315
dirc = INT(RND * 8) + 1
END IF
LINE (xa, ya)-(xb, yb), col
LINE (xb, yb)-(xc, yc), col + 1
LINE (xa, ya)-(xc, yc), col + 2
col = col + .5
IF col > 243 THEN col = 1
a$ = INKEY$
LOOP UNTIL a$ = CHR$(27)
                      

