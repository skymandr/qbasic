CLS
PRINT SPC(30); "Labyrint Programm"
RANDOMIZE TIMER
PRINT
2 INPUT "Ange bredd, l„ngd: ", h, v
IF h <> 1 AND v <> 1 THEN 1
PRINT "Meningsl”sa dimensioner. F”rs”k igen.": GOTO 2
1 DIM W(h, v): DIM v(h, v)
PRINT
q = 0: z = 0: x = INT(RND * h + 1)
CLS
FOR i = 1 TO h
        IF i = x THEN 3
        PRINT ".--"; : GOTO 4
3       PRINT ".  ";
4 NEXT
PRINT "."
c = 1: W(x, 1) = c: c = c + 1
r = x: s = 1: GOTO 5
9 IF r <> h THEN 6
IF s <> v THEN 7
r = 1: s = 1: GOTO 8
7 r = 1: s = s + 1: GOTO 8
6 r = r + 1
8 IF W(r, s) = 0 THEN 9
5 IF r - 1 = 0 THEN 10
IF W(r - 1, s) <> 0 THEN 10
IF s - 1 = 0 THEN 11
IF W(r, s - 1) <> 0 THEN 11
IF r = h THEN 12
IF W(r + 1, s) <> 0 THEN 12
x = INT(RND * 3 + 1)
ON x GOTO 13, 14, 15
12 IF s <> v THEN 16
IF z = 1 THEN 17
q = 1: GOTO 18
16 IF W(r, s + 1) <> 0 THEN 17
18 x = INT(RND * 3 + 1)
ON x GOTO 13, 14, 19
17 x = INT(RND * 2 + 1)
ON x GOTO 13, 14
11 IF r = h THEN 20
IF W(r + 1, s) <> 0 THEN 20
IF s <> v THEN 21
IF z = 1 THEN 22
q = 1: GOTO 23
21 IF W(r, s + 1) <> 0 THEN 22
23 x = INT(RND * 3 + 1)
ON x GOTO 13, 14, 19
22 x = INT(RND * 2 + 1)
ON x GOTO 13, 15
20 IF s <> v THEN GOTO 24
IF z = 1 THEN 25
q = 1: GOTO 26
24  IF W(r, s + 1) <> 0 THEN 25
26 x = INT(RND * 2 + 1)
ON x GOTO 13, 19
25 GOTO 13
10 IF s - 1 = 0 THEN 28
IF W(r, s - 1) <> 0 THEN 28
IF r = h THEN 27
IF W(r + 1, s) <> 0 THEN 27
IF s <> v THEN 29
IF z = 1 THEN 30
q = 1: GOTO 31
29 IF W(r, s + 1) <> 0 THEN 30
31 x = INT(RND * 3 + 1)
ON x GOTO 14, 15, 19
30 x = INT(RND * 2 + 1)
ON x GOTO 14, 15
27 IF s <> v THEN 32
IF z = 1 THEN 33
q = 1: GOTO 34
32 IF W(r, s + 1) <> 0 THEN 33
34 x = INT(RND * 2 + 1)
ON x GOTO 14, 19
33 GOTO 14
28 IF r = h THEN 35
IF W(r + 1, s) <> 0 THEN 35
IF s <> v THEN 36
IF z = 1 THEN 37
q = 1: GOTO 38
36 IF W(r, s + 1) <> 0 THEN 37
x = INT(RND * 2 + 1)
ON x GOTO 15, 19
37 GOTO 15
35 IF s <> v THEN 39
IF z = 1 THEN 40
q = 1: GOTO 41
39 IF W(r, s + 1) <> 0 THEN 40
41 GOTO 19
40 GOTO 1000
13 W(r - 1, s) = c
c = c + 1: v(r - 1, s) = 2: r = r - 1
IF c = h * v + 1 THEN 1010
q = 0: GOTO 5
14 W(r, s - 1) = c
38 c = c + 1
v(r, s - 1) = 1: s = s + 1: IF c = h * v + 1 THEN 1010
q = 0: GOTO 5
15 W(r + 1, s) = c
c = c + 1: IF v(r, s) = 0 THEN 42
v(r, s) = 3: GOTO 43
42 v(r, s) = 2
43 r = r + 1
IF c = h * v + 1 THEN 1010
GOTO 10
19 IF q = 1 THEN 44
W(r, s + 1) = c: c = c + 1: IF v(r, s) = 0 THEN 45
v(r, s) = 3: GOTO 46
45 v(r, s) = 1
46 s = s + 1: IF c = h * v + 1 THEN 1010
GOTO 5
44 z = 1
IF v(r, s) = 0 THEN 47
v(r, s) = 3: q = 0: GOTO 1000
47 v(r, s) = 1: q = 0: r = 1: s = 1: GOTO 8
1000 GOTO 9
1010 FOR J = 1 TO v
        PRINT "|";
        FOR i = 1 TO h
                IF v(i, J) < 2 THEN 1030
                PRINT "   ";
                GOTO 1040
1030            PRINT "  |";
1040    NEXT
        PRINT
        FOR i = 1 TO h
                IF v(i, J) = 0 THEN 1060
                IF v(i, J) = 2 THEN 1060
                PRINT "I  ";
                GOTO 1070
1060            PRINT "I--";
1070    NEXT
        PRINT "_"
NEXT
END

