1 CLS
PRINT SPC(31); "Welcome to..."
SLEEP
PRINT SPC(33); "Star Wars"
PLAY "MB L64 c9 c9 c9 c2 g2 f9 e9 d9 o5 c2 o4 g4 f9 e9 d9 o5 c2 o4 g4 f9 e9 f9 d2"
INPUT "How Many Tie Fighters(Min = 3)"; b%
IF b% < 3 THEN b% = 3
x = 320
y = 240
dir = 4
speed = 3
z = 400
c = 400
dsx = 400
dsy = 400
kills = 0
shield = 3
CLS
SCREEN 12
DO
RANDOMIZE TIMER
a$ = INKEY$

'Skeppet
IF a$ = CHR$(0) + "K" THEN dir = dir - 1
IF a$ = CHR$(0) + "M" THEN dir = dir + 1
IF a$ = CHR$(0) + "H" THEN speed = speed + 1
IF a$ = CHR$(0) + "P" THEN speed = speed - 1
IF a$ = " " THEN
PSET (sx, sy), 0
SOUND 1000, 2
sspeed = speed + 5
sdir = dir
sx = x
sy = y
PSET (sx, sy)
END IF
IF sdir = 4 THEN
PSET (sx, sy), 0
sy = sy - sspeed
PSET (sx, sy)
END IF
IF sdir = 3 THEN
PSET (sx, sy), 0
sx = sx - sspeed
PSET (sx, sy)
END IF
IF sdir = 2 THEN
PSET (sx, sy), 0
sy = sy + sspeed
PSET (sx, sy)
END IF
IF sdir = 1 THEN
PSET (sx, sy), 0
sx = sx + sspeed
PSET (sx, sy)
END IF
IF speed < 1 THEN speed = 1
IF speed > 10 THEN speed = 10
IF dir > 4 THEN dir = 1
IF dir < 1 THEN dir = 4
LINE (x - 10, y - 10)-(x + 10, y + 10), 0, BF
IF dir = 4 THEN y = y - speed
IF dir = 3 THEN x = x - speed
IF dir = 2 THEN y = y + speed
IF dir = 1 THEN x = x + speed
IF x > 640 THEN x = 0
IF x < 0 THEN x = 640
IF y > 480 THEN y = 0
IF y < 0 THEN y = 480
SELECT CASE dir
CASE 4
LINE (x, y)-(x + 5, y + 10)
LINE (x, y)-(x - 5, y + 10)
CASE 3
LINE (x, y)-(x + 10, y - 5)
LINE (x, y)-(x + 10, y + 5)
CASE 2
LINE (x, y)-(x + 5, y - 10)
LINE (x, y)-(x - 5, y - 10)
CASE 1
LINE (x, y)-(x - 10, y - 5)
LINE (x, y)-(x - 10, y + 5)
END SELECT

'M„tare
LOCATE 1, 1
PRINT "Speed:"; speed
PRINT "Kills:"; kills
PRINT "Left:"; b% - kills
PRINT "Shield:"; shield
IF shield < 1 THEN
PRINT SPC(30); "You are space dust!"
SLEEP
PRINT SPC(35); "Game Over"
2 INPUT "Do You Want To Play Again"; a$
IF a$ = "y" OR a$ = "Y" THEN GOTO 1
PRINT "Thanks for playing StarWars 1.0! I hope you enjoyed it!"
SLEEP
STOP
END IF
IF kills = b% + 1 THEN
PRINT SPC(33); "You Made It!!!"
GOTO 2
END IF

'Fiender
IF lr > 0 THEN
lr = lr + 1
IF lr = 100 THEN lr = 0
GOTO 6
END IF
IF x > dsx - 40 AND x < dsx + 40 AND y > dsy - 40 AND y < dsy + 40 THEN
LINE (dsx, dsy - 10)-(x, y), 2
FOR mxp = 1 TO 15
CIRCLE (x - INT(RND * 7.5) + 1, y + INT(RND * 7.5) + 1), INT(RND * 7) + 1
SOUND INT(RND * 350) + 37, 2
NEXT
shield = shield - 3
IF shield < 1 THEN
PRINT "You were burned to dust by the devestating laser of the DeathStar"
GOTO 2
END IF
lr = 1
END IF
6 IF kills < b% THEN GOTO 4
IF liv = 0 THEN
CIRCLE (z, c), 0
shield = 5
dsh = 5
liv = 1
END IF
IF dsx > x THEN
CIRCLE (dsx, dsy), 20, 0
CIRCLE (dsx, dsy - 10), 7, 0
PSET (dsx, dsy - 10), 0
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 0
dsx = dsx - 1
CIRCLE (dsx, dsy), 20, 7
CIRCLE (dsx, dsy - 10), 7, 8
PSET (dsx, dsy - 10), 8
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 8
END IF
IF dsx < x THEN
CIRCLE (dsx, dsy), 20, 0
CIRCLE (dsx, dsy - 10), 7, 0
PSET (dsx, dsy - 10), 0
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 0
dsx = dsx + 1
CIRCLE (dsx, dsy), 20, 7
CIRCLE (dsx, dsy - 10), 7, 8
PSET (dsx, dsy - 10), 8
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 8
END IF
IF dsy > y THEN
CIRCLE (dsx, dsy), 20, 0
CIRCLE (dsx, dsy - 10), 7, 0
PSET (dsx, dsy - 10), 0
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 0
dsy = dsy - 1
CIRCLE (dsx, dsy), 20, 7
CIRCLE (dsx, dsy - 10), 7, 8
PSET (dsx, dsy - 10), 8
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 8
END IF
IF dsy < y THEN
CIRCLE (dsx, dsy), 20, 0
CIRCLE (dsx, dsy - 10), 7, 0
PSET (dsx, dsy - 10), 0
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 0
dsy = dsy + 1
CIRCLE (dsx, dsy), 20, 7
CIRCLE (dsx, dsy - 10), 7, 8
PSET (dsx, dsy - 10), 8
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 8
END IF
IF sx > dsx - 20 AND sx < dsx + 20 AND sy > dsy - 20 AND sy < dsy + 20 THEN
PSET (sx, sy), 0
sx = -9
sy = -9
sdir = 0
dsh = dsh - 1
IF dsh = 0 THEN kills = kills + 1
END IF
4 IF kills = b% THEN GOTO 5
CIRCLE (z, c), 5, 0
IF speed > 5 THEN
espeed = 7
ELSE
espeed = 5
END IF
IF z > x THEN
z = z - espeed
edir = 3
END IF
IF z < x THEN
z = z + espeed
edir = 1
END IF
IF c > y THEN
c = c - espeed
edir = 4
END IF
IF c < y THEN
c = c + espeed
edir = 2
END IF
IF esx > 640 THEN
esdir = 0
esx = -9
esy = -9
END IF
IF esx < 0 THEN
esdir = 0
esx = -9
esy = -9
END IF
IF esy > 480 THEN
esdir = 0
esx = -9
esy = -9
END IF
IF esy < 0 THEN
esdir = 0
esx = -9
esy = -9
END IF
IF esx > x - 7.5 AND esx < x + 7.5 THEN GOTO 3
IF esy > y - 7.5 AND esy < y + 7.5 THEN GOTO 3
IF z > x - 9 AND z < x + 9 AND c > y THEN
SOUND 753, 2
esspeed = espeed + 6
PSET (esx, esy), 0
esx = z
esy = c
esdir = 4
END IF
IF z > x - 9 AND z < x + 9 AND c < y THEN
SOUND 753, 2
esspeed = espeed + 6
PSET (esx, esy), 0
esx = z
esy = c
esdir = 2
END IF
IF c > y - 9 AND c < y + 9 AND z > x THEN
SOUND 753, 2
esspeed = espeed + 6
PSET (esx, esy), 0
esx = z
esy = c
esdir = 3
END IF
IF c > y - 9 AND c < y + 9 AND z < x THEN
SOUND 753, 2
PSET (esx, esy), 0
esspeed = espeed + 6
PSET (esx, esy), 0
esx = z
esy = c
esdir = 1
END IF
3 IF esdir = 4 THEN
PSET (esx, esy), 0
esy = esy - esspeed
PSET (esx, esy)
END IF
IF esdir = 3 THEN
PSET (esx, esy), 0
esx = esx - esspeed
PSET (esx, esy)
END IF
IF esdir = 2 THEN
PSET (esx, esy), 0
esy = esy + esspeed
PSET (esx, esy)
END IF
IF esdir = 1 THEN
PSET (esx, esy), 0
esx = esx + esspeed
PSET (esx, esy)
END IF
IF sx > z - 7.5 AND sx < z + 7.5 AND sy > c - 7.5 AND sy < c + 7.5 THEN
kills = kills + 1
PSET (sx, sy), 0
PSET (esx, esy), 0
esx = -9
esy = -9
esdir = 0
sx = -9
sy = -9
sdir = 0
z = dsx
c = dsy
END IF
IF esx > x - 7 AND esx < x + 7 AND esy > y - 7 AND esy < y + 7 THEN
FOR xplsn = 1 TO 10
CIRCLE (x - INT(RND * 7.5) + 1, y + INT(RND * 7.5) - 1), INT(RND * 6) + 1
SOUND INT(RND * 345) + 37, 1
NEXT
shield = shield - 1
PSET (esx, esy), 0
esx = -9
esy = -9
esdir = 0
END IF
CIRCLE (z, c), 5, 7
IF x > z - 9 AND x < z + 9 AND y > c - 9 AND y < c + 9 THEN
CIRCLE (z, c), 5, 0
z = 400
c = 400
shield = shield - 1
kills = kills + 1
PSET (esx, esy), 0
esx = -9
esy = -9
esdir = 0
5 END IF
CIRCLE (dsx, dsy), 20, 7
CIRCLE (dsx, dsy - 10), 7, 8
PSET (dsx, dsy - 10), 8
LINE (dsx - 20, dsy)-(dsx + 20, dsy), 8
LOOP

