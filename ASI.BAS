DECLARE SUB New ()
DECLARE SUB Old ()
CLOSE #1
DO
1 CLS
PRINT "1. Enter new"
PRINT "2. View old"
PRINT "3. End"
INPUT "What do you whant to do"; cho
IF cho = 1 THEN
New
ELSEIF cho = 2 THEN Old
ELSEIF cho = 3 THEN SYSTEM: END
ELSE GOTO 1
END IF
LOOP

SUB New
CLOSE #1
CLS
INPUT "Your gender"; gen$
INPUT "Birthdate(YY:MM:DD)"; bd$
INPUT "Your name"; name$
INPUT "Your initials"; init$
INPUT "Your adress"; adr$
INPUT "Phone"; phone$
PRINT "Enter a password below"
COLOR 0
INPUT pass$
COLOR 7
OPEN init$ + ".asi" FOR OUTPUT AS #1
PRINT #1, pass$, CHR$(13), gen$, CHR$(13), name$, CHR$(13), bd$, CHR$(13), adr$, CHR$(13), phone$
CLOSE #1
END SUB

SUB Old
CLOSE #1
2 CLS
DO
PRINT "1. View"
PRINT "2. Delete"
PRINT "3. Main"
INPUT "What do you whant to do"; cho
IF cho = 1 THEN
GOSUB Look
ELSEIF cho = 2 THEN GOSUB Del
ELSEIF cho = 3 THEN EXIT SUB
ELSE GOTO 2
END IF
LOOP
Look:
CLOSE #1
INPUT "What file would you like to look at(.asi is not needed)"; cho$
OPEN cho$ + ".asi" FOR INPUT AS #1
INPUT #1, pass$
PRINT "Enter password below"
COLOR 0
INPUT try$
COLOR 7
IF try$ = pass$ THEN
CLOSE #1
OPEN cho$ + ".asi" FOR INPUT AS #1
INPUT #1, age$, gen$, name$, bd$, adr$, pho$
ELSE BEEP: CLOSE #1: GOTO 2
END IF
CLS
PRINT "Gender: "; gen$
PRINT "Name: "; name$
PRINT "Birthdate: "; bd$
PRINT "Adress: "; adr$
PRINT "Phone number: "; pho$
SLEEP
CLOSE #1
GOTO 2
Del:
INPUT "What file Would yo like to delete(.asi is not needed)"; cho$
OPEN cho$ + ".asi" FOR INPUT AS #1
INPUT #1, pass$
PRINT "Enter password below"
COLOR 0
INPUT try$
COLOR 7
CLOSE #1
IF try$ = pass$ THEN KILL cho$ ELSE BEEP: EXIT SUB
CLOSE #1
GOTO 2
END SUB

