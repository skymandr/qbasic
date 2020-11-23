SCREEN 12
x = 40
y = 100
hit = 100
DO
RANDOMIZE TIMER
a$ = INKEY$
LINE (x, y)-(x, y + 9), 0
LINE (x, y)-(x + 5, y + 6), 0
LINE (x, y)-(x - 5, y + 6), 0
LINE (x, y + 9)-(x + 5, y + 19), 0
LINE (x, y + 9)-(x - 5, y + 19), 0
CIRCLE (x, y - 2), 2, 0
IF a$ = CHR$(0) + "K" THEN x = x - 3: dir = 1
IF a$ = CHR$(0) + "P" THEN hopp = 0: hp = 0
IF a$ = CHR$(0) + "M" THEN x = x + 3: dir = 2
IF a$ = " " AND POINT(x, y + 20) > 0 THEN hopp = 1
IF a$ = CHR$(9) THEN
IF tmol > 0 THEN sdir = dir: sx = x: sy = y
END IF
IF POINT(x, y + 20) < 1 AND hopp = 0 THEN y = y + 3
LINE (0, 120)-(220, 125), 6, BF
LINE (320, 130)-(600, 135), 6, BF
IF hopp = 1 THEN
hp = hp + 1
IF hp = 25 THEN hopp = 0: hp = 0
y = y - 1.5
END IF
LINE (x, y)-(x, y + 9)
LINE (x, y)-(x + 5, y + 6)
LINE (x, y)-(x - 5, y + 6)
LINE (x, y + 9)-(x + 5, y + 19)
LINE (x, y + 9)-(x - 5, y + 19)
CIRCLE (x, y - 2), 2
'SNREN
LOCATE 1, 1
PRINT "Hmm I wonder what those plants down there are..."
LINE (INT(RND * 640), INT(RND * 480) + 430)-(INT(RND * 640), INT(RND * 480) + 430), INT(RND * 15)
LINE (INT(RND * 640), INT(RND * 480) + 430)-(INT(RND * 640), INT(RND * 480) + 430), INT(RND * 15)
LINE (INT(RND * 640), INT(RND * 480) + 430)-(INT(RND * 640), INT(RND * 480) + 430), INT(RND * 15)
IF y > 475 THEN END
IF y > 430 THEN hit = hit - 1
PRINT "Hits left:"; hit
PRINT "Mana:"; mana
IF hit = 0 THEN END
LOOP

