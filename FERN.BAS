DECLARE SUB tree (n, l, v, x, y)
SCREEN 12
CLS
DIM SHARED arg AS INTEGER
DIM SHARED length
DIM SHARED PI
DIM SHARED d
arg = 40
length = 400
PI = 3.141592653589793#
d = 0

COLOR 2
n = 4

CALL tree(n, length, 180, 300, 450)

SUB tree (n, l, v, x, y)
   w = v / 180 * PI
   IF n <> 0 THEN
      CALL tree(n - 1, l / 2, v + arg + d, x + SIN(w) * l / 2, y + COS(w) * l / 2)
      CALL tree(n - 1, l / 2, v + d, x + SIN(w) * l / 2, y + COS(w) * l / 2)
      CALL tree(n - 1, l / 2, v - arg + d, x + SIN(w) * l / 2, y + COS(w) * l / 2)
      'CALL tree(n - 1, l / 2, v + d, x - SIN(w) * l / 2, y - COS(w) * l / 2)
   END IF
   'COLOR n
   LINE (x, y)-(x + SIN(w) * l / 2, y + COS(w) * l / 2)
END SUB

