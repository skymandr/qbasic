SCREEN 12
CLS
x = 0'Variabel 1 f”r datorns †sikts generering.
y = 0'Variabel 2 f”r datorns †sikts generering.
t1% = 0'Variabel f”r din tillf„lliga †sikt(1/2)
t2% = 0'Variabel f”r datorns tillf„lliga †sikt(1/2).
n = 0'Variabel f”r antal omg†ngar.
p1 = 0'Variabel f”r din po„ng.
p2 = 0'Variabel f”r datorns po„ng.
o1 = 0'Variabel f”r din medel†sikt.
o2 = 0'Variabel f”r datorns medel†sikt.

DO
RANDOMIZE TIMER
LOCATE 1, 1
PRINT "Detta „r en relations simulator."
PRINT "Du har tv† val:"
COLOR 4
PRINT "1. Samarbeta"
COLOR 1
PRINT "2. Utnyttja"
COLOR 15
PRINT "Beroende p† vad du och din"
PRINT "motspelare g”r f†r ni olika po„ng."

n = n + 1

COLOR 0
LOCATE 1, 69
PRINT "SkyMan42"
LOCATE 3, 69
PRINT "SkyMan42"
COLOR 15

LOCATE 1, 42
PRINT "Din po„ng:"; p1
LOCATE 1, 62
PRINT "Medel:"; p1 / n
LOCATE 3, 42
PRINT "Datorns po„ng:"; p2
LOCATE 3, 62
PRINT "Medel:"; p2 / n
LOCATE 5, 62
PRINT "Antal drag:"; n - 1

LINE (330, 19)-(360, 24), 4, BF
LINE (360, 19)-(390, 24), 12, BF
LINE (390, 19)-(420, 24), 15, BF
LINE (420, 19)-(450, 24), 9, BF
LINE (450, 19)-(480, 24), 1, BF
LINE (330, 50)-(360, 55), 4, BF
LINE (360, 50)-(390, 55), 12, BF
LINE (390, 50)-(420, 55), 15, BF
LINE (420, 50)-(450, 55), 9, BF
LINE (450, 50)-(480, 55), 1, BF

LINE (330, 25)-(480, 25), 8
LINE (330, 18)-(480, 18), 8
LINE (481, 18)-(481, 25), 8
LINE (329, 18)-(329, 25), 8
LINE (405 + (o1 / n) * 75, 24)-(405 + (o1 / n) * 75, 19), 7
LINE (330, 56)-(480, 56), 8
LINE (330, 49)-(480, 49), 8
LINE (481, 56)-(481, 49), 8
LINE (329, 56)-(329, 49), 8
LINE (405 + (o2 / n) * 75, 55)-(405 + (o2 / n) * 75, 50), 7

1 COLOR 0
LOCATE 8, 18
PRINT "SkyManSkyManSkyManSkyManSkyManSkyManSkyMan"
COLOR 15
LOCATE 8, 1
INPUT "Vad vill du g”ra"; t1%
ON ERROR GOTO 1
LINE (0, 130)-(640, 480), 0, BF
IF t1% < 1 OR t1% > 2 THEN GOTO 1

x = RND * 5
y = RND * 5 - (o1 / n)

IF x < y THEN
o2 = o2 - 1
t2% = 1
ELSE
o2 = o2 + 1
t2% = 2
END IF

IF t1% = 1 THEN o1 = o1 - 1 ELSE IF t1% = 2 THEN o1 = o1 + 1

IF t1% = 1 AND t2% = 1 THEN p1 = p1 + 3: p2 = p2 + 3
IF t1% = 2 AND t2% = 2 THEN p1 = p1 + 1: p2 = p2 + 1
IF t1% = 2 AND t2% = 1 THEN p1 = p1 + 5
IF t1% = 1 AND t2% = 2 THEN p2 = p2 + 5

LOOP

