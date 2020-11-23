SCREEN 12
INPUT "Storlek"; n
FOR x = -1.3 TO 3.9 STEP 1 / n
   FOR y = -2.4 TO 0 STEP 1 / n
      r = 0
      zr# = 0
      zi# = 0
      DO
         zio# = zi#
         zro# = zr#
         zi# = 2 * zio# * zro# + (-y) / (x ^ 2 + y ^ 2)
         zr# = zro# ^ 2 - zio# ^ 2 + x / (x ^ 2 + y ^ 2)
         r = r + 1
      LOOP WHILE (zi# ^ 2 + zr# ^ 2) ^ .5 < 2 AND r < 16
      IF (zi# ^ 2 + zr# ^ 2) ^ .5 >= 2 THEN PSET (x * n + 2.1 * n, y * n + 1.3 * n + 42), r: PSET (x * n + 2.1 * n, 1.3 * n - y * n + 42), r
   NEXT
NEXT
SLEEP

