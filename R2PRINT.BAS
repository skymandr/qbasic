DECLARE SUB R2Print (A$)
DO
RANDOMIZE TIMER
DO
CLS
INPUT "Vad ska Artoo s„ga"; A$
LOOP WHILE A$ = ""
CLS
LOCATE 11, 40 - LEN(A$) / 2
R2Print A$
SLEEP 2
LOOP

SUB R2Print (A$)
X = 1
DO
X$ = MID$(A$, X, 1)
IF X$ = "" THEN EXIT DO
PRINT X$;
SOUND 37 * ASC(X$), INT(RND * 2 + 1)
X = X + 1
LOOP
END SUB

