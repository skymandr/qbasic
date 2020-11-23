SCREEN 12
cx = 255
LINE (10, 50)-(630, 460), 8, B
DO
a$ = INKEY$
'Ram
'Titel        
LOCATE 1, 1
PRINT SPC(9); "ÜßÜ ßÛß ÜßÜ ÛÜ ÜÛ Û ÜßßÜ      ÜßÜ ßÛß ßÛß ÜßÜ ÜßßÜ Û Û"
PRINT SPC(9); "ÛÜÛ  Û  Û Û Û Û Û Û Û  Ü  ßß  ÛÜÛ  Û   Û  ÛÜÛ Û  Ü ÛßÜ"
PRINT SPC(9); "ß ß  ß   ß  ß   ß ß  ßß       ß ß  ß   ß  ß ß  ßß  ß ß"
'Proto cannon
LINE (17, cx - 7)-(3, cx + 7), 0, BF
LINE (18, cx - 3)-(23, cx + 3), 0, BF
IF cx > 445 THEN cx = 445
IF cx < 65 THEN cx = 65
IF a$ = CHR$(13) THEN str = 0
IF a$ = "1" THEN str = 1
IF a$ = "2" THEN str = 2
IF a$ = "3" THEN str = 3
IF a$ = CHR$(0) + "H" AND str = 0 THEN
cx = cx - 5
LINE (10, 50)-(630, 460), 8, B
END IF
IF a$ = CHR$(0) + "P" AND str = 0 THEN
cx = cx + 5
LINE (10, 50)-(630, 460), 8, B
END IF
LINE (17, cx - 7)-(3, cx + 7), , BF
LINE (18, cx - 3)-(23, cx + 3), 7, BF
LOOP

