DECLARE SUB tree (n, l, x, y)

SCREEN 12
COLOR 14
CLS

DIM SHARED n1

l = 360

PRINT "'Stars in the Sky' by SkyTeX."
INPUT "Number of iterations: ", n
n1 = n

CALL tree(n, l, 320, 240)

SLEEP

SUB tree (n, l, x, y)

   IF n <> 0 THEN
      CALL tree(n - 1, l / 3, x, y - (SQR(3) * l * 2 / 9))
      CALL tree(n - 1, l / 3, x - (l / 3), y - (SQR(3) * l / 9))
      CALL tree(n - 1, l / 3, x - (l / 3), y + (SQR(3) * l / 9))
      CALL tree(n - 1, l / 3, x, y + (SQR(3) * l * 2 / 9))
      CALL tree(n - 1, l / 3, x + (l / 3), y + (SQR(3) * l / 9))
      CALL tree(n - 1, l / 3, x + (l / 3), y - (SQR(3) * l / 9))
   ELSE
      LINE (x - l / 2, y + SQR(3) * l / 6)-(x + l / 2, y + SQR(3) * l / 6)
      LINE (x + l / 2, y + SQR(3) * l / 6)-(x, y - SQR(3) * l / 3)
      LINE (x, y - SQR(3) * l / 3)-(x - l / 2, y + SQR(3) * l / 6)

      LINE (x - l / 2, y - SQR(3) * l / 6)-(x + l / 2, y - SQR(3) * l / 6)
      LINE (x + l / 2, y - SQR(3) * l / 6)-(x, y + SQR(3) * l / 3)
      LINE (x, y + SQR(3) * l / 3)-(x - l / 2, y - SQR(3) * l / 6)
   END IF

END SUB

