CLS
PRINT "Vissa tal funkar inte."
INPUT "Vilken bakgrundsf„rg vill du ha(ange ett tal)"; a
INPUT "Vilken f„rg ska texten ha(ange ett tal)"; b
INPUT "Vad ska det st†"; c$
COLOR b, a
DO
PRINT c$
LOOP UNTIL INKEY$ <> ""
STOP
CLS

