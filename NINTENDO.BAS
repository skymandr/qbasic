DECLARE SUB Intro ()
DECLARE SUB Story ()
DECLARE SUB Spela ()
DECLARE SUB MainMenu ()
SCREEN 12
Intro

SUB Intro
CLS
PRINT SPC(30); "SVRSMŽLTA HJŽLTAR"
PRINT ""
PRINT SPC(10); CHR$(34); "Aah!"; CHR$(34); " skriker Mario. "; CHR$(34); "Vad „r det d„r?"; CHR$(34)
PRINT SPC(11); "Mario tror att ett enormt, sk„rt berg h†ller p† att"
PRINT SPC(10); "rasa ”ver honom. Sedan inser han att det „r"
PRINT SPC(10); "prinsessan Flugsvamps hand, som s„nks ner f”r att"
PRINT SPC(10); "lyfta honom till Yoshis mun."
PRINT SPC(11); CHR$(34); "MARIO!! HUR MR DU??"; CHR$(34)
PRINT SPC(10); "D†net av prinsessan Flugsvamps r”st v„lter n„stan"
PRINT SPC(10); "r”rmokaren ”ver „nda."
PRINT SPC(11); "Swoosh!"
PRINT SPC(10); "Prinsessan tar tag i hans r”da overall och lyfter"
PRINT SPC(10); "honom. Den lille Mario tycker att han sv„var"
PRINT SPC(10); "hundratals mil ovanf”r marken. Pl”tsligt h„nger han"
PRINT SPC(10); "upp och ner ovanf”r en gigantisk, m”rk grotta, full"
PRINT SPC(10); "av rader med vassa, vita klippor. "
PRINT SPC(11); CHR$(34); "Det d„r „r ingen grotta"; CHR$(34); ", s„ger han till sig sj„lv."
PRINT SPC(10); CHR$(34); "Det „r Yoshis mun! Det h„r var kanske ingen vidare"
PRINT SPC(10); "bra id‚."; CHR$(34); " "; CHR$(34); "Hall†, prinsessan!"; CHR$(34); " ropar han. "; CHR$(34); "S„tt ner"
PRINT SPC(10); "mig!"; CHR$(34)
PRINT SPC(11); "Prinsessan h”r Marios pipande."
PRINT SPC(10); CHR$(34); "Han „r s† modig"; CHR$(34); " s„ger hon till Toad och kungen,"
PRINT SPC(10); "medan hon torkar en t†r ur ”gat. S† sl„pper hon"
PRINT SPC(10); "Marios overall."
PRINT SPC(11); CHR$(34); "Se upp d„rnere!"; CHR$(34); " skriker Mario n„r han faller."
SLEEP 35
CLS
FOR a = 1 TO 11
LOCATE a, 29
PRINT "                         "
LOCATE a + 1, 29
PRINT "HUR SKA DET G F™R MARIO?"
NEXT
FOR a = 1 TO 22
LOCATE 13, a
PRINT " DET ŽR DU SOM MSTE FATTA RŽTT BESLUT"
NEXT
FOR a = 49 TO 26 STEP -1
LOCATE 14, a
PRINT "F™R ATT KLARA HONOM GENOM DETTA "
NEXT
FOR a = 24 TO 15 STEP -1
LOCATE a, 33
PRINT "MAGSTARKA ŽVENTYR!"
LOCATE a + 1, 33
PRINT "                  "
NEXT
SLEEP 6
CALL MainMenu
END SUB

SUB MainMenu
x = -2
y = 2
x2 = 5
y2 = 50
CLS
PRINT "FARLIGT FROSSERI"
DO
FOR Text = -2 TO 12
IF POINT(x + 1, y + Text) > 0 THEN CIRCLE (x2, y2 + Text * 5), 2
NEXT
LINE (x, y - 2)-(x, y + 12), 0
x = x + 1
x2 = x2 + 5
IF x = 125 THEN EXIT DO
LOOP
x = -2
y = 2
x2 = 130
y2 = 130
LOCATE 1, 1
PRINT "Av Matt Wayne & Andy Sky"
DO
FOR Text = -2 TO 12
IF POINT(x + 1, y + Text) > 0 THEN CIRCLE (x2, y2 + Text * 2), 1
NEXT
LINE (x, y - 2)-(x, y + 12), 0
x = x + 1
x2 = x2 + 2
IF x < 60 THEN
y2 = y2 + 1
ELSEIF x > 135 THEN y2 = y2 - 1
END IF
IF x = 195 THEN EXIT DO
LOOP
x = 225
y = 120
sel = 1
DO
a$ = INKEY$
IF a$ = CHR$(0) + "H" THEN CIRCLE (x, y), 5, 0: sel = sel - 1: IF sel < 1 THEN sel = 4: y = 168:  ELSE y = y - 16
IF a$ = CHR$(0) + "P" THEN CIRCLE (x, y), 5, 0: sel = sel + 1: IF sel > 4 THEN sel = 1: y = 120:  ELSE y = y + 16
CIRCLE (x, y), 5
LOCATE 8, 31
PRINT "Spela Mario"
LOCATE 9, 31
PRINT "Avsluta"
LOCATE 10, 31
PRINT "Se inledningen igen"
LOCATE 11, 31
PRINT "Story"
IF a$ = CHR$(13) AND sel = 1 THEN
CALL Spela
ELSEIF a$ = CHR$(13) AND sel = 2 THEN SYSTEM: END
ELSEIF a$ = CHR$(13) AND sel = 3 THEN CALL Intro
ELSEIF a$ = CHR$(13) AND sel = 4 THEN CALL Story
END IF
LOOP
END SUB

SUB Spela
PRINT "ÚÄÄÄ¿"
PRINT "À¿ ÚÙ"
PRINT " ³ ³ "
PRINT "ÚÙ À¿"
PRINT "ÀÄÄÄÙ"
PRINT
PRINT "  Ú¿"
PRINT "<<³¿rattis p† f”delsedagen, Yoshi!¯"
PRINT "  ÀÙ Svampkungen h†ller f”delsedagskalas f”r"
PRINT "sin favorit dinosaurie, Yoshi, och alla „r"
PRINT "bjudna - inklusive de tv† ber”mda r”rmokarna"
PRINT "Mario och Luigi. Praktiskt taget hela svamp-"
PRINT "rikets befolkning har tr„ngt ihop sig i"
PRINT "palatsets stora sal."
END SUB

SUB Story
CLS
PRINT SPC(25); "Yoshis f”delsedagskalas!"
PRINT ""
PRINT SPC(16); "Yoshi har st„llt till med f”delsedagsfest"
PRINT SPC(16); "och alla hans dinosauriepolare hj„lper"
PRINT SPC(16); "honom att fira den stora dagen. Alla har"
PRINT SPC(16); "j„ttetrevligt tills det „r dags f”r Yoshi att"
PRINT SPC(16); "s„tta i sig sin f”delsedagst†rta. N„r han"
PRINT SPC(16); "har gjort det b”rjar han s„tta i sig allt-"
PRINT SPC(16); "och alla i sin v„g. Kan Mario och Luigi f†"
PRINT SPC(16); "stopp p† Yoshis oh„mmade aptit och r„dda"
PRINT SPC(16); "dem han redan har satt i sig?"
PRINT SPC(16); "Det „r upp till dig om Mario och Luigi ska"
PRINT SPC(16); "lyckas hitta ett botemedel f”r Yoshis"
PRINT SPC(16); "magbesv„r. Hj„lp dem att tyda koder, l”sa"
PRINT SPC(16); "pussel, ta sig fram genom labyrinter och"
PRINT SPC(16); "sl† ut fiender. Du, Mario och Luigi m†ste"
PRINT SPC(16); "besegra en hel h”g av nya fiender om ni ska"
PRINT SPC(16); "lyckas f† stopp p† Yoshis hunger!"
SLEEP 35
CALL MainMenu
END SUB

