SCREEN 12
x = 50
Y = 50
'4
'Speeder
LINE (x, Y)-(x, Y + 14), 6
LINE (x - 1, Y + 1)-(x - 1, Y - 1), 6
LINE (x + 1, Y + 1)-(x + 1, Y - 1), 6
LINE (x - 3, Y + 4)-(x + 3, Y + 4), 6
'Armar
LINE (x - 3, Y + 4)-(x - 1, Y + 6), 7
LINE (x + 3, Y + 4)-(x, Y + 6), 7
'Kropp
LINE (x, Y + 5)-(x, Y + 9), 7
'Ben      
LINE (x, Y + 9)-(x - 3, Y + 10), 7
LINE (x, Y + 9)-(x + 3, Y + 10), 7
LINE (x + 3, Y + 10)-(x + 2, Y + 12), 7
LINE (x - 3, Y + 10)-(x - 2, Y + 12), 7
'Huvudet
PSET (x, Y + 5), 12
PSET (x, Y + 4), 12
PSET (x - 1, Y + 5), 12
PSET (x - 1, Y + 4), 12
SLEEP 3
CLS
'3
'Speeder
LINE (x, Y)-(x + 14, Y), 6
LINE (x + 1, Y - 1)-(x - 1, Y - 1), 6
LINE (x + 1, Y + 1)-(x - 1, Y + 1), 6
LINE (x + 4, Y - 3)-(x + 4, Y + 3), 6
'Armar       
LINE (x + 4, Y - 3)-(x + 6, Y - 1), 7
LINE (x + 4, Y + 3)-(x + 6, Y), 7
'Kropp
LINE (x + 5, Y)-(x + 9, Y), 7
'Ben    
LINE (x + 9, Y)-(x + 10, Y - 3), 7
LINE (x + 9, Y)-(x + 10, Y + 3), 7
LINE -(x + 12, Y + 2), 7
LINE (x + 10, Y - 3)-(x + 12, Y - 2), 7
'Huvudet
PSET (x + 5, Y), 12
PSET (x + 4, Y), 12
PSET (x + 5, Y - 1), 12
PSET (x + 4, x - 1), 12
SLEEP 3
CLS
'2
'Speeder
LINE (x, Y)-(x, Y - 14), 6
LINE (x + 1, Y - 1)-(x + 1, Y + 1), 6
LINE (x - 1, Y - 1)-(x - 1, Y + 1), 6
LINE (x + 3, Y - 4)-(x - 3, Y - 4), 6
'Armar
LINE (x + 3, Y - 4)-(x + 1, Y - 6), 7
LINE (x - 3, Y - 4)-(x, Y - 6), 7
'Kropp
LINE (x, Y - 5)-(x, Y - 9), 7
'Ben    
LINE (x, Y - 9)-(x + 3, Y - 10), 7
LINE (x, Y - 9)-(x - 3, Y - 10), 7
LINE (x - 3, Y - 10)-(x - 2, Y - 12), 7
LINE (x + 3, Y - 10)-(x + 2, Y - 12), 7
'Huvudet
PSET (x, Y - 5), 12
PSET (x, Y - 4), 12
PSET (x - 1, Y - 5), 12
PSET (x - 1, Y - 4), 12
SLEEP 3
CLS
'1
'Speeder
LINE (x, Y)-(x - 14, Y), 6
LINE (x - 1, Y + 1)-(x + 1, Y + 1), 6
LINE (x - 1, Y - 1)-(x + 1, Y - 1), 6
LINE (x - 4, Y + 3)-(x - 4, Y - 3), 6
'Armar     
LINE (x - 4, Y + 3)-(x - 6, Y + 1), 7
LINE (x - 4, Y - 3)-(x - 6, Y), 7
'Kropp
LINE (x - 5, Y)-(x - 9, Y), 7
'Ben  
LINE (x - 9, Y)-(x - 10, Y + 3), 7
LINE (x - 9, Y)-(x - 10, Y - 3), 7
LINE -(x - 12, Y - 2), 7
LINE (x - 10, Y + 3)-(x - 12, Y + 2), 7
'Huvudet
PSET (x - 5, Y), 12
PSET (x - 4, Y), 12
PSET (x - 5, Y + 1), 12
PSET (x - 4, x + 1), 12

