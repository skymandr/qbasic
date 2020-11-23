SCREEN 12
DIM plats(1 TO 4, 1 TO 4, 1 TO 4)
1 FOR x = 1 TO 4
        FOR y = 1 TO 4
                FOR z = 1 TO 4
                IF plats(x, y, z) = 0 THEN
                        CIRCLE (x * 80 + z * 10, y * 80 + z * 20), 5
                        PAINT (x * 80 + z * 10, y * 80 + z * 20)
                END IF
                IF plats(x, y, z) = 1 THEN
                        CIRCLE (x * 80 + z * 10, y * 80 + z * 20), 5, 1
                        PAINT (x * 80 + z * 10, y * 80 + z * 20), 1
                END IF
                IF plats(x, y, z) = 2 THEN
                        CIRCLE (x * 80 + z * 10, y * 80 + z * 20), 5, 2
                        PAINT (x * 80 + z * 10, y * 80 + z * 20), 2
                END IF
                NEXT
        NEXT
NEXT
GOTO 2
3 IF q <> 1 THEN
        DO
                INPUT "Spelare 1: ", x, y, z
        LOOP UNTIL x > 0 AND x < 5 AND y > 0 AND y < 5 AND z > 0 AND z < 5
        IF plats(x, y, z) = 0 THEN
                plats(x, y, z) = 1
                q = 1
                CLS 0
                GOTO 1
        ELSE
                CLS 0
                BEEP
                GOTO 1
        END IF
END IF
DO
        INPUT "Spelare 2: ", x, y, z
LOOP UNTIL x > 0 AND x < 5 AND y > 0 AND y < 5 AND z > 0 AND z < 5
IF plats(x, y, z) = 0 THEN
        plats(x, y, z) = 2
        q = 0
        CLS
        GOTO 1
ELSE
        CLS
        BEEP
        GOTO 1
END IF
2 FOR x = 1 TO 4
        FOR y = 1 TO 4
                FOR z = 1 TO 4
                        IF plats(x, y, z) = 1 THEN x1 = x1 + 1
                        IF plats(x, y, z) = 2 THEN x2 = x2 + 1
                NEXT
                IF x1 >= 4 THEN GOTO win1
                IF x2 >= 4 THEN GOTO win2
                x1 = 0
                x2 = 0
        NEXT
NEXT
FOR x = 1 TO 4
        FOR y = 1 TO 4
                FOR z = 1 TO 4
                        IF plats(x, z, y) = 1 THEN x1 = x1 + 1
                        IF plats(x, z, y) = 2 THEN x2 = x2 + 1
                NEXT
                IF x1 >= 4 THEN GOTO win1
                IF x2 >= 4 THEN GOTO win2
                x1 = 0
                x2 = 0
        NEXT
NEXT
FOR x = 1 TO 4
        FOR y = 1 TO 4
                FOR z = 1 TO 4
                        IF plats(y, x, z) = 1 THEN x1 = x1 + 1
                        IF plats(y, x, z) = 2 THEN x2 = x2 + 1
                NEXT
                IF x1 >= 4 THEN GOTO win1
                IF x2 >= 4 THEN GOTO win2
                x1 = 0
                x2 = 0
        NEXT
NEXT
FOR x = 1 TO 4
        FOR y = 1 TO 4
                FOR z = 1 TO 4
                        IF plats(y, z, x) = 1 THEN x1 = x1 + 1
                        IF plats(y, z, x) = 2 THEN x2 = x2 + 1
                NEXT
                IF x1 >= 4 THEN GOTO win1
                IF x2 >= 4 THEN GOTO win2
                x1 = 0
                x2 = 0
        NEXT
NEXT
FOR x = 1 TO 4
        FOR y = 1 TO 4
                FOR z = 1 TO 4
                        IF plats(z, y, x) = 1 THEN x1 = x1 + 1
                        IF plats(z, y, x) = 2 THEN x2 = x2 + 1
                NEXT
                IF x1 >= 4 THEN GOTO win1
                IF x2 >= 4 THEN GOTO win2
                x1 = 0
                x2 = 0
        NEXT
NEXT
FOR x = 1 TO 4
        FOR y = 1 TO 4
                FOR z = 1 TO 4
                        IF plats(z, x, y) = 1 THEN x1 = x1 + 1
                        IF plats(z, x, y) = 2 THEN x2 = x2 + 1
                NEXT
                IF x1 >= 4 THEN GOTO win1
                IF x2 >= 4 THEN GOTO win2
                x1 = 0
                x2 = 0
        NEXT
NEXT
GOTO 3

win1:
PRINT "Spelare 1 vann!!!!"
END
win2:
PRINT "Spelare 2 vann!!!"
END

