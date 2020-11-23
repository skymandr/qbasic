CLS
LINE INPUT "Send to:"; st$
DO
LINE INPUT "Send:"; send$
SHELL "send ";chr$(34);send$;chr$(34)" "st$
 

