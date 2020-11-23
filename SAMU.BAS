SCREEN 12
LINE (30, 20)-(40, 30), , B
LINE -(30, 40), , B
LINE (33, 27)-(37, 27)
PSET (33, 23)
PSET (37, 23)
LINE (33, 19)-(35, 22)
LINE -(37, 19)
LINE (40, 30)-(59, 30)
LINE (50, 30)-(50, 37)
LINE (30, 30)-(20, 20)
LINE -(11, 20)
LINE (20, 20)-(20, 13)
LINE (30, 40)-(20, 40)
LINE -(20, 50)
LINE -(17, 50)
LINE (40, 40)-(40, 50)
LINE -(30, 57)
LINE -(33, 60)
DIM Marker%(1 TO 5000)
GET (10, 12)-(60, 61), Marker%
CLS
DO
IF x > 14 THEN
x = 1
ELSE
x = x + 1
END IF
COLOR x
LOCATE 1, 1
PRINT SPC(18); "ÜÜ ÜÜ  Ü   Ü Ü Ü   ÜÜ  ÜÜ    Ü  Ü Ü ÜÜ   Ü"
IF x > 14 THEN
x = 1
ELSE
x = x + 1
END IF
COLOR x
PRINT SPC(18); "ßÜ ÛÜÛ ÛßÜßÛ Û Û   Û Û ÛÜÛ   ÛßÜÛ Û ÛßÛ Û Û"
IF x > 14 THEN
x = 1
ELSE
x = x + 1
END IF
COLOR x
PRINT SPC(18); "ßß ß ß ß   ß ßßß   ßß  ß ß   ß  ß ß ßß   ß"
COLOR 14
PRINT SPC(26); " THE ELECTRONIC AVANGER "
        'PUT (100, 100), Marker%, OR
LOOP
'PLAY         --gore y/n
'options ----I--bakground
'password-I   --sound y/n
'         I
'         I--level Pws
'          --Cheat (U O ME 1!)

SUB Grafix
LINE (30, 20)-(40, 30), , B
LINE -(30, 40), , B
LINE (33, 27)-(37, 27)
PSET (33, 23)
PSET (37, 23)
LINE (33, 19)-(35, 22)
LINE -(37, 19)
LINE (40, 30)-(59, 30)
LINE (50, 30)-(50, 37)
LINE (30, 30)-(20, 20)
LINE -(11, 20)
LINE (20, 20)-(20, 13)
LINE (30, 40)-(20, 40)
LINE -(20, 50)
LINE -(17, 50)
LINE (40, 40)-(40, 50)
LINE -(30, 57)
LINE -(33, 60)

END SUB

