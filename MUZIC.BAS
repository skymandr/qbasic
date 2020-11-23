
1
CLS
COLOR 5
LOCATE 5, 20
PRINT "Welcome 2 ELYSiUM Muzic!"
SLEEP 2
CLS
LOCATE 6, 20
PRINT "Prezz SpaCe tO BeGiN"
SLEEP
CLS
COLOR 3
LOCATE 5, 30
PRINT "Chooze"
SLEEP 2
CLS
COLOR 10
LOCATE 7, 30
PRINT "1. Snail"
LOCATE 8, 30
PRINT "2. Argh"
LOCATE 9, 30
PRINT "3. Crash"
LOCATE 10, 30
PRINT "4. Mysco"
LOCATE 10, 30
PRINT "5. Scale"
LOCATE 11, 30
PRINT "6. Scale 2"
LOCATE 12, 30
PRINT "7. Fun Thing"
LOCATE 13, 30
PRINT "8. Colorz"
LOCATE 14, 30
PRINT "9. Flimm"
LOCATE 15, 30
PRINT "10. Line"
LOCATE 16, 30
PRINT "11. Time"
LOCATE 17, 30
PRINT "12. Fanfare"
LOCATE 18, 30
PRINT "13. Mysco 2"
LOCATE 19, 30
PRINT "14. Loop"
LOCATE 20, 30
PRINT "15. Qwit"
LOCATE 21, 30
PRINT "16.AVSLUTA"
INPUT A$
IF A$ = "1" THEN GOTO 2
IF A$ = "2" THEN GOTO 3
IF A$ = "3" THEN GOTO 4
IF A$ = "4" THEN GOTO 5
IF A$ = "5" THEN GOTO 6
IF A$ = "6" THEN GOTO 7
IF A$ = "7" THEN GOTO 8
IF A$ = "8" THEN GOTO 9
IF A$ = "9" THEN GOTO 10
IF A$ = "10" THEN GOTO 11
IF A$ = "11" THEN GOTO 12
IF A$ = "12" THEN GOTO 13
IF A$ = "13" THEN GOTO 14
IF A$ = "14" THEN GOTO 15
IF A$ = "15" THEN GOTO 25
IF A$ = "16" THEN GOTO 26









2
CLS
PLAY "ggeegge.ffd.gge.gge.eggeffddc.."
GOTO 1

3
CLS
PRINT "SAFT"
PLAY "T100DADCDFDGDCDDDADADCDFT150DADCDFGCDFAGDFCT50GGDGDGDGFDGFT255ACDACDDDCAADCACDACDDDCAT50ACDFGACDFGACEFDFCGT255DDDDDDDDDA.."
GOTO 1

       
4
CLS
COLOR 25
PRINT "CRASH"
PLAY "t250cbdebdcbfbabgfeafedc..a"
GOTO 1

5
CLS
LOCATE 10, 30
PRINT "MYSTISKT LJUD"
FOR i% = 440 TO 10000 STEP 30
SOUND i%, i% / 800
NEXT


6
CLS
Exempel:
    ON PLAY(3) GOSUB Bakgrund
    PLAY ON
    Music$ = "MBo3L8ED+ED+Eo2Bo3DCL2o2A"
    PLAY Music$
    LOCATE 2, 1: PRINT "Tryck pÜ valfri tangent fîr att stÑnga av musiken.";
    DO WHILE INKEY$ = "": LOOP
    END

Bakgrund:
        i% = i% + 1
        LOCATE 1, 1: PRINT "Bakgrund anropad "; i%; "gÜng(er)";
        PLAY Music$
        RETURN

7
CLS
PRINT "Spela en durskala i 7 oktaver"
    skala$ = "CDEFGAB"
    PLAY "L16"
    FOR i% = 0 TO 6
        PLAY "O" + STR$(i%)
        PLAY "X" + VARPTR$(skala$)
    NEXT i%


8
CLS
PRINT "Detta exempel krÑver en adapter fîr fÑrggrafik"
    SCREEN 1
    CIRCLE (106, 100), 75, 1
    LINE (138, 35)-(288, 165), 1, B
    PAINT (160, 100), 2, 1


9
CLS
PRINT "Detta exempel krÑver en adapter fîr fÑrggrafik"
    PALETTE 0, 1
    SCREEN 1
    FOR i% = 0 TO 3: A%(i%) = i%: NEXT i%
    LINE (138, 35)-(288, 165), 3, BF
    LINE (20, 10)-(160, 100), 2, BF
    DO
        FOR i% = 0 TO 3
            A%(i%) = (A%(i%) + 1) MOD 16
        NEXT i%
        PALETTE USING A%(0)
    LOOP WHILE INKEY$ = ""

10
CLS
PRINT "Detta exempel krÑver en adapter fîr fÑrggrafik"
    SCREEN 1
    DIM Box%(1 TO 200)
    x1% = 0: x2% = 10: y1% = 0: y2% = 10
    LINE (x1%, y1%)-(x2%, y2%), 2, BF
    GET (x1%, y1%)-(x2%, y2%), Box%
    DO
        PUT (x1%, y1%), Box%, XOR
        x1% = RND * 300
        y1% = RND * 180
        PUT (x1%, y1%), Box%
    LOOP WHILE INKEY$ = ""

11
CLS
PRINT "Detta exempel krÑver en adapter fîr fÑrggrafik"
SCREEN 1        '320 x 200-grafik
LINE (110, 70)-(190, 120), , B
LINE (0, 0)-(320, 200), 3, , &HFF00
GOTO 1

12
CLS
COLOR 3
PRINT TIME$
TIME$ = "14:46:50"    'Obs! Den nya systemtiden gÑller tills du Ñndrar
                          '     den igen.
    PRINT "InstÑlld tid: "; TIME$
SLEEP 5
GOTO 1

13
CLS
    Music$ = "MBT180o2P2P8L8GGGL2E-P24P8L8FFFL2D"
    PLAY Music$
    WHILE PLAY(0) > 5: WEND
GOTO 1
14
CLS
SOUND 140, 20
SOUND 150, 20
SOUND 140, 20
SOUND 150, 20
SOUND 140, 20
SOUND 150, 20
SOUND 140, 20
SOUND 150, 20
SOUND 140, 20
SOUND 150, 20
SOUND 140, 20
SOUND 150, 20
SOUND 140, 20
SOUND 150, 20
SOUND 140, 20
SOUND 150, 20

15
CLS
PRINT "Detta exempel krÑver en ljuspenna."
    ON PEN GOSUB Handler
    PEN ON
    PRINT "Tryck pÜ Esc fîr att avsluta."
    DO UNTIL INKEY$ = CHR$(27): LOOP
    END

Handler:
    PRINT "Pennan Ñr pÜ rad"; PEN(6); ", kolumn"; PEN(7)
    RETURN





20
CLS
PRINT "vill du spara"
PRINT "1.ja 2.nej"
INPUT A$
IF A$ = "1" THEN GOTO 21
IF A$ = "2" THEN GOTO 22

21
CLS

    INPUT "Skriv filnamn: "; n$
    OPEN n$ FOR OUTPUT AS #1
    PRINT #1, "Detta sparas i filen."
    CLOSE
    OPEN n$ FOR INPUT AS #1
    INPUT #1, A$
    PRINT "LÑs frÜn filen: "; A$
    CLOSE

22
CLS
SCREEN 13
PRINT "HEJDè HOPPAS DU HADDE KUL";
SLEEP 3

25
CLS
SCREEN 13
PRINT "éR DET SéKERT ATT DU VILL SLUTA"
PRINT "1.JA 2.NEJ"
INPUT A$
IF A$ = "1" THEN GOTO 20
IF A$ = "2" THEN GOTO 1

26
CLS
    PRINT "Tryck pÜ Esc fîr att avsluta..."
    DO
    LOOP UNTIL INKEY$ = CHR$(27)    '27 Ñr ASCII-koden fîr Esc.

