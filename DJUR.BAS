COLOR 2, 6
CLS
SHELL "c:\andreas\stuff.com"
'Right(2): Stand(229):� Walk1(230):� Walk2(231):�
'Left(4):  Stand(232):� Walk1(233):� Walk2(234):�
'Up(1):    Stand(235):� Walk1(236):� Walk2(237):�
'Down(3):  Stand(238):� Walk1(239):� Walk2(240):�       
sr$ = "�"
wr1$ = "�"
wr2$ = "�"

sl$ = "�"
wl1$ = "�"
wlr2$ = "�"

su$ = "�"
wu1$ = "�"
wu2$ = "�"

sd$ = "�"
wd1$ = "�"
wd2$ = "�"

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
        PRINT "�"
        dir = 1
        y = y - 1
        IF w = 0 THEN w = 1
        IF w = 1 THEN w = 2
        IF w = 2 THEN w = 1
END IF
IF a$ = CHR$(0) + "M" THEN
        LOCATE y, x
        PRINT "�"
        dir = 2
        x = x + 1
        IF w = 0 THEN w = 1
        IF w = 1 THEN w = 2
        IF w = 2 THEN w = 1
END IF
IF a$ = CHR$(0) + "P" THEN
        LOCATE y, x
        PRINT "�"
        dir = 3
        y = y + 1
        IF w = 0 THEN w = 1
        IF w = 1 THEN w = 2
        IF w = 2 THEN w = 1
END IF
IF a$ = CHR$(0) + "K" THEN
        LOCATE y, x
        PRINT "�"
        dir = 4
        x = x - 1
        IF w = 0 THEN w = 1
        IF w = 1 THEN w = 2
        IF w = 2 THEN w = 1
END IF
IF a$ = "" THEN w = 0
COLOR 2
RETURN

