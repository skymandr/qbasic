SHELL "userlist >file.tst"
OPEN "file.tst" FOR INPUT AS #1
DO
INPUT #1, a$
save$ = a$
save$ = RIGHT$(save$, 35)
save$ = LEFT$(save$, 8)

a$ = LEFT$(a$, 6)
a$ = RIGHT$(a$, 1)
PRINT save$
LOOP UNTIL EOF(1) OR a$ = "*"
CLS
name$ = save$
PRINT "Ditt Login namn „r: " + name$
CLOSE #1
SHELL "del file.tst"




