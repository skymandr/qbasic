SCREEN 12
FOR X# = 0 TO 3.1415926536# * 2 STEP 3.1415926536# / 2200
         PSET (SIN(X#) * SIN(X# * 1) * SIN(X# * 39) * 100 + 320, COS(X#) * COS(X# * 8) * COS(X# * 4) * 100 + 240)
NEXT
'F”rslag PSET (SIN(X#) * SIN(X# * 4) * SIN(X# * 6) * 100 + 320, COS(X#) * COS(X# * 3) * COS(X# * 7) * 100 + 240),PSET (SIN(X#) * SIN(X# * 1) * SIN(X# * 91) * 100 + 320, COS(X#) * COS(X# * 7) * COS(X# * 2) * 100 + 240)

