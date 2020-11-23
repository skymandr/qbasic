INPUT "Amps:", I
INPUT "Volt:", U
INPUT "Resistans:", R
DO
P = U * I
PRINT P
SLEEP 2
U = R * I
PRINT P
SLEEP 2
LOOP

