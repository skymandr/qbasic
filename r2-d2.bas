SCREEN 12
FOR x = 1 TO 14 STEP 2
FOR z = 1 TO 200 STEP 2
CIRCLE (z, z), z, x
NEXT
FOR z = 100 TO 1 STEP -1
CIRCLE (z, z), z, x + 1
NEXT
SLEEP
NEXT

