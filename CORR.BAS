SCREEN 13

DO
A$ = UCASE$(INKEY$)
IF LEN(A$) > 1 THEN
SELECT CASE RIGHT$(A$, 1)
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
SELECT CASE A$
CASE CHR$(27)
END
CASE "P"
A$ = INPUT$(1)
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

IF x < 1 THEN x = 1: w = -w * .9
IF x > 320 THEN x = 320: w = -w * .9
IF y < 1 THEN y = 1: h = -h * .9
IF y > 200 THEN y = 200: h = -h * .9

PSET (ox, oy), 0
IF POINT(x, y) = 15 THEN END
PSET (x, y), 14
ox = x
oy = y
   
'Pupd (t)
LOOP

