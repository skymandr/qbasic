SCREEN 12
RANDOMIZE TIMER

DIM greve(0 TO 479)  AS INTEGER
L = 2
CONST PI = 3.1415926535897#

c = 30
B = .5
v = B * c
f = v / (L * 4)
dt = 1

FOR i = 0 TO 479
   greve(i) = 0
NEXT
t = 0

PSET (0, 239 - 4 * L)
PSET (0, 239 + 4 * L)
DO
   t = 0
   x = 1
   bra = 0
   WHILE (bra = 0)
      y = 239 - 6 * L + RND * 12 * L
      IF (y <= 239 - 2 * L OR y >= 239 + 2 * L) THEN bra = 1
   WEND
   dx = v * dt
   dy = 0
   WHILE (x <= 600 AND x > 0 AND y < 480 AND y >= 0)
      oldx = x
      oldy = y
      x = x + dx
      y = y + dy
     
      r1 = SQR(x ^ 2 + (239 - 4 * L - y) ^ 2)
      r2 = SQR(x ^ 2 + (239 + 4 * L - y) ^ 2)
      p1 = ABS(SIN(2 * PI * f * (t - r1 * B / c))) ^ 2
      p2 = ABS(SIN(2 * PI * f * (t - r2 * B / c))) ^ 2
      
      tdx = x * (p1 + p2)
      tdy = (-1) * ((239 - 4 * L - y) * p1 + (239 + 4 * L - y) * p2)
      dx = SQR(((v * dt) ^ 2) / (1 + (tdy / tdx) ^ 2))
      dy = SGN(tdy) * SQR(((v * dt) ^ 2) / (1 + (tdx / tdy) ^ 2))
     
      LINE (oldx, oldy)-(x, y), 2
      t = t + dt
   WEND
      IF y >= 0 AND y < 480 AND x >= 600 THEN
         greve(INT(y)) = greve(INT(y)) + 1
         LINE (600, INT(y))-(600 + greve(INT(y)), INT(y)), 10
         IF greve(INT(y)) = 40 THEN bra = 0
      END IF

LOOP WHILE (bra = 1)

