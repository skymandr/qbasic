1 CLS
2 PRINT TAB(34); "Liv"
4 PRINT TAB(15); "Magical Hacker Software Alings†s"
6 PRINT : PRINT : PRINT
8 PRINT "Ange ”nskat m”nster:"
9 x1 = 1: y1 = 1: x2 = 24: y2 = 70
10 DIM a(24, 70), b$(24)
20 c = 1
30 INPUT b$(c)
40 IF b$(c) = "slut" THEN b$(c) = "": GOTO 80
50 IF LEFT$(b$(c), 1) = "." THEN b$(c) = " " + RIGHT$(b$(c), LEN(b$(c)) - 1)
60 c = c + 1
70 GOTO 30
80 c = c - 1: l = 0
90 FOR x = 1 TO c - 1
100 IF LEN(b$(x)) > l THEN l = LEN(b$(x))
110 NEXT
120 x1 = 11 - c / 2
130 y1 = 33 - l / 2
140 FOR x = 1 TO c
150 FOR y = 1 TO LEN(b$(x))
160 IF MID$(b$(x), y, 1) <> " " THEN a(x1 + x, y1 + y) = 1: p = p + 1
170 NEXT
180 NEXT
200 PRINT : PRINT : PRINT
210  PRINT "Generation:"; g; "Population:"; p: IF i9 THEN PRINT "Ogiltigt!": GOTO 650
215 x3 = 24: y3 = 70: x4 = 1: p = 0
220 g = g + 1
225 FOR x = 1 TO x1 - 1: PRINT : NEXT
230 FOR x = x1 TO x2
240 PRINT
250 FOR y = y1 TO y2
253 IF a(x, y) = 2 THEN a(x, y) = 0: GOTO 270
256 IF a(x, y) = 3 THEN a(x, y) = 1: GOTO 261
260 IF a(x, y) <> 1 THEN 270
261 PRINT TAB(y); "*";
262 IF x < x3 THEN x3 = x
264 IF x > x4 THEN x4 = x
266 IF y < y3 THEN y3 = y
268 IF y > y4 THEN y4 = y
270 NEXT
290 NEXT
295 FOR x = x2 + 1 TO 24: PRINT : NEXT
299 x1 = x3: x2 = x4: y1 = y3: y2 = y4
301 IF x1 < 3 THEN x1 = 3: i9 = -1
303 IF x2 > 22 THEN x2 = 22: i9 = -1
305 IF y1 < 3 THEN y1 = 3: i9 = -1
307 IF y2 > 68 THEN y2 = 68: i9 = -1
309 p = 0
500 FOR x = x1 - 1 TO x2 + 1
510 FOR y = y1 - 1 TO y2 + 1
520 c = 0
530 FOR i = x - 1 TO x + 1
540 FOR j = y - 1 TO y + 1
550 IF a(i, j) = 1 OR a(i, j) = 2 THEN c = c + 1
560 NEXT
570 NEXT
580 IF a(x, y) = 0 THEN 610
590 IF c < 3 OR c > 4 THEN a(x, y) = 2: GOTO 600
595 p = p + 1
600 GOTO 620
610 IF c = 3 THEN a(x, y) = 3: p = p + 1
620 NEXT
630 NEXT
635 x1 = x1 - 1: y1 = y1 - 1: x2 = x2 + 1: y2 = y2 + 1
640 GOTO 210
650 END

