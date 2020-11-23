RANDOMIZE TIMER
CLS
CONST PI = 3.141592653589793#
CONST Grav = 1
DO: INPUT "Vilken massa ska planeten ha"; Mass%: LOOP WHILE Mass% < 1
SCREEN 12
XPos# = RND * 640
YPos# = RND * 480
XS# = RND
YS# = RND
PSET (320, 240)
DO
PSET (XPos#, YPos#)
LOCATE 1, 1
PRINT XS#, YS#
Dist = ABS(((XPos# - 320) ^ 2 + (YPos# - 240) ^ 2) ^ .5)
V# = ATN((XPos# - 320) / (YPos# - 240))
XS# = XS# - SIN(V#) * Grav * Mass% / Dist ^ 2
YS# = YS# - COS(V#) * Grav * Mass% / Dist ^ 2
PRESET (XPos#, YPos#)
XPos# = XPos# + XS#
YPos# = YPos# + YS#
LOOP

