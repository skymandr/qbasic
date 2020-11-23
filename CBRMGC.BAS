2 CLS
PRINT "1. "
PRINT "2. "
INPUT "Hur vill Du se ut"; c$
IF c$ = "1" THEN
c$ = "": xl$ = ""
ELSEIF c$ = "2" THEN c$ = "": xl$ = ""
ELSE GOTO 2
END IF
INPUT "Vad vill Du heta"; nmn$
dir = 1
liv = 3
1 CLS
x = 10
y = 10
'^^
'^^
FOR l = 1 TO liv
LOCATE 1
PRINT "";
NEXT
FOR cl = 1 TO 20
LOCATE 15, cl
PRINT "ﬂ"
NEXT
FOR cl = 25 TO 50
LOCATE 15, cl
PRINT "ﬂ"
NEXT
DO
a$ = INKEY$
IF liv < 0 THEN LOCATE 1, 33: PRINT "GAME OVER": SLEEP 3: GOTO 2
IF SCREEN(x - 1, y) <> 32 THEN hopp = 0
LOCATE x, y
PRINT " "
IF a$ = CHR$(0) + "K" THEN dir = 1: y = y - 1
IF a$ = CHR$(0) + "M" THEN dir = 2: y = y + 1
IF hopp = 1 AND dir = 2 THEN hpp = hpp + 1: x = x - .5: y = y + .5
IF hopp = 1 AND dir = 1 THEN hpp = hpp + 1: x = x - .5: y = y - .5:
IF SCREEN(x + 1, y) = 32 AND hopp = 0 THEN x = x + .25
LOCATE x, y
PRINT c$
IF hpp = 9 THEN hpp = 0: hopp = 0:
IF x = 23 THEN dod = 1
IF dod = 1 THEN liv = liv - 1: dod = 0: GOTO 1
IF a$ = CHR$(13) AND SCREEN(x + 1, y) <> 32 THEN hopp = 1
LOOP
'¯=peng ˜=vatten Ï=cyclop Î=bomb Ó=pilbÜge È=storpeng(5) =hÑlsa /=extra liv Ø/Æ=ivÑgskjutna pilar(hîger/vÑnster) @=eldklot ù=vingar(^^=ÑnvÑnds) ©=pistol(˘=skott) \&/=svÑrd Üt olika hÜll Ä/á=spîke(stort/litet) =dîrr &=struts ú=nyckel ?=nÜgot fîremÜl i denna lista

