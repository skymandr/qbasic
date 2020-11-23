SCREEN 12
INPUT a
INPUT b
COLOR 2
FOR x = 0 TO a STEP b
LINE (320, 240 + x * b)-(320 + a * b - x * b, 240)
LINE (320, 240 - x * b)-(320 + a * b - x * b, 240)
LINE (320, 240 + x * b)-(320 - a * b + x * b, 240)
LINE (320, 240 - x * b)-(320 - a * b + x * b, 240)
NEXT

