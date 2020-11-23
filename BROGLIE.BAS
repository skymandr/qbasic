SCREEN 12
RANDOMIZE TIMER
PI = 3.141593
L = 12
t = 0
dt = L / 4
k = L / 4

'FOR r = 0 TO 640 STEP L
'   CIRCLE (301, 0), r, 1
'   CIRCLE (301, 0), r + L / 2, 2
'   CIRCLE (341, 0), r, 1
'   CIRCLE (341, 0), r + L / 2, 2
'NEXT

'F = SIN(2 * PI * r / L + T) * k * T / (r ^ 2)
'dF = (COS(2 * PI * r / L + T) * 2 * PI / L * k * T * r ^ 2 - SIN(2 * PI * r / L + T) * k * T * 2 * r) / r ^ 4
'dx = SIN(2 * PI * r / L + T) * k * (301 - x) / r ^ 2
'dy = SIN(2 * PI * r / L + T) * k * y / r ^ 2
n = 0
DO
   n = n + 1
   LOCATE 1, 1
   PRINT n
   y = 0
   x = 320 - 8 * L + RND * 16 * L
   dx = 0
   dy = k
   t = 0
   WHILE 0 <= y AND y <= 480 AND 0 <= x AND x <= 640
      r = ((301 - x) ^ 2 + y ^ 2) ^ (1 / 2)
      dx1 = (COS(2 * PI * r / L - t) * 2 * PI * k * (301 - x) * r / L - SIN(2 * PI * r / L - t) * k * (301 - x)) / r ^ 2
      dy1 = (COS(2 * PI * r / L - t) * 2 * PI * k * y * r / L - SIN(2 * PI * r / L - t) * k * y) / r ^ 2
      'dx1 = SIN(2 * PI * r / L - t) * k * (301 - x) / r ^ 2
      'dy1 = SIN(2 * PI * r / L - t) * k * y / r ^ 2
     
      r = ((341 - x) ^ 2 + y ^ 2) ^ (1 / 2)
      dx2 = (COS(2 * PI * r / L - t) * 2 * PI * k * (341 - x) * r / L - SIN(2 * PI * r / L - t) * k * (341 - x)) / r ^ 2
      dy2 = (COS(2 * PI * r / L - t) * 2 * PI * k * y * r / L - SIN(2 * PI * r / L - t) * k * y) / r ^ 2
      'dx2 = SIN(2 * PI * r / L - t) * k * (341 - x) / r ^ 2
      'dy2 = SIN(2 * PI * r / L - t) * k * y / r ^ 2
  
      PSET (x, y), 4
      dx = dx + dx1 + dx2
      dy = dy + dy1 + dy2
      x = x + dx
      y = y + dy
      t = t + dt
   WEND
LOOP WHILE n < 1000
BEEP
SLEEP
FOR r = 0 TO 640 STEP L
   CIRCLE (301, 0), r, 1
'   CIRCLE (301, 0), r + L / 2, 2
   CIRCLE (341, 0), r, 1
'   CIRCLE (341, 0), r + L / 2, 2
NEXT

