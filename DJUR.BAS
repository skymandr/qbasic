COLOR 2, 6
CLS
SHELL "c:\andreas\stuff.com"
'Right(2): Stand(229):å Walk1(230):æ Walk2(231):ç
'Left(4):  Stand(232):è Walk1(233):é Walk2(234):ê
'Up(1):    Stand(235):ë Walk1(236):ì Walk2(237):í
'Down(3):  Stand(238):î Walk1(239):ï Walk2(240):ð       
sr$ = "å"
wr1$ = "æ"
wr2$ = "ç"

sl$ = "è"
wl1$ = "é"
wlr2$ = "ê"

su$ = "ë"
wu1$ = "ì"
wu2$ = "í"

sd$ = "î"
wd1$ = "ï"
wd2$ = "ð"

x = 42
y = 21
dir = 1

DO
a$ = ""
a$ = INKEY$
LOCATE y, x
GOSUB Rita
GOSUB Flytta
LOOP
Rita:
IF dir = 1 AND w = 0 THEN PRINT su$
IF dir = 1 AND w = 1 THEN PRINT wu1$
IF dir = 1 AND w = 2 THEN PRINT wu2$

IF dir = 2 AND w = 0 THEN PRINT sr$
IF dir = 2 AND w = 1 THEN PRINT wr1$
IF dir = 2 AND w = 2 THEN PRINT wr2$

IF dir = 3 AND w = 0 THEN PRINT sd$
IF dir = 3 AND w = 1 THEN PRINT wd1$
IF dir = 3 AND w = 2 THEN PRINT wd2$

IF dir = 4 AND w = 0 THEN PRINT sl$
IF dir = 4 AND w = 1 THEN PRINT wl1$
IF dir = 4 AND w = 2 THEN PRINT wl2$
RETURN

Flytta:
COLOR 6
IF a$ = CHR$(0) + "H" THEN
        LOCATE y, x
        PRINT "Û"
        dir = 1
        y = y - 1
        IF w = 0 THEN w = 1
        IF w = 1 THEN w = 2
        IF w = 2 THEN w = 1
END IF
IF a$ = CHR$(0) + "M" THEN
        LOCATE y, x
        PRINT "Û"
        dir = 2
        x = x + 1
        IF w = 0 THEN w = 1
        IF w = 1 THEN w = 2
        IF w = 2 THEN w = 1
END IF
IF a$ = CHR$(0) + "P" THEN
        LOCATE y, x
        PRINT "Û"
        dir = 3
        y = y + 1
        IF w = 0 THEN w = 1
        IF w = 1 THEN w = 2
        IF w = 2 THEN w = 1
END IF
IF a$ = CHR$(0) + "K" THEN
        LOCATE y, x
        PRINT "Û"
        dir = 4
        x = x - 1
        IF w = 0 THEN w = 1
        IF w = 1 THEN w = 2
        IF w = 2 THEN w = 1
END IF
IF a$ = "" THEN w = 0
COLOR 2
RETURN

