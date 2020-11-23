SCREEN 13
DIM karta(241, 121) AS INTEGER

INPUT x%
RANDOMIZE x%
CLS
z = 4
DO
   FOR x = 1 TO 240
      FOR y = 1 TO 120
         a = karta(x, y) + karta(x - 1, y - 1) + karta(x, y - 1) + karta(x + 1, y - 1) + karta(x + 1, y) + karta(x + 1, y + 1) + karta(x, y + 1) + karta(x - 1, y + 1) + karta(x - 1, y)
         karta(x, y) = INT(a / 9 + RND * 2 * z - z + 1)
         PSET (x, y), 24 + karta(x, y)
      NEXT
   NEXT
   
LOOP

