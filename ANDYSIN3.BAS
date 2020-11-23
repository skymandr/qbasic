SCREEN 12
CONST pi = 3.1415926535897#
DO
FOR a = 1 TO 640 STEP 1
'Byt ut SIN mot COS, byt plats p† dem etc f”r nytt m”nster.
b = SIN(a * (pi - b)) - b
a = COS(pi * pi) + a
PSET (a + 1, b + 240)
SOUND b + 400, 1
NEXT
LOOP

