DECLARE SUB title ()
FXDECLARE SUB title ()
DECLARE SUB Centre (a$, c!)
DECLARE FUNCTION max! (x!, y!)
DECLARE FUNCTION min! (x!, y!)
DECLARE SUB eupd (x!, y!)
DECLARE SUB Pupd (t!)
DECLARE SUB die (x!, y!)
'
'                               PST Hunt 1.0
'                       Try to escape the evil squares
'
'
'
SCREEN 13
'
DIM SHARED espr%(6 * 6 + 4, 1), epos(9, 5), d AS INTEGER, t$(30)
'
d = 0
'
FOR y = 0 TO 6
    FOR x = 0 TO 6
        READ c
        PSET (x, y), c
NEXT x, y
'
GET (0, 0)-(6, 6), espr%(0, 0)
GET (10, 10)-(6, 6), espr%(0, 1)
'
DATA 0,0,0,3,0,0,0
DATA 0,0,10,3,13,0,0
DATA 0,10,10,3,13,13,0
DATA 3,3,3,4,5,5,5
DATA 0,13,13,5,4,4,0
DATA 0,0,13,5,4,0,0
DATA 0,0,0,5,0,0,0
'
CLS
'
title
'
x = 160
y = 100
t = TIMER
'
DO
    IF d = 0 THEN eupd x, y

    a$ = UCASE$(INKEY$)

    IF LEN(a$) > 1 THEN
        SELECT CASE RIGHT$(a$, 1)
        CASE "K"
            w = w - .1
        CASE "M"
            w = w + .1
        CASE "H"
            h = h - .1
        CASE "P"
            h = h + .1
        CASE "G"
            w = w - .1
            h = h - .1
        CASE "I"
            w = w + .1
            h = h - .1
        CASE "O"
            w = w - .1
            h = h + .1
        CASE "Q"
            w = w + .1
            h = h + .1
        END SELECT
    ELSE
        SELECT CASE a$
        CASE CHR$(27)
            END
        CASE "P"
            a$ = INPUT$(1)
        END SELECT
    END IF

    IF ABS(w) < .09 THEN w = 0
    IF ABS(h) < .09 THEN h = 0
    IF w > 3 THEN w = 3
    IF w < -3 THEN w = -3
    IF h > 3 THEN h = 3
    IF h < -3 THEN h = -3

    x = x + w
    y = y + h

    IF x < 9 THEN x = 9: w = -w * .9
    IF x > 309 THEN x = 309: w = -w * .9
    IF y < 26 THEN y = 26: h = -h * .9
    IF y > 189 THEN y = 189: h = -h * .9

    PSET (ox, oy), 0
    IF POINT(x, y) THEN die x, y
    PSET (x, y), 15
    ox = x
    oy = y
    
    Pupd (t)
LOOP

text:
DATA "PST Software Entertainment",5,"Presents",6,"A",8,"Johan E. Thelin",9,"Production",10,"Space Hunt",12,"Compiled by Fredrik Malmer",14,"Copyright 1995 PST Software",16,"Obi-wan never told you ",18,"LosEndos",0

SUB Centre (a$, c)
        FOR a = 1 TO LEN(a$)
                t$(a - 1) = MID$(a$, a, 1)
        NEXT a
        '
        FOR a = 0 TO LEN(a$) + 15
                FOR B = 1 TO LEN(a$)
                        COLOR 15 + min(a + B, 15)
                        LOCATE c, 19 + (LEN(a$) MOD 2) * .5 - LEN(a$) / 2 + B
                        PRINT t$(B - 1)
                        'LOCATE 1, 1
                        'COLOR 15
                        'PRINT t$(b - 1)
                        'q$ = INPUT$(1)
                NEXT B
                FOR q = 0 TO 0: NEXT q
        NEXT a
END SUB

SUB die (x, y)
    STATIC r
    '
    r = r + 1
    IF r < 50 THEN
        FOR a = 1 TO 15
            RANDOMIZE TIMER
            SELECT CASE INT(RND * 5)
            CASE 0
                c = 14
            CASE 1
                c = 15
            CASE 2
                c = 7
            CASE ELSE
                c = 4
            END SELECT
            '
            CIRCLE (x, y), a, c
        NEXT a
        d = 100
    ELSE
        END
    END IF
END SUB

SUB eupd (x, y)
    FOR a = 0 TO 5
        RANDOMIZE TIMER
        IF x > epos(a, 0) AND epos(a, 2) < 3 THEN epos(a, 2) = epos(a, 2) + RND / 5
        IF x < epos(a, 0) AND epos(a, 2) > -3 THEN epos(a, 2) = epos(a, 2) - RND / 5

        RANDOMIZE TIMER
        IF y > epos(a, 1) AND epos(a, 3) < 3 THEN epos(a, 3) = epos(a, 3) + RND / 5
        IF y < epos(a, 1) AND epos(a, 3) > -3 THEN epos(a, 3) = epos(a, 3) - RND / 5

        epos(a, 0) = epos(a, 0) + epos(a, 2)
        epos(a, 1) = epos(a, 1) + epos(a, 3)

        IF epos(a, 0) > 309 THEN epos(a, 0) = 309: epos(a, 2) = -epos(a, 2)
        IF epos(a, 0) < 9 THEN epos(a, 0) = 9: epos(a, 2) = -epos(a, 2)
        IF epos(a, 1) > 189 THEN epos(a, 1) = 189: epos(a, 3) = -epos(a, 3)
        IF epos(a, 1) < 30 THEN epos(a, 1) = 30: epos(a, 3) = -epos(a, 3)

        LINE (epos(a, 4), epos(a, 5))-STEP(6, 6), 0, BF
        PUT (epos(a, 0), epos(a, 1)), espr%(0, 0)

        epos(a, 4) = epos(a, 0)
        epos(a, 5) = epos(a, 1)
    NEXT a
END SUB

FUNCTION max (x, y)
        IF x > y THEN
                max = x
        ELSE
                max = y
        END IF
END FUNCTION

FUNCTION min (x, y)
        IF y < x THEN
                min = y
        ELSE
                min = x
        END IF
END FUNCTION

SUB Pupd (t)
    STATIC o
    '
    IF INT(TIMER - t) <> o AND d = 0 THEN
        LINE (0, 0)-(319, 25), 0, BF
        LINE (0, 25)-(319, 25), 15
        LOCATE 2, 5
        COLOR 15
        PRINT INT(TIMER - t)
        o = INT(TIMER - t)
    END IF
END SUB

SUB title
        RESTORE text:
        READ a$, c
        DO
                t = TIMER
                Centre a$, c
                READ a$, c
                DO: LOOP UNTIL TIMER - t > 1.5
        LOOP UNTIL a$ = "LosEndos"
        FOR a = 0 TO 1000: NEXT a

        x1 = 20
        y1 = 0
        w1 = -1
        h1 = 1
        x2 = 150
        y2 = 25
        w2 = 1
        h2 = -1
        DO
        LOOP UNTIL INKEY$ <> ""
        CLS
END SUB

