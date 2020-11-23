SCREEN 12
RANDOMIZE TIMER

DIM greve(0 TO 479)  AS INTEGER
a = 32
L = 16
E = 2
k = 2
dt = .5
CONST PI = 3.1415926535897#


FOR i = 0 TO 479
   greve(i) = 0
NEXT
t = 0

PSET (0, 239 - a)
PSET (0, 239 + a)
DO
   't = 0
   x = 10
   bra = 0
   WHILE (bra = 0)
      y = 239 - a - L + RND * (2 * a + L)
      IF (y <= 239 - a + L OR y >= 239 + a - L) THEN bra = 1
   WEND
   PSET (0, 239 - a)
   PSET (0, 239 + a)
  
   dx = 0
   dy = 0
   WHILE (x <= 600 AND x > 0 AND y < 480 AND y >= 0)
      oldx = x
      oldy = y
      dx = -(COS(E * t - k * SQR(x ^ 2 + (y - 239 - a) ^ 2)) * k * x * (x ^ 2 + (y - 239 - a) ^ 2) ^ (-.5) + COS(E * t - k * SQR(x ^ 2 + (y - 239 + a) ^ 2)) * k * x * (x ^ 2 + (y - 239 + a) ^ 2) ^ (-.5))
      dy = -(COS(E * t - k * SQR(x ^ 2 + (y - 239 - a) ^ 2)) * k * (y - 239 - a) * (x ^ 2 + (y - 239 - a) ^ 2) ^ (-.5) + COS(E * t - k * SQR(x ^ 2 + (y - 239 + a) ^ 2)) * k * (y - 239 + a) * (x ^ 2 + (y - 239 + a) ^ 2) ^ (-.5))
    
      x = x + dx * dt
      y = y + dy * dt
      t = t + dt
      LINE (oldx, oldy)-(x, y), 2
   WEND
      IF y >= 0 AND y < 480 AND x >= 600 THEN
         greve(INT(y) + 1) = greve(INT(y) + 1) + 1
         LINE (600, INT(y))-(600 + greve(INT(y)), INT(y)), 10
         IF greve(INT(y)) = 40 THEN bra = 0
      END IF

LOOP WHILE (bra = 1)

