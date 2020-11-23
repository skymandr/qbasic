DECLARE SUB tree (n, l, x, y)
SCREEN 12
CLS
DIM SHARED PI
DIM SHARED l
PI = 3.141592653589793#
l = 300

COLOR 2
n = 3

CALL tree(n, l, 320, 240)

SUB tree (n, l, x, y)
   w = v / 180 * PI
   IF n <> 0 THEN
      d = 1
      CALL tree(n - 1, l / 2, x - d * (l / 2), y + d * (SQR(3) * 2 / 9))
      CALL tree(n - 1, l / 2, x + d * (l / 2), y + d * (SQR(3) * 2 / 9))
      CALL tree(n - 1, l / 2, x, y - d * (SQR(3) * 2 * 2 / 9))
   END IF
   'COLOR n
   LINE (x - l / 2, y + SQR(3) * l / 6)-(x + l / 2, y + SQR(3) * l / 6)
   LINE (x + l / 2, y + SQR(3) * l / 6)-(x, y - SQR(3) * l / 3)
   LINE (x, y - SQR(3) * l / 3)-(x - l / 2, y + SQR(3) * l / 6)
END SUB

