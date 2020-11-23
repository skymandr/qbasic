1 SCREEN 12
SLEEP 1
X = -2
y = 2
y2 = 50
x2 = 5
CLS
DO
LOCATE 1, 1
RANDOMIZE TIMER
PRINT RND * 365; ' CHR$(INT(RND * 255) + 1);
FOR Text = -2 TO 12
IF POINT(X + 1, y + Text) > 0 THEN PSET (x2, y2 + Text)
NEXT
X = X + 1
x2 = x2 + 1
IF X > 100 THEN EXIT DO
LOOP
GOTO 1

