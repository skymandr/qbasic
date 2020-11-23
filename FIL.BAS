DECLARE SUB Make ()
DECLARE SUB ViewFile ()
1 CLS
DO
LOCATE 1, 1
a$ = INKEY$
PRINT "Vill du:"
PRINT "1. Skapa fil"
PRINT "2. Se p† fil"
LOOP UNTIL a$ = "1" OR a$ = "2"
IF a$ = "1" THEN
CALL Make
ELSE
CALL ViewFile
END IF
GOTO 1

SUB Make
INPUT "Vad ska filen heta"; namn$
INPUT "Hur L†ng fil"; length%
OPEN namn$ FOR APPEND AS #1
FOR times = 1 TO length%
RANDOMIZE TIMER
IF INT(RND * 37) + 1 = 1 THEN PRINT #1, CHR$(13)
PRINT #1, CHR$(INT(RND * 255) + 1);
NEXT
CLOSE #1
END SUB

SUB ViewFile
PRINT "Veiw file „r l†ngt ifr†n perfekt!"
INPUT "Vad heter filen"; namn2$
OPEN namn2$ FOR INPUT AS #1
DO
INPUT #1, VF$
PRINT VF$
LOOP UNTIL EOF(1)
SLEEP
CLOSE #1
END SUB

