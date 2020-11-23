SCREEN 13

L = 1
CONST PI = 3.1415926535897#
s = 4
grain = 1

FOR y = 0 TO 239 STEP grain
   FOR x = 0 TO 319 STEP grain
      r1 = SQR(y ^ 2 + (159 - s - x) ^ 2)
      r2 = SQR(y ^ 2 + (159 + s - x) ^ 2)
      QP = SIN(r1 / L) + SIN(r2 / L)
      PSET (x, y), 24 + INT(4 * QP)
   NEXT
   PSET (159 - s, 0), 0
   PSET (159 + s, 0), 0
NEXT
SLEEP

