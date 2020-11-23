SCREEN 12
CONST pi = 3.141592
FOR a = 1 TO 365 * pi STEP .1
b = b + SIN(a / (pi * 3.5))' Byt ut / mot \ f”r ny effekt.
IF a > 640 THEN a = 0
IF b > 480 THEN b = 0
IF a < 0 THEN a = 640
IF b < 0 THEN b = 480
SOUND b + 37, .5
PSET (a, b)
NEXT

