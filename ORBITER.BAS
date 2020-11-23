DECLARE SUB Options ()
DECLARE SUB Info ()
DECLARE SUB Orbit ()
DECLARE SUB Menu ()
DECLARE SUB NewOOTW ()
DECLARE SUB NewAOTW ()
DECLARE SUB Ctrl ()
DIM SHARED Xspeed
DIM SHARED Yspeed
DIM SHARED a$
DIM SHARED dir
DIM SHARED Hi
DIM SHARED mass
DIM SHARED sx
DIM SHARED sy
DIM SHARED TM
DIM SHARED HOFR
SCREEN 13
FOR i = 16 TO 31
COLOR i
LOCATE 10, 1
PRINT SPC(15); "⁄ƒƒø⁄¬ø⁄ƒø"
PRINT SPC(15); "≥≥≥≥≥ ≥≥ ¥"
PRINT SPC(15); "≥≥≥≥≥≥≥√ ≥"
PRINT SPC(15); "¿¡¡Ÿ¿¡Ÿ¿ƒŸ"
FOR d = 1 TO 45
NEXT
NEXT
FOR d = 1 TO 4555
NEXT
CLS
LOCATE 11, 1
PRINT "Along time ago, at a distant star named"
PRINT "Catar, a planet, also named Catar, was  orbiting"
FOR d = 1 TO 9999
NEXT
CLS
LOCATE 11, 1
PRINT " In the year of 3065at the first manned"
PRINT "spacecraft was launched by the Catarians"
FOR d = 1 TO 9999
NEXT
CLS
LOCATE 11, 1
PRINT " At that moment nobody could even guess"
PRINT "   what conseqences this would have..."
FOR d = 1 TO 9999
NEXT
CLS
LOCATE 11, 16
PRINT "WELCOME TO"
FOR d = 1 TO 4555
NEXT
CLS
CALL Menu

SUB Ctrl
IF a$ = CHR$(0) + "K" THEN
dir = dir - 1
ELSEIF a$ = CHR$(0) + "M" THEN dir = dir + 1
END IF
IF dir < 1 THEN dir = 8
IF dir > 8 THEN dir = 1
IF a$ = CHR$(0) + "H" THEN
        IF dir = 1 THEN
        Yspeed = Yspeed - 1
        ELSEIF dir = 2 THEN Xspeed = Xspeed + 1: Yspeed = Yspeed - 1
        ELSEIF dir = 3 THEN Xspeed = Xspeed + 1
        ELSEIF dir = 4 THEN Xspeed = Xspeed + 1: Yspeed = Yspeed + 1
        ELSEIF dir = 5 THEN Yspeed = Yspeed + 1
        ELSEIF dir = 6 THEN Xspeed = Xspeed - 1: Yspeed = Yspeed + 1
        ELSEIF dir = 7 THEN Xspeed = Xspeed - 1
        ELSEIF dir = 8 THEN Xspeed = Xspeed - 1: Yspeed = Yspeed - 1
        END IF
END IF
END SUB

SUB HOF
CLS
DO
CLS
a$ = INKEY$
LOCATE 1
PRINT SPC(13); "Hall of fame"
OPEN "HIFLY.HOF" FOR INPUT AS #1
'INPUT #1, Name$, Tim$, Dat$, n$
DO
a$ = INKEY$
LINE (130, 30)-(190, 150), , B
CIRCLE (160, 65), 20
IF a$ = CHR$(27) THEN GOTO 7
LOOP UNTIL a$ <> ""
LOOP UNTIL EOF(1)
7 CLOSE #1
END SUB

SUB Info
CLS
PRINT "             Orbiter History"
PRINT "The first manned spacecraft was launchedin the year of 3065."
PRINT "Since there are no other planets in the Catar system, the catarians didn't know what to do with their new discovery."
PRINT "In an interview with the first Orbiter, Darin Faidrin, son of Assal Faidrin, thechief constructor at New Age Spacecraft,when he aswered the question how it was like up in space he said:"
PRINT "-It was like nothing i have been throughbefore! It was all truly Amazing!"
PRINT "-Would you like to go upp there again?"
PRINT "-Definatly!"
PRINT "Like this the Orbiting was born. This isprobably the most dangerous sport of    them all, but yet also the bigest."
SLEEP
PRINT "In this game you are in control of a UN-CSO, or United Nations of Catar StandardOrbiter."
PRINT "Will you break the record and stay in   orbit for longer time than anyone beforeyou?"
PRINT "Only time can tell."
SLEEP
CLS
PRINT "Here follows some information about some           of the spacecrafts"
SLEEP
CLS
CIRCLE (160, 100), 30
CIRCLE (160, 90), 9
LINE (150, 65)-(150, 125)
LINE -(115, 110)
LINE -(150, 65)
LINE (170, 65)-(170, 125)
LINE -(205, 110)
LINE -(170, 65)
LINE (160, 110)-(160, 120)
PRINT "The UNCSO spacecraft"
PRINT "The standard spacecraft of Catar."
PRINT "Created in 3071 by Assal Faidrin,"
PRINT "the father of modern spacecrafts."
SLEEP
CLS
CIRCLE (160, 100), 30
CIRCLE (160, 90), 9
LINE (150, 100)-(110, 150), , B
LINE (170, 100)-(210, 150), , B
PRINT "ORBITER 1"
PRINT "The original spacecraft."
PRINT "Created in 3065 by Assal Faidrin,"
PRINT "the father of modern spacecrafts."
LOCATE 18, 16
PRINT "O1"
LOCATE 18, 24
PRINT "O1"
SLEEP
CALL Menu
END SUB

SUB Menu
SCREEN 13
CLS
LOCATE 2
PRINT "     ⁄ƒƒø⁄ƒƒø⁄ƒƒø⁄ƒø⁄ƒƒƒø⁄ƒƒø⁄ƒƒø"
PRINT "     ≥ ≥≥≥  ¥≥ ƒ≥≥ ≥¿ƒø⁄Ÿ≥ ƒ¥≥ ≥≥"
PRINT "     ≥ ≥≥≥ ≥≥≥ ƒ≥≥ ≥  ≥≥ ≥ ƒ¥≥  ¥"
PRINT "     ≥ ≥≥¿ƒ¡Ÿ¿ƒƒŸ¿ƒŸ  ¿Ÿ ¿ƒƒŸ≥ ≥≥"
PRINT "     ¿ƒƒŸ     By Andy Sky    ¿ƒ¡Ÿ"
PRINT
PRINT "               ( )Play           "
PRINT "               ( )Options        "
PRINT "               ( )Story          "
PRINT "               ( )Hall of Fame   "
PRINT "               ( )MHS            "
PRINT "               ( )Exit           "
y = 1
DO
a$ = INKEY$
LOCATE y + 7, 17
IF a$ = CHR$(0) + "P" THEN y = y + 1: PRINT " "
IF a$ = CHR$(0) + "H" THEN y = y - 1: PRINT " "
IF y > 6 THEN y = 1
IF y < 1 THEN y = 6
LOCATE y + 7, 17
PRINT "*"
IF a$ = CHR$(13) THEN
        IF y = 1 THEN CALL Orbit
        IF y = 2 THEN CALL Options
        IF y = 3 THEN CALL Info
        'IF y = 4 THEN CALL HOF
        'IF y =5  THEN CALL MHS
        IF y = 6 THEN SYSTEM: END
END IF
LOOP
END SUB

SUB MHS
PRINT SPC(15); "⁄ƒƒø⁄¬ø⁄ƒø"
PRINT SPC(15); "≥≥≥≥≥ ≥≥ ¥"
PRINT SPC(15); "≥≥≥≥≥≥≥√ ≥"
PRINT SPC(15); "¿¡¡Ÿ¿¡Ÿ¿ƒŸ"
END SUB

SUB NewOOTW
INPUT "Enter your name: ", NHOF$
PRINT NOHF$; ", you've got a place in the Hall of Fame!"
OPEN "HIFLY.HOF" FOR APPEND AS #1
PRINT #1, NHOF$, TIME$, DATE$, CHR$(13)
CLOSE #1
6 CLS
x = sx
y = sy
dir = INT(RND * 8) + 1
IF dir = 1 THEN
Yspeed = -RND * mass / 3
ELSEIF dir = 2 THEN Yspeed = -RND * mass / 3: Xspeed = RND * mass / 3
ELSEIF dir = 3 THEN Xspeed = RND * mass / 3
ELSEIF dir = 4 THEN Xspeed = RND * mass / 3: Yspeed = RND * mass / 3
ELSEIF dir = 5 THEN Yspeed = RND * mass / 3
ELSEIF dir = 6 THEN Yspeed = RND * mass / 3: Xspeed = -RND * mass / 3
ELSEIF dir = 7 THEN Xspeed = -RND * mass / 3
ELSEIF dir = 8 THEN Xspeed = -RND * mass / 3: Yspeed = -RND * mass / 3
END IF
d = RND * 3 + 1
Tim = TIMER
DO
a$ = INKEY$
LOCATE 2, 30
COLOR INT(RND * 16)
PRINT "New High:"; Hi
CIRCLE (x, y), 1, 0
IF x < 320 THEN
Xspeed = Xspeed + mass / 100
ELSEIF x > 320 THEN Xspeed = Xspeed - mass / 100
END IF
IF y < 240 THEN
Yspeed = Yspeed + mass / 100
ELSEIF y > 240 THEN Yspeed = Yspeed - mass / 100
END IF
x = x + Xspeed
y = y + Yspeed
CIRCLE (x, y), 1
CIRCLE (320, 240), mass, 3
PAINT (320, 240), 3
IF TIMER - Tim >= d THEN EXIT DO
IF a$ = CHR$(27) THEN GOTO 8
LOOP
FOR z = 1 TO 16
CIRCLE (x, y), z, INT(RND * 15) + 1
SOUND z + 740, .1
NEXT
FOR z = 16 TO 1 STEP -1
CIRCLE (x, y), z, 0
NEXT
GOTO 6
8 END SUB

SUB Options
CLS
LOCATE 2
PRINT "     ⁄ƒƒø⁄ƒø⁄ƒƒƒø⁄ƒø⁄ƒƒø⁄ƒ¬ø⁄ƒƒø"
PRINT "     ≥ ≥≥≥≥≥¿ƒø⁄Ÿ≥ ≥≥ ≥≥≥≥≥≥≥ ƒ¥"
PRINT "     ≥ ≥≥≥⁄Ÿ  ≥≥ ≥ ≥≥ ≥≥≥≥≥≥≥  ≥"
PRINT "     ≥ ≥≥¿Ÿ   ¿Ÿ ¿ƒŸ¿ƒƒŸ¿¡ƒŸ√ƒ ≥"
PRINT "     ¿ƒƒŸ  Push ESC to Exit ¿ƒƒŸ"
PRINT
PRINT "         ( )Reset Highscore     "
PRINT "         ( )Reset Hall of Fame  "
PRINT "         ( )Target mode         "
y = 1
DO
a$ = INKEY$
LOCATE y + 7, 11
IF a$ = CHR$(0) + "P" THEN y = y + 1: PRINT " "
IF a$ = CHR$(0) + "H" THEN y = y - 1: PRINT " "
IF y > 3 THEN y = 1
IF y < 1 THEN y = 3
LOCATE y + 7, 11
PRINT "*"
IF a$ = CHR$(27) THEN CALL Menu
IF a$ = CHR$(13) THEN
        IF y = 1 THEN
        OPEN "HIFLY.ORB" FOR OUTPUT AS #1
        PRINT #1, 100
        CLOSE #1
        END IF
        IF y = 2 THEN
        HOFR = 1
        OPEN "HIFLY.HOF" FOR OUTPUT AS #1
        CLOSE #1
        END IF
        IF y = 3 THEN TM = TM + 1
END IF
IF TM > 1 THEN TM = 0
IF TM = 1 THEN LOCATE 10, 25: PRINT "ON "
IF TM = 0 THEN LOCATE 10, 25: PRINT "OFF"
LOOP
END SUB

SUB Orbit
1 OPEN "HIFLY.ORB" FOR INPUT AS #1
INPUT #1, Hi
CLOSE #1
SCREEN 12
CLS
9 INPUT "Enter mass of the planet: ", mass
IF mass < 12 THEN GOTO 9
5 INPUT "Messurers(Y/N)"; mezz$
IF NOT UCASE$(mezz$) = "Y" AND NOT UCASE$(mezz$) = "N" THEN GOTO 5
IF UCASE$(mezz$) = "P" THEN matare = 8 ELSE matare = 1
CLS
RANDOMIZE TIMER
2 y = RND * 480 + 1
IF y < 240 + mass AND y > 240 - mass THEN GOTO 2
3 x = RND * 640 + 1
IF x < 320 + mass AND x > 320 - mass THEN GOTO 3
dir = INT(RND * 8) + 1
Xspeed = 0
Yspeed = 0
Tim = TIMER
DO
a$ = INKEY$
LOCATE 1, 1
IF UCASE$(mezz$) = "N" THEN GOTO 4
PRINT "Curpos x:"; x; "         "
PRINT "Curpos y:"; y; "         "
PRINT "Xspeed:"; Xspeed; "      "
PRINT "Yspeed:"; Yspeed; "      "
PRINT "Planetmass:"; mass
4 PRINT "Time:"; INT(TIMER - Tim)
PRINT "Highscore:"; Hi
LINE (632, 2)-(638, 8), 0, BF
CALL Ctrl
CIRCLE (635, 5), 1
IF dir = 1 THEN
LINE (635, 5)-(635, 1)
ELSEIF dir = 2 THEN LINE (635, 5)-(639, 1)
ELSEIF dir = 3 THEN LINE (635, 5)-(639, 5)
ELSEIF dir = 4 THEN LINE (635, 5)-(639, 9)
ELSEIF dir = 5 THEN LINE (635, 5)-(635, 9)
ELSEIF dir = 6 THEN LINE (635, 5)-(631, 9)
ELSEIF dir = 7 THEN LINE (635, 5)-(631, 5)
ELSEIF dir = 8 THEN LINE (635, 5)-(631, 1)
END IF
CIRCLE (x, y), 2, 0
IF x < 320 THEN
Xspeed = Xspeed + mass / 100
ELSEIF x > 320 THEN Xspeed = Xspeed - mass / 100
END IF
IF y < 240 THEN
Yspeed = Yspeed + mass / 100
ELSEIF y > 240 THEN Yspeed = Yspeed - mass / 100
END IF
x = x + Xspeed
y = y + Yspeed
IF POINT(x, y) = 3 THEN EXIT DO
IF x < -1000 OR x > 1640 OR y < -1000 OR y > 1480 THEN EXIT DO
CIRCLE (x, y), 2
CIRCLE (320, 240), mass, 3
PAINT (320, 240), 3
LOOP
FOR xp = 1 TO 16
CIRCLE (x, y), xp, RND * xp
SOUND RND * xp + 40, .2
NEXT
FOR xp = 16 TO 1 STEP -1
CIRCLE (x, y), xp, 0
NEXT
Poang% = (TIMER - Tim) * mass / matare
IF INT(TIMER - Tim) < 3 THEN Poang% = 0
PRINT "Points: "; Poang%
SLEEP
IF Hi < Poang% THEN
OPEN "HIFLY.ORB" FOR OUTPUT AS #1
PRINT #1, Poang%
Hi = Poang%
sx = x
sy = y
CLOSE #1
CALL NewOOTW
END IF
CALL Menu
END SUB

