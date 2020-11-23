DECLARE SUB Shut (Luckor!, T1!, T2!)
DECLARE FUNCTION T! (Sides!, Dice!)
SCREEN 12
RANDOMIZE TIMER
FOR X = 1 TO 3
        FOR Y = 1 TO 3
                LINE (X * 20 - 19, Y * 20 - 19)-(X * 20, Y * 20), , B
        NEXT
NEXT
LINE (10, 10)-(11, 11), , B

LINE (26, 6)-(27, 7), , B
LINE (34, 14)-(35, 15), , B

LINE (45, 5)-(46, 6), , B
LINE (50, 10)-(51, 11), , B
LINE (55, 15)-(56, 16), , B

LINE (5, 25)-(6, 26), , B
LINE (5, 35)-(6, 36), , B
LINE (15, 25)-(16, 26), , B
LINE (15, 35)-(16, 36), , B

LINE (25, 25)-(26, 26), , B
LINE (25, 35)-(26, 36), , B
LINE (35, 25)-(36, 26), , B
LINE (35, 35)-(36, 36), , B
LINE (30, 30)-(31, 31), , B

LINE (45, 25)-(46, 26), , B
LINE (45, 35)-(46, 36), , B
LINE (55, 25)-(56, 26), , B
LINE (55, 35)-(56, 36), , B
LINE (45, 30)-(46, 31), , B
LINE (55, 30)-(56, 31), , B

LINE (5, 45)-(6, 46), , B
LINE (5, 55)-(6, 56), , B
LINE (15, 45)-(16, 46), , B
LINE (15, 55)-(16, 56), , B
LINE (5, 50)-(6, 51), , B
LINE (15, 50)-(16, 51), , B
LINE (10, 50)-(11, 51), , B

LINE (25, 45)-(26, 46), , B
LINE (25, 50)-(26, 51), , B
LINE (25, 55)-(26, 56), , B
LINE (30, 45)-(31, 46), , B
LINE (30, 55)-(31, 56), , B
LINE (35, 45)-(36, 46), , B
LINE (35, 50)-(36, 51), , B
LINE (35, 55)-(36, 56), , B

LINE (45, 45)-(46, 46), , B
LINE (45, 50)-(46, 51), , B
LINE (45, 55)-(46, 56), , B
LINE (50, 45)-(51, 46), , B
LINE (50, 55)-(51, 56), , B
LINE (55, 45)-(56, 46), , B
LINE (55, 50)-(56, 51), , B
LINE (55, 55)-(56, 56), , B
LINE (50, 50)-(51, 51), , B

DO
T1 = T(6, 1)
LINE (51, 71)-(70, 90), , B
LINE (52, 72)-(69, 89), 0, BF
SELECT CASE T1
CASE 1
LINE (60, 80)-(61, 81), , B
CASE 2
LINE (56, 76)-(57, 77), , B
LINE (64, 84)-(65, 85), , B
CASE 3
LINE (55, 75)-(56, 76), , B
LINE (60, 80)-(61, 81), , B
LINE (65, 85)-(66, 86), , B
CASE 4
LINE (55, 75)-(56, 76), , B
LINE (55, 85)-(56, 86), , B
LINE (65, 75)-(66, 76), , B
LINE (65, 85)-(66, 86), , B
CASE 5
LINE (55, 75)-(56, 76), , B
LINE (55, 85)-(56, 86), , B
LINE (65, 75)-(66, 76), , B
LINE (65, 85)-(66, 86), , B
LINE (60, 80)-(61, 81), , B
CASE 6
LINE (55, 75)-(56, 76), , B
LINE (55, 85)-(56, 86), , B
LINE (65, 75)-(66, 76), , B
LINE (65, 85)-(66, 86), , B
LINE (55, 80)-(56, 81), , B
LINE (65, 80)-(66, 81), , B
END SELECT
T2 = T(6, 1)
LINE (51, 91)-(70, 110), , B
LINE (52, 92)-(69, 109), 0, BF
SELECT CASE T2
CASE 1
LINE (60, 100)-(61, 101), , B
CASE 2
LINE (56, 96)-(57, 97), , B
LINE (64, 104)-(65, 105), , B
CASE 3
LINE (55, 95)-(56, 96), , B
LINE (60, 100)-(61, 101), , B
LINE (65, 105)-(66, 106), , B
CASE 4
LINE (55, 95)-(56, 96), , B
LINE (55, 105)-(56, 106), , B
LINE (65, 95)-(66, 96), , B
LINE (65, 105)-(66, 106), , B
CASE 5
LINE (55, 95)-(56, 96), , B
LINE (55, 105)-(56, 106), , B
LINE (65, 95)-(66, 96), , B
LINE (65, 105)-(66, 106), , B
LINE (60, 100)-(61, 101), , B
CASE 6
LINE (55, 95)-(56, 96), , B
LINE (55, 105)-(56, 106), , B
LINE (65, 95)-(66, 96), , B
LINE (65, 105)-(66, 106), , B
LINE (55, 100)-(56, 101), , B
LINE (65, 100)-(66, 101), , B
END SELECT
SLEEP
A = 2
IF T1 + T2 < 10 THEN
DO
LOCATE 10, 1
PRINT SPACE$(80)
LOCATE 10, 1
INPUT "Vill Du st„nga 1 eller 2 luckor"; A
LOOP UNTIL A > 0 AND A < 3
END IF
Shut A, T1, T2
LOOP

SUB Shut (Luckor, T1, T2) STATIC
IF Luckor = 1 THEN
        Die = T1 + T2
        GOSUB Shut
ELSE
        Die = T1
        GOSUB Shut
        Die = T2
        GOSUB Shut
END IF
EXIT SUB
Shut:
SELECT CASE Die
CASE 1
IF LOCK1 = 1 THEN END
LOCK1 = 1
LINE (1, 1)-(20, 20), , BF
CASE 2
IF LOCK2 = 1 THEN END
LOCK2 = 1
LINE (21, 1)-(40, 20), , BF
CASE 3
IF LOCK3 = 1 THEN END
LOCK3 = 1
LINE (41, 1)-(60, 20), , BF
CASE 4
IF LOCK4 = 1 THEN END
LOCK4 = 1
LINE (1, 21)-(20, 40), , BF
CASE 5
IF LOCK5 = 1 THEN END
LOCK5 = 1
LINE (21, 21)-(40, 40), , BF
CASE 6
IF LOCK6 = 1 THEN END
LOCK6 = 1
LINE (41, 21)-(60, 40), , BF
CASE 7
IF LOCK7 = 1 THEN END
LOCK7 = 1
LINE (1, 41)-(20, 60), , BF
CASE 8
IF LOCK8 = 1 THEN END
LOCK8 = 1
LINE (21, 41)-(40, 60), , BF
CASE 9
IF LOCK9 = 1 THEN END
LOCK9 = 1
LINE (41, 41)-(60, 60), , BF
END SELECT
RETURN
END SUB

FUNCTION T (Sides, Dice)
RANDOMIZE TIMER
FOR X = 1 TO Dice
Num = Num + INT(RND * Sides) + 1
NEXT
T = Num
END FUNCTION

