SCREEN 12
RANDOMIZE TIMER
PI = 3.141593
m = 9.12 * 10 ^ (-31)
h = 6.63 * 10 ^ (-34)
L = 24
v = h / (m * L * 10 ^ (-6))
f = h / (m * v)
t = 0
dt = .1
k = 42

'F = k * SIN(2 * PI * r / L - t) / (r * PI)
'dF = k * (COS(2 * PI * r / L - t) * 2 / L - SIN(2 * PI * r / L - t) / (r * PI)) / r

n = 0
DO
   n = n + 1
   LOCATE 1, 1
   PRINT n
   y = 1
   bra = 0
   WHILE (bra = 0)
      x = 321 - 2 * L + RND * 4 * L
      IF x <= 321 - L / 2 OR x >= 321 + L / 2 THEN bra = 1
   WEND
   dx = 0
   dy = v * dt
   t = 0
   WHILE 0 <= y AND y < 480 AND 0 <= x AND x <= 640
      r = ((281 - x) ^ 2 + y ^ 2) ^ (1 / 2)
      dx1 = k * (281 - x) * (COS(2 * PI * r / L - f * t) * 2 / L - SIN(2 * PI * r / L - f * t) / (r * PI)) / r ^ 2
      dy1 = k * y * (COS(2 * PI * r / L - f * t) * 2 / L - SIN(2 * PI * r / L - f * t) / (r * PI)) / r ^ 2
     
      r = ((361 - x) ^ 2 + y ^ 2) ^ (1 / 2)
      dx2 = k * (361 - x) * (COS(2 * PI * r / L - f * t) * 2 / L - SIN(2 * PI * r / L - f * t) / (r * PI)) / r ^ 2
      dy2 = k * y * (COS(2 * PI * r / L - f * t) * 2 / L - SIN(2 * PI * r / L - f * t) / (r * PI)) / r ^ 2
  
      PSET (x, y), 4
      dx = dx + dx1 + dx2
      dy = dy + dy1 + dy2
      x = x + dx
      y = y + dy
      t = t + dt
   WEND
   IF y >= 480 THEN CIRCLE (x, 480), 1, 4

LOOP WHILE n < 1000
BEEP
SLEEP

FOR r = 0 TO 640 STEP L
   CIRCLE (281, 0), r, 1
'   CIRCLE (281, 0), r + L / 2, 2
   CIRCLE (361, 0), r, 1
'   CIRCLE (361, 0), r + L / 2, 2
NEXT

