SCREEN 12
TYPE Stjerna
        XPos AS INTEGER
        YPos AS INTEGER
        Speed AS DOUBLE
        Colour AS INTEGER
END TYPE
RANDOMIZE TIMER
DIM Star(1 TO 50) AS Stjerna
FOR X = 1 TO 50
        Star(X).XPos = RND * 640 + 1
        Star(X).YPos = RND * 10 + X * 8
        Star(X).Speed = (RND * 1000) * .01 + 1
        IF Star(X).Speed < 3 THEN
        Star(X).Colour = 8
        ELSEIF Star(X).Speed < 7 THEN
        Star(X).Colour = 7
        ELSE
        Star(X).Colour = 15
        END IF
NEXT
DO
        FOR X = 1 TO 50
                PRESET (Star(X).XPos, Star(X).YPos)
                Star(X).XPos = Star(X).XPos + Star(X).Speed
                IF Star(X).XPos > 640 THEN Star(X).XPos = 1: Star(X).YPos = RND * 10 + 8 * X
                PSET (Star(X).XPos, Star(X).YPos), Star(X).Colour
        NEXT
LOOP

