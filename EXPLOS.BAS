SCREEN 12
RANDOMIZE TIMER
FOR X = 1 TO 100
Farg = INT(RND * 3)
IF Farg = 0 THEN Farg = 4
IF Farg = 1 THEN Farg = 14
IF Farg = 2 THEN Farg = 15
DRAW "BM320,240TA" + LTRIM$(STR$(INT(RND * 360))) + " NU" + LTRIM$(STR$(INT(RND * X * 2)))
DRAW "BM320,240TA" + LTRIM$(STR$(INT(RND * 360))) + " NU" + LTRIM$(STR$(INT(RND * X * 2)))
CIRCLE (320 + RND * X * 2 - X, 240 + RND * X * 2 - X), RND * 20 + 10, Farg
SOUND RND * 10 + 37, .1
NEXT

