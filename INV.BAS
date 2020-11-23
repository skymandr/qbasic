DECLARE SUB Menu ()
DECLARE SUB Intro ()
SCREEN 13
CALL Intro
CALL Menu

SUB Intro
RANDOMIZE TIMER
WE = 1
SX = 420
FOR X = 16 TO 31
COLOR X
LOCATE 10, 8
PRINT "0UR W0RLD WAS IN PEACE"
FOR D = 0 TO 12000
NEXT
NEXT
SLEEP 4

CLS
FOR X = 16 TO 31
COLOR X
LOCATE 10, 7
PRINT "BUT 0NE DAY THEY ARRIVED"
FOR D = 0 TO 12000
NEXT
NEXT
SLEEP 4

CLS
FOR X = 16 TO 31
COLOR X
LOCATE 10
PRINT "THEY CAME RAGING 0UT 0F THE SKY, LIKE A SWARM 0F LOCUSTS, BRINGING DESTRUCTI0N  T0 THE NATI0NS 0F EARTH"
FOR D = 0 TO 12000
NEXT
NEXT
FOR X = 200 TO -42 STEP -1
LINE (100 + X, 100)-(234 + X, 155), 0, BF
One:
CIRCLE (220 + X, 130), 10, 4
PAINT (220 + X, 130), 4
CIRCLE (212 + X, 120), 4, 4
PAINT (211 + X, 120), 4
CIRCLE (212 + X, 140), 4, 4
PAINT (211 + X, 140), 4
CIRCLE (215 + X, 130), 4, 1
PAINT (215 + X, 130), 1
Two:
CIRCLE (120 + X, 140), 10, 4
PAINT (120 + X, 140), 4
CIRCLE (112 + X, 130), 4, 4
PAINT (111 + X, 130), 4
CIRCLE (112 + X, 150), 4, 4
PAINT (111 + X, 150), 4
CIRCLE (115 + X, 140), 4, 1
PAINT (115 + X, 140), 1
Three:
CIRCLE (180 + X, 120), 10, 4
PAINT (180 + X, 120), 4
CIRCLE (172 + X, 110), 4, 4
PAINT (171 + X, 110), 4
CIRCLE (172 + X, 130), 4, 4
PAINT (171 + X, 130), 4
CIRCLE (175 + X, 120), 4, 1
PAINT (175 + X, 120), 1
NEXT
SLEEP 4

CLS
FOR X = 16 TO 31
COLOR X
LOCATE 10
PRINT "WE F0UGHT BACK BRAVELY, BUT THERE WERE  T0 MANY 0F THEM"
FOR D = 0 TO 12000
NEXT
NEXT
FOR X = 400 TO -42 STEP -1
NMY:
LINE (0, 100)-(330, 200), 0, BF
CIRCLE (X, 130), 10, 4
PAINT (X, 130), 4
CIRCLE (X - 8, 120), 4, 4
PAINT (X - 8, 120), 4
CIRCLE (X - 8, 140), 4, 4
PAINT (X - 8, 140), 4
CIRCLE (X - 5, 130), 4, 1
PAINT (X - 5, 130), 1
IF WE = 0 THEN
CIRCLE (X - 82 + RND * 8, 125 + RND * 8), RND * 8, RND * 4 + 40
SOUND RND * 9 + 42, .1
END IF
WE:
LINE (X - 82, 128)-(X - 70, 123), 7
LINE -(X - 70, 133), 7
LINE -(X - 82, 128), 7
PAINT (X - 75, 128), 7
CIRCLE (X - 78, 128), 2, 1
PAINT (X - 78, 128), 1
IF X = 220 THEN SX = X: SOUND 1200, 1
IF X < 220 THEN
SX = SX - 2
PSET (SX, 133), 12
PSET (SX, 127), 12
END IF
IF SX < X - 70 THEN WE = 0
NEXT
SLEEP 4

CLS
FOR X = 16 TO 31
COLOR X
LOCATE 10
PRINT "WE DIDN'T KN0W WHERE THEY CAME FR0M THENBUT WE KN0W N0W THAT THEY HAVE C0ME FR0MMARS, THE RED PLANET  "
FOR D = 0 TO 12000
NEXT
NEXT
CIRCLE (160, 140), 28, 4
PAINT (160, 140), 4
SLEEP 4

CLS
FOR X = 16 TO 31
COLOR X
LOCATE 10
PRINT "HUMANITIES 0NLY H0PE 0F SURVIVAL LAYS 0NY0UR SH0ULDERS IF Y0U ARE WILLING T0 FLYTHIS MISS0N"
FOR D = 0 TO 12000
NEXT
NEXT
SLEEP 4

CLS
FOR X = 16 TO 31
COLOR X
LOCATE 10
PRINT "N0, D0N'T ANSWER ME YET, FIRST LET ME   SHOW YOU SOME FACTS I'VE GOT"
FOR D = 0 TO 12000
NEXT
NEXT
SLEEP 4
EXIT SUB
END SUB

SUB Menu
CLS
DO
FOR X = 40 TO 44
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN y = y - 1
IF a$ = CHR$(0) + "P" THEN y = y + 1
IF y > 5 THEN y = 1
IF y < 1 THEN y = 5
COLOR X
LOCATE 1, 1
PRINT "ÉÍ¸ÉÍ¸  ÉÍ¸ÉÍ¸ÉÍ¸ÉÍÍÍ¸ÉÍÍÍ¸ÉÍÍÍ¸ÉÍ¸  ÉÍ¸"
PRINT "º ³º ÀÄ¿º ³º ³º ³º Ú·³º ÄÄ´º Ú·³º ÀÄ¿º ³"
PRINT "º ³º Ã·À½ ³Ó·À½ÚÙº À½³ÓÄ· ³º ³º³º Ã·À½ ³"
PRINT "º ³º ³ÓÄ· ³ Ó·ÚÙ º Ú·³ÉÍ¼ ³º À½³º ³ÓÄ· ³"
PRINT "ÓÄÙÓÄÙ  ÓÄÙ  ÓÙ  ÓÄÙÓÙÓÄÄÄÙÓÄÄÄÙÓÄÙ  ÓÄÙ"
PRINT "ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸"
PRINT "ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
PRINT
PRINT "              ( )Play game"
PRINT "              ( )Password"
PRINT "              ( )Facts"
PRINT "              ( )MHS"
PRINT "              ( )Exit"
LOCATE 8 + y, 16
PRINT "é"
FOR D = 1 TO 7000
NEXT
NEXT
FOR X = 44 TO 40 STEP -1
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN y = y - 1
IF a$ = CHR$(0) + "P" THEN y = y + 1
IF y > 5 THEN y = 1
IF y < 1 THEN y = 5
COLOR X
LOCATE 1, 1
PRINT "ÉÍ¸ÉÍ¸  ÉÍ¸ÉÍ¸ÉÍ¸ÉÍÍÍ¸ÉÍÍÍ¸ÉÍÍÍ¸ÉÍ¸  ÉÍ¸"
PRINT "º ³º ÀÄ¿º ³º ³º ³º Ú·³º ÄÄ´º Ú·³º ÀÄ¿º ³"
PRINT "º ³º Ã·À½ ³Ó·À½ÚÙº À½³ÓÄ· ³º ³º³º Ã·À½ ³"
PRINT "º ³º ³ÓÄ· ³ Ó·ÚÙ º Ú·³ÉÍ¼ ³º À½³º ³ÓÄ· ³"
PRINT "ÓÄÙÓÄÙ  ÓÄÙ  ÓÙ  ÓÄÙÓÙÓÄÄÄÙÓÄÄÄÙÓÄÙ  ÓÄÙ"
PRINT "ÉÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ¸"
PRINT "ÓÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÙ"
PRINT
PRINT "              ( )Play game"
PRINT "              ( )Password"
PRINT "              ( )Facts"
PRINT "              ( )MHS"
PRINT "              ( )Exit"
LOCATE 8 + y, 16
PRINT "é"
FOR D = 1 TO 7000
NEXT
NEXT
LOOP
END SUB

