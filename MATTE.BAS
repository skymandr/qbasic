CLS
1 INPUT "Vilket r„kne s„tt(+, -, *, / )"; a$
INPUT "Tal 1"; b
INPUT "Tal 2"; c
IF a$ = "+" THEN d = b + c
IF a$ = "-" THEN d = b - c
IF a$ = "*" THEN d = b * c
IF a$ = "/" THEN d = b / c
PRINT b; a$; c; "="; d
INPUT "Vill du r„kna ett tal till(j, n)"; b$
IF b$ = "J" OR b$ = "j" THEN GOTO 1

