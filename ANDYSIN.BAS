SCREEN 12
CONST pi = 3.141592
FOR a = 1 TO pi * 153 STEP .35
b = SIN(a * 15) * a
'V„lj PSET eller LINE (Byt g„rna ut STEP summan mot annan summa f”r ny effekt)
PSET (b, a)
PSET (a, b)
'LINE (b, a)-(a, b)
SOUND b + 400, .5
NEXT

