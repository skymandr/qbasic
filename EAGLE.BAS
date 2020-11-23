CLS
SCREEN 12
10 PRINT TAB(38); "EAGLE"
20 PRINT : PRINT : PRINT
30 PRINT "Planetary Lander"
80 PRINT "________________"
100 INPUT "Do you need instructions"; a$
110 PRINT
160 IF LCASE$(a$) = "no" THEN 390
200 PRINT "You are 500 meters above a good landing site on the moon and are just about to  land the shuttle manually."
220 PRINT "Your current speed is 20mps down and you have  120 remaining fuel units."
225 PRINT
230 PRINT "Here are the facts that you need to know befor descent:"
240 PRINT "(1) After each second height, velocity and remaining fuel is displayed."
250 PRINT "After that you will enter the number of fuel units you wish to use in the next  second."
260 PRINT "Each fuel unit slows you down with .3mps."
300 PRINT "(3) Maximum thrust per second is 10mps, or 30 fuel units."
330 PRINT "(4) When you reach the surface of the moon your thrusters are automaticlly shut of and your number landing velocity and remaining fuel units will be displayed."
340 PRINT "(5) If you run out of fuel you are no longer asked to enter thrust but you will get the second reports until you are on the surface.": PRINT
360 PRINT "  /Ä\  EAGLE Lander": PRINT " ³ O ³ Weight: 32500kg": PRINT " ÀÂÂÂÙ Fuel capacity: 16000kg": PRINT " / I \": PRINT "Á  Á  Á"
380 LINE INPUT "Press enter...", k$
390 PRINT "Landing sequence engaged...": PRINT
400 PRINT "G o o d  l u c k ! "

Game:
420 PRINT : PRINT
430 PRINT "SEC: METERS: VEL:   FUEL:      DISTANCE:"
450 PRINT
455 t = 0: h = 500: v = 50: f = 120
490 PRINT t; TAB(5); h; TAB(13); v; TAB(20); f; TAB(32); "Ý"; TAB(h / 12 + 35); "(>"
495 IF h <= 0 THEN GOTO 760
500 INPUT b
510 IF b < 0 THEN 650
520 IF b > 30 THEN b = 30
530 IF b > f THEN b = f
540 v1 = v - b + 5
560 f = f - b
570 h = h - .5 * (v + v1)
580 IF h < 0 THEN 670
590 t = t + 1
600 v = v1
610 IF f > 0 THEN 490
615 IF b = 0 THEN 640
620 PRINT "**** OUT OF FUEL ****"
640 PRINT t; TAB(5); h; TAB(13); v; TAB(20); f; TAB(32); "Ý"; TAB(h / 12 + 35); "(>"
650 PRINT : b = 0
660 GOTO 540
670 PRINT "**** GROUND ZERO ****"
680 h = h + .5 * (v + v1)
690 IF b = 5 THEN 720
700 d = (-v + SQR(v * v + h * (10 - 2 * b))) / (5 - b)
710 GOTO 730
720 d = h / v
730 v = v + (5 - b) * d
760 PRINT "The EAGLE has landed after"; t + d; "seconds."
770 PRINT "Velocity at landing: "; v1; "mps."
780 PRINT f; "remaining fuel units."
790 IF v <> 0 THEN 810
800 PRINT "A perfect landing, NASA should have more astronauts like you!": GOTO 840
810 IF ABS(v1) < 2 THEN PRINT "Good work!": GOTO 840
815 IF ABS(v1) < 3 THEN PRINT "Computer reports shuttle damages. You will have to wait until a rescue team     arrives.": GOTO 840
820 PRINT "**** YOU FAILED ****"
840 PRINT : PRINT : PRINT
850 INPUT "Do you wish to fly another mission"; a$
860 IF LCASE$(a$) = "yes" THEN GOTO 390
880 PRINT : PRINT : PRINT : PRINT
900 PRINT "**** MISSION CONTROL TERMINATED ****": SLEEP

