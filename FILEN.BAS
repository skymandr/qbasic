1 CLS
INPUT "What's your name"; a$
INPUT "What's your phonenumber"; p%
OPEN "g:\hemlig.fil" FOR APPEND AS #1
PRINT #1, a$; CHR$(13); p%
CLOSE
OPEN "g:\hemlig.fil" FOR INPUT AS #1
DO
INPUT #1, a$, p$
PRINT
PRINT a$; "'s phone number is:"; CHR$(13); p$
LOOP UNTIL EOF(1)
CLOSE
2 INPUT "Do you want to clear the list"; ast$
IF ast$ = "y" OR ast$ = "Y" THEN
INPUT "What's the password then"; pass$
IF pass$ = "I am cruel!" THEN
KILL "g:\hemlig.fil"
GOTO 1
ELSE
PRINT "Wrong Password!"
BEEP
GOTO 1
END IF
ELSE
IF ast$ = "n" OR ast$ = "N" THEN END
ELSE
PRINT "?"
GOTO 2
END IF

