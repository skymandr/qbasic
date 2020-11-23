SCREEN 12
INPUT "Planet mass: ", Mass
INPUT "X-pos: ", x
INPUT "Y-pos: ", y
CLS
DO
CIRCLE (x, y), 2, 8
CIRCLE (320, 240), Mass, 6
PAINT (320, 240), 6
LOOP

