SCREEN 12
x = 300
y = 190
qwe = 10
DO
LINE (x, y)-(320, 240)
x = x + 1
y = y - qwe
qwe = qwe - 1
IF y > 190 THEN qwe = 10: aset = aset + 1: GOTO 2
IF x = 345 THEN END
2 FOR a = 1 TO 123
NEXT
LOOP

