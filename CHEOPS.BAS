CLS
COLOR 10
PRINT "VÑlkommen till Cheops Rum Fuskar Program."
PRINT
PRINT "1. Fuska Till Ett Annat Rum."
PRINT
PRINT "2. èterstÑll Den Senaste SÑkerhetskopian."
PRINT
PRINT "3. Avsluta."
PRINT
PRINT "VÑlj Ett Alternativ: ";
DO
A$ = INKEY$
LOOP UNTIL A$ = "1" OR A$ = "2" OR A$ = "3"
PRINT A$
PRINT

SHELL "G:"
SHELL "CD\"

INPUT "Ange Ditt Cheops-Namn: ", FIL$
PRINT

IF A$ = "1" THEN GOTO FUSK
IF A$ = "2" THEN GOTO REST
IF A$ = "3" THEN GOTO SLUT



FUSK:
PRINT "Skapa SÑkerhetskopia (J/N)";
DO
A$ = INKEY$
LOOP UNTIL A$ = "J" OR A$ = "j" OR A$ = "N" OR A$ = "n"

IF A$ = "N" OR A$ = "n" THEN PRINT " Nej": GOTO JUMP
IF A$ = "J" OR A$ = "j" THEN
    PRINT " Ja"
    SHELL "COPY " + FIL$ + ".DAT" + " BACKUP.DAT >NUL"
    PRINT "Ditt Namn ér Sparat Som Backup."
END IF

JUMP:
PRINT

OPEN FIL$ + ".DAT" FOR BINARY AS #1

UPP:
INPUT "Vilket Rum I Cheops-Pyramiden Vill Du Komma Till: ", NY
IF NY > 95 THEN
    PRINT
    PRINT "Det Finns Bara 95 Stycken Rum I Cheops-Pyramiden."
    PRINT
    GOTO UPP
END IF

BANA = 3.852095E-34 + 1.175494E-38 * (NY - 2)

PUT #1, 18, BANA

CLOSE #1

PRINT
PRINT "Nu Har Du Fîrflyttat Dig Till Rum Nummer"; NY; "I Cheops Pyramiden."
PRINT
PRINT "Starta Cheops Och Tryck PÜ F9 Fîr Att HÑmta Ditt Nya Rum."
PRINT
GOTO SLUT

REST:
SHELL "COPY BACKUP.DAT " + FIL$ + ".DAT >NUL"
PRINT
PRINT "Ditt Namn Nu èterstÑllt Som "; FIL$
GOTO SLUT

SLUT:
COLOR 7

END

 










