SCREEN 12
RANDOMIZE TIMER
DIM Counter(0 TO 480) AS INTEGER
PI = 3.141593
h = 6.63 * 10 ^ (-34)
m = 9.11 * 10 ^ (-31)
L = 12 * 10 ^ (-6)
v = h / (m * L)
c = 3 * 10 ^ 8
f = v / L
dt = 1

k = 10 ^ (-6)
Ll = L * 10 ^ 6
n = 0
DO
   bra = 0
   t = 0
   dx = v * dt
   dy = 0
   x = 1
   WHILE (bra = 0)
      y = 241 - 1.5 * Ll + RND * 3 * Ll
      IF (y <= 240 - Ll / 2 OR y >= 241 + Ll / 2) THEN bra = 1
   WEND
   DO
      PSET (x, y), 4
     
      r = SQR(x ^ 2 + (240 - Ll / 2 - y) ^ 2)
      dx1 = k * x * (COS(2 * PI * r / L - f * t) * 2 / L - SIN(2 * PI * r / L - f * t) / (PI) * r ^ 2)
      dy1 = k * (240 - Ll / 2 - y) * (COS(2 * PI * r / L - f * t) * 2 / L - SIN(2 * PI * r / L - f * t) / (PI * r ^ 2))
      r = SQR(x ^ 2 + (240 + Ll / 2 - y) ^ 2)
      dx2 = k * x * (COS(2 * PI * r / L - f * t) * 2 / L - SIN(2 * PI * r / L - f * t) / (PI) * r ^ 2)
      dy2 = k * (240 + Ll / 2 - y) * (COS(2 * PI * r / L - f * t) * 2 / L - SIN(2 * PI * r / L - f * t) / (PI) * r ^ 2)

      dx = dx + dx1 + dx2
      dy = dy + dy1 + dy2
      x = x + dx
      y = y + dy
      t = t + dt
   LOOP WHILE ((x < 600 AND x > 0) AND (y <= 480 AND y >= 0))
   IF (x >= 600 AND y >= 0 AND y <= 480) THEN
      Counter(INT(y)) = Counter(INT(y)) + 1
      LINE (600, y)-(600 + Counter(INT(y)), y), 12
   END IF
LOOP

