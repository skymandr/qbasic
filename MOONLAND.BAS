3 SCREEN 12
5 PRINT TAB(30); "Planetary Lander"
7 PRINT : PRINT
20 PRINT "You are an astronaut aboard an APOLLO shuttle that is just about to land on the moon."
40 PRINT "Your computer has had a short-circuiting so you will have to land manualy. "
60 PRINT "Enter the engine thrust with a number between 0(freefall) and 200(max) kg per   second."
80 PRINT "Enter new thrust every tenth second.": PRINT
100 PRINT "  /Ä\  EAGLE Lander": PRINT " ³ O ³ Weight: 32500kg": PRINT " ÀÂÂÂÙ Fuel capacity: 16000kg": PRINT " / I \": PRINT "Á  Á  Á"
110 PRINT : PRINT : PRINT "Good luck!"
120 l = 0
130 PRINT : PRINT "SEC", "KM", "KM/H", "KG FUEL", "THRUST": PRINT
140 a = 192: v = 1: m = 32500: n = 16000: g = .001: z = 1.8
150 PRINT l, INT(a), 3600 * v, m - n, : INPUT k: t = 10
160 IF m - n < .001 THEN 240
170 IF t < .001 THEN 150
180 s = t: IF m >= n + s * k THEN 200
190 s = (m - n) / k
200 GOSUB 420
210 IF v <= 0 THEN 230
220 IF j < 0 THEN 370
230 GOSUB 330: GOTO 160
240 PRINT "You are out of fuel after"; l; "seconds": s = (-v + SQR(v * v + 2 * a * g)) / g
250 v = v + g * s: l = l + s
260 w = 3600 * v: PRINT "On the moon after"; l; "seconds - velocity at impact"; w; "km/h"
270 IF w < 1.2 THEN PRINT "Perfect landing!": GOTO 440
280 IF w <= 10 THEN PRINT "Good landing.":  GOTO 440
282 IF w > 60 THEN 300
284 PRINT "Shuttle damages. You will have to stay here until a rescue expedition arrives."
286 PRINT "I hope that you've got a sufficient oxygen supply!"
288 GOTO 440
300 PRINT "Unfortuneately didn't anybody survive! You failed!"
310 PRINT "You made a new crater, "; w * .909; "meters deep!"
320 GOTO 440
330 l = l + s: t = t - s: m = m - s * k: a = i: v = j: RETURN
340 IF s <= .005 THEN 260
350 d = v + SQR(v * v + 2 * a * (g - z * k / m)): s = 2 * a / d
360 GOSUB 420: GOSUB 330: GOTO 340
370 w = (1 - m * g / (z * k)) / 2: s = m * v / (z * k * (w + SQR(w * w + v / z))) + .05: GOSUB 420
380 IF i <= 0 THEN 340
390 GOSUB 330: IF j > 0 THEN 160
400 IF v > 0 THEN 370
410 GOTO 160
420 q = s * k / m: j = v + g * s + z * (-q - q * q / 2 - q ^ 3 / 3 - q ^ 4 / 4 - q ^ 5 / 5)
430 i = a - g * s * s / 2 - v * s + z * s * (q / 2 + q ^ 2 / 6 + q ^ 3 / 12 + q ^ 4 / 20 + q ^ 5 / 30): RETURN
440 PRINT : PRINT : PRINT : INPUT "Try again"; a$: IF LCASE$(a$) = "yes" THEN GOTO 60

