SCREEN 12: RANDOMIZE TIMER 'PLenssen 96
DIM w(1 TO 9, 1 TO 18, 1 TO 4), b(1 TO 9, 1 TO 6, 1 TO 2), p(1 TO 9, 1 TO 6, 1 TO 2) AS INTEGER
DIM x, y, nrb, nrp, ba, fo, xmax, ymax, neu, ver, ver2, lin, sklc AS INTEGER
DIM del, bx, by, px, py, ri, wa, scr, nr, cr, c, ge, bump AS INTEGER
DIM bl1%(1500), bl2%(1500), bl3%(1500), bl4%(1500), skl1a%(650), skl2a%(650)
DIM skl3a%(650), skl4%(650), skl1b%(650), skl2b%(650), skl3b%(650), kreuz%(290)
DIM speer1%(280), speer2%(280), speer3%(280), speer4%(280), speer5%(280), speer6%(280)
DIM speer7%(280), speer8%(280), kaefer1%(900), kaefer2%(900), kaefer3%(900), kaefer4%(900)
ba = 0: fo = 3: ge = 11: lin = 7: sklc = 15 '>Colors
geduld% = 20: wec% = geduld%: gr% = 4
dauer% = 10: max = 1: be = max / 10: test% = 0

GOSUB plan: GOSUB getall

start:
FOR i% = 1 TO 30: cc$ = INKEY$: NEXT
LOCATE 15, 22: PRINT "SKULL (ARROWS TO NAVIGATE, ESCAPE QUITS)": SLEEP 3
x = 315: y = 280: scr = 7: xspd = 0: yspd = 0: zeitlimit% = 1000: xxx% = 0
scrk% = 6: xk% = 360: yk% = 204: xkspd% = -1
GOSUB neu: startzeit = TIMER

DO '----------------------------------------------
eingabe$ = INKEY$
   GOSUB bewegung: GOSUB zeit: GOSUB rand
   GOSUB wand: GOSUB blitz: GOSUB speer: GOSUB ziel
   GOSUB tier: GOSUB gefahr
GOSUB skull
LOOP '--------------------------------------------

skull:
IF xxx% > 0 THEN
xxx% = xxx% - 1
IF t < dreh% / 4 THEN
IF comp% = 0 THEN PUT (x, y), skl1a%, PSET
IF comp% = 1 THEN PUT (x, y), skl1b%, PSET
ELSEIF t < (dreh% / 4) * 2 THEN
IF comp% = 0 THEN PUT (x, y), skl2a%, PSET
IF comp% = 1 THEN PUT (x, y), skl2b%, PSET
ELSEIF t < (dreh% / 4) * 3 THEN
IF comp% = 0 THEN PUT (x, y), skl3a%, PSET
IF comp% = 1 THEN PUT (x, y), skl3b%, PSET
ELSEIF t < dreh% THEN PUT (x, y), skl4%, PSET
END IF
IF xxx% = 0 AND dreh% < dauer% THEN
dreh% = dreh% + 1: xxx% = dreh% * dauer%: t = dreh% / 2
END IF
ELSE
IF comp% = 0 THEN PUT (x, y), skl2a%, PSET
IF comp% = 1 THEN PUT (x, y), skl2b%, PSET
END IF
RETURN

bewegung:
IF eingabe$ <> "" THEN comp% = 0: wart = 0

IF comp% = 0 THEN
  wahl$ = eingabe$
ELSE
  zz% = INT(RND * (wec% + 4)) + 1
  SELECT CASE zz%
  CASE 1: wahl$ = CHR$(0) + "H"
  CASE 2: wahl$ = CHR$(0) + "P"
  CASE 3: wahl$ = CHR$(0) + "K"
  CASE 4: wahl$ = CHR$(0) + "M"
  CASE ELSE: wahl$ = ""
  END SELECT
END IF

SELECT CASE wahl$
CASE CHR$(0) + "H"
  IF yspd > -max THEN
  yspd = yspd - be
  IF xspd > 0 THEN xspd = xspd - be
  IF xspd < 0 THEN xspd = xspd + be
  END IF
  GOSUB rundung
CASE CHR$(0) + "P"
  IF yspd < max THEN
  yspd = yspd + be
  IF xspd > 0 THEN xspd = xspd - be
  IF xspd < 0 THEN xspd = xspd + be
  END IF
  GOSUB rundung
CASE CHR$(0) + "K"
  IF xspd > -max THEN
  xspd = xspd - be
  IF yspd > 0 THEN yspd = yspd - be
  IF yspd < 0 THEN yspd = yspd + be
  END IF
  GOSUB rundung
CASE CHR$(0) + "M"
  IF xspd < max THEN
  xspd = xspd + be
  IF yspd > 0 THEN yspd = yspd - be
  IF yspd < 0 THEN yspd = yspd + be
  END IF
  GOSUB rundung
CASE ELSE
  IF comp% = 0 THEN wart = wart + .01
END SELECT

IF wart > geduld% THEN comp% = 1: wart = 0

y = y + yspd: x = x + xspd

IF test% = 1 THEN
LOCATE 25, 1: PRINT "Speed", ABS(xspd) + ABS(yspd)
LOCATE 26, 1: PRINT "Computer", INT(geduld% - wart)
LOCATE 27, 1: PRINT "Screen", scr
LOCATE 28, 1: PRINT "Position"; INT(x), INT(y)
END IF
RETURN

neu:
nrb = 0
DO: nrb = nrb + 1: LOOP UNTIL b(scr, nrb, 1) + b(scr, nrb, 2) = 0: nrb = nrb - 1
nrp = 0
DO: nrp = nrp + 1: LOOP UNTIL p(scr, nrp, 1) + p(scr, nrp, 2) = 0: nrp = nrp - 1
nrx = 0
DO: nrx = nrx + 1: LOOP UNTIL w(scr, nrx, 1) + w(scr, nrx, 3) = 0: nrx = nrx - 1

CLS
FOR nr = 1 TO nrx
FOR c = 1 TO 4
  cr(c) = w(scr, nr, c)
NEXT
x1% = cr(1) * 10: y1% = cr(2) * 10: x2% = cr(3) * 10: y2% = cr(4) * 10
  IF x1% = 0 THEN x1% = 1
  IF x2% = 640 THEN x2% = 638
  IF y1% = 0 THEN y1% = 1
  IF y2% = 480 THEN y2% = 478
LINE (x1%, y1%)-(x2%, y2%), fo, BF
IF test% = 1 THEN LINE (x1%, y1%)-(x2%, y2%), 14
NEXT
IF ba > 0 THEN PAINT (0, 0), ba, fo

IF test% = 1 THEN GOSUB gitter
w% = 0: tp% = 0
IF scr = zscr% THEN PUT (zx%, zy%), kreuz%, PSET
RETURN

wand:
wa = 0: ver = 6: ver2 = 1

SELECT CASE fo
CASE POINT(x + xmax, y + ymax / 2), POINT(x + xmax, y + (ymax / 2 - ver)), POINT(x + xmax, y + (ymax / 2 + ver)): wa = 1
CASE POINT(x + xmax / 2, y + ymax), POINT(x + (xmax / 2 - ver), y + ymax), POINT(x + (xmax / 2 + ver), y + ymax): wa = 2
CASE POINT(x - ver2, y + ymax / 2), POINT(x - ver2, y + (ymax / 2 - ver)), POINT(x - ver2, y + (ymax / 2 + ver)): wa = 3
CASE POINT(x + xmax / 2, y - ver2), POINT(x + (xmax / 2 - ver), y - ver2), POINT(x + (xmax / 2 + ver), y - ver2): wa = 4
CASE POINT(x + xmax, y + ymax): wa = 5
CASE POINT(x - ver2, y + ymax): wa = 6
CASE POINT(x - ver2, y - ver2): wa = 7
CASE POINT(x + xmax, y - ver2): wa = 8
END SELECT

IF wa > 0 THEN
bump = 1

IF xspd > 0 AND yspd = 0 THEN
  xspd = xspd * -1 + be: x = x - bump: IF wa >= 5 THEN yspd = yspd * -1
ELSEIF xspd < 0 AND yspd = 0 THEN
  xspd = xspd * -1 - be: x = x + bump: IF wa >= 5 THEN yspd = yspd * -1
ELSEIF xspd = 0 AND yspd < 0 THEN
  yspd = yspd * -1 - be: y = y + bump: IF wa >= 5 THEN xspd = xspd * -1
ELSEIF xspd = 0 AND yspd > 0 THEN
  yspd = yspd * -1 + be: y = y - bump: IF wa >= 5 THEN xspd = xspd * -1
ELSEIF xspd > 0 AND yspd < 0 THEN
  SELECT CASE wa
  CASE 4, 7: yspd = yspd * -1 - be: x = x + bump: y = y + bump
  CASE 1, 5: xspd = xspd * -1 + be: x = x - bump: y = y - bump
  CASE 8: xspd = xspd * -1
  END SELECT
ELSEIF xspd > 0 AND yspd > 0 THEN
  SELECT CASE wa
  CASE 2, 6: yspd = yspd * -1 + be: x = x + bump: y = y - bump
  CASE 1, 8:  xspd = xspd * -1 + be: x = x - bump: y = y + bump
  CASE 5:  xspd = xspd * -1
  END SELECT
ELSEIF xspd < 0 AND yspd > 0 THEN
  SELECT CASE wa
  CASE 2, 5: yspd = yspd * -1 + be: x = x - bump: y = y - bump
  CASE 3, 7: xspd = xspd * -1 - be: x = x + bump: y = y + bump
  CASE 6: xspd = xspd * -1
  END SELECT
ELSEIF xspd < 0 AND yspd < 0 THEN
  SELECT CASE wa
  CASE 4, 8: yspd = yspd * -1 - be: x = x - bump: y = y + bump
  CASE 3, 6: xspd = xspd * -1 - be: x = x + bump: y = y + bump
  CASE 7: xspd = xspd * -1
  END SELECT
END IF

SOUND 100, .2
dreh% = dauer% - (dauer% / 2) * (2 * (ABS(xspd) + ABS(yspd)))
IF xxx% = 0 THEN xxx% = dreh% * dauer%: t = dreh% / 2

END IF
RETURN

rand:
IF x >= 639 - xmax THEN
                            scr = scr + 1: x = 2: GOSUB neu
ELSEIF x <= 1 THEN scr = scr - 1: x = 638 - xmax: GOSUB neu
ELSEIF y >= 479 - ymax THEN scr = scr + 3: y = 2: GOSUB neu
ELSEIF y <= 1 THEN scr = scr - 3: y = 478 - ymax: GOSUB neu
END IF
RETURN

rundung:
xspd = xspd * 10: xspd = INT(xspd + .5): xspd = xspd / 10
yspd = yspd * 10: yspd = INT(yspd + .5): yspd = yspd / 10
RETURN

zeit:
zeit% = zeitlimit% - (INT(TIMER - startzeit))
IF eingabe$ = CHR$(27) THEN zeit% = 0
LOCATE 1, 1: PRINT zeit%
IF zeit% <= 0 THEN GOSUB explosion
  IF t < dreh% THEN
  t = t + .1
  ELSE t = 0
  END IF
RETURN

tier:
IF scr = scrk% THEN

IF t3% <= 20 THEN
t3% = t3% + 1
ELSE
t3% = 0
END IF

IF t3% = 1 OR t3% = 10 THEN
  IF ka% <= 10 THEN
  ka% = ka% + 1
  ELSE
  ka% = 1
END IF

xk% = xk% + xkspd%
IF POINT(xk% + kxmax% + 1, yk% + kymax% / 2) = fo OR xk% = 639 - xkmax% THEN xk% = xk% - 3: xkspd% = -1
IF POINT(xk% - 1, yk% + kymax% / 2) = fo OR xk% = 1 THEN xk% = xk% + 3: xkspd% = 1

IF xkspd% = 1 AND POINT(xk% + kxmax% + 1, yk% + kymax% / 2) = lin THEN
xspd = xspd + .1: SOUND 100, .2
ELSEIF xkspd% = -1 AND POINT(xk% - 1, yk% + kymax% / 2) = lin THEN xspd = xspd - .1: SOUND 100, .2
ELSE
IF POINT(xk% + kxmax%, yk% + kymax% / 2) = sklc THEN GOSUB explosion
IF POINT(xk%, yk% + kymax% / 2) = sklc THEN GOSUB explosion
END IF

SELECT CASE ka%
CASE IS < 5
IF xkspd% > 0 THEN PUT (xk%, yk%), kaefer1%, PSET
IF xkspd% < 0 THEN PUT (xk%, yk%), kaefer3%, PSET
CASE ELSE
IF xkspd% > 0 THEN PUT (xk%, yk%), kaefer2%, PSET
IF xkspd% < 0 THEN PUT (xk%, yk%), kaefer4%, PSET
END SELECT

END IF

END IF
RETURN

speer:
tp% = tp% + 1

FOR nr = 1 TO nrp
FOR c = 1 TO 2
  cr(c) = p(scr, nr, c)
NEXT
px = (cr(1) * 10) + 5: py = (cr(2) * 10) - 8

SELECT CASE tp% / 20
CASE 1: PUT (px, py), speer7%, PSET
CASE 4: PUT (px, py), speer6%, PSET
CASE 5: PUT (px, py), speer5%, PSET
CASE 6: PUT (px, py), speer4%, PSET
CASE 7: PUT (px, py), speer3%, PSET
CASE 8: PUT (px, py), speer2%, PSET
CASE 9: PUT (px, py), speer1%, PSET
CASE 10: PUT (px, py), speer8%, PSET
CASE 11: tp% = 0
END SELECT
NEXT

RETURN

blitz:
t2 = t2 + 1
IF t2 = 15 THEN t2 = 0
IF t2 = 1 THEN
w% = w% + 1

FOR nr = 1 TO nrb
FOR c = 1 TO 2
  cr(c) = b(scr, nr, c)
NEXT
bx = (cr(1) * 10) + 5: by = (cr(2) * 10) - 8

SELECT CASE w%
CASE 1, 4, 7: PUT (bx, by), bl1%, PSET
CASE 2, 5, 8: PUT (bx, by), bl2%, PSET
CASE 3, 6, 9: PUT (bx, by), bl3%, PSET
CASE 10: PUT (bx, by), bl4%, PSET
CASE 16: w% = 0
END SELECT
NEXT
END IF

RETURN

gefahr:
wa = 1
SELECT CASE ge
CASE POINT(x + xmax, y + ymax / 2), POINT(x + xmax / 2, y + ymax), POINT(x - 1, y + ymax)
CASE POINT(x + xmax / 2, y - 1), POINT(x + xmax, y + ymax), POINT(x - 1, y + ymax)
CASE POINT(x - 1, y - 1), POINT(x + xmax, y - 1), POINT(x + xmax / 2, y + ymax / 2)
CASE ELSE: wa = 0
END SELECT
IF wa = 1 THEN GOSUB explosion
RETURN

ziel:
IF scr = zscr% THEN
wa = 1
SELECT CASE 9
CASE POINT(x + 21, y + 10), POINT(x + 10, y + 21), POINT(x - 1, y + 10)
CASE POINT(x + 10, y - 1), POINT(x + 21, y + 21), POINT(x - 1, y + 21)
CASE POINT(x - 1, y - 1), POINT(x + 21, y - 1)
CASE ELSE: wa = 0
END SELECT
IF wa = 1 THEN
PLAY "o1l26cedgabfd<a": LOCATE 15, 36: PRINT "WELL DONE"
SLEEP 3: GOSUB ende
END IF
END IF
RETURN

gitter:
LINE (1, 50)-(639, 50), , , 31
LINE (1, 100)-(639, 100)
LINE (1, 150)-(639, 150), , , 31
LINE (1, 200)-(639, 200)
LINE (1, 250)-(639, 250), , , 31
LINE (1, 300)-(639, 300)
LINE (1, 350)-(639, 350), , , 31
LINE (1, 400)-(639, 400)
LINE (1, 450)-(639, 450), , , 31
LINE (50, 1)-(50, 479), , , 31
LINE (100, 1)-(100, 479)
LINE (150, 1)-(150, 479), , , 31
LINE (200, 1)-(200, 479)
LINE (250, 1)-(250, 479), , , 31
LINE (300, 1)-(300, 479)
LINE (350, 1)-(350, 479), , , 31
LINE (400, 1)-(400, 479)
LINE (450, 1)-(450, 479), , , 31
LINE (500, 1)-(500, 479)
LINE (550, 1)-(550, 479), , , 31
LINE (600, 1)-(600, 479)
RETURN

getall:
CLS : PAINT (0, 0), ba

DRAW "c" + STR$(fo) + "bm100,100s20 lehhuureheuuhher gffddgfggdffg s4bh p" + STR$(ge) + "," + STR$(fo)
DRAW "c" + STR$(fo) + "bm150,100s20 lhuuurehhruuheuur ddgfdddfggdfd s4bh p" + STR$(ge) + "," + STR$(fo)
DRAW "c" + STR$(fo) + "bm200,100s20 luuuehuuelluuueur dgddrrdgddfd gdd s4bh p" + STR$(ge) + "," + STR$(fo)
GET (90, 35)-(105, 100), bl1%
GET (140, 35)-(155, 100), bl2%
GET (190, 35)-(205, 100), bl3%
GET (240, 35)-(255, 100), bl4%

px1% = 10: py1% = 110: px2% = 20: py2% = 175
DRAW "c" + STR$(fo) + "bm10,110s20 fell s6brbf p" + STR$(ge) + "," + STR$(fo)
DRAW "c" + STR$(fo) + "bm30,110s20 ddfeuull s6brbf p" + STR$(ge) + "," + STR$(fo)
DRAW "c" + STR$(fo) + "bm50,110s20 ddddfeuuuull s6brbf p" + STR$(ge) + "," + STR$(fo)
DRAW "c" + STR$(fo) + "bm70,110s20 ddddddfeuuuuuull s6brbf p" + STR$(ge) + "," + STR$(fo)
DRAW "c" + STR$(fo) + "bm90,110s20 ddddddddfeuuuuuuuull s6brbf p" + STR$(ge) + "," + STR$(fo)
DRAW "c" + STR$(fo) + "bm110,110s20 ddddddddddfeuuuuuuuuuull s6brbf p" + STR$(ge) + "," + STR$(fo)
DRAW "c" + STR$(fo) + "bm130,110s20 ddddddddddddfeuuuuuuuuuuuull s6brbf p" + STR$(ge) + "," + STR$(fo)
GET (px1%, py1%)-(px2%, py2%), speer1%
GET (px1% + 20, py1%)-(px2% + 20, py2%), speer2%
GET (px1% + 40, py1%)-(px2% + 40, py2%), speer3%
GET (px1% + 60, py1%)-(px2% + 60, py2%), speer4%
GET (px1% + 80, py1%)-(px2% + 80, py2%), speer5%
GET (px1% + 100, py1%)-(px2% + 100, py2%), speer6%
GET (px1% + 120, py1%)-(px2% + 120, py2%), speer7%
GET (px1% + 140, py1%)-(px2% + 140, py2%), speer8%

zn% = max
xs1% = 93 - zn%: ys1% = 278 - zn%: xs2% = 117 + zn%: ys2% = 307 + zn%
IF gr% = 3 THEN zn% = 3: xs1% = 97 - zn%: ys1% = 288 - zn%: xs2% = 109 + zn%: ys2% = 303 + zn%
xmax = xs2% - xs1%: ymax = ys2% - ys1%
DRAW "bm100,300s" + STR$(gr% * 5) + "c" + STR$(lin) + " br lhuuerrfdd lufs" + STR$(gr%) + "blbhp0," + STR$(lin) + "bfbrs" + STR$(gr% * 5) + "c" + STR$(lin) + " ddlluhu bfbfbd s" + STR$(gr% * 2) + "r udr ububuul bd bhp" + STR$(sklc) + "," + STR$(lin)
DRAW "bm130,300s" + STR$(gr% * 5) + "c" + STR$(lin) + " bduhuuerrfddgdll bubuufedllr s" + STR$(gr%) + "blbhp0," + STR$(lin) + "bfbrbrbep0," + STR$(lin) + "bgblc" + STR$(lin) + "s" + STR$(gr% * 2) + " bdlrrld bd bddludrru bhp" + STR$(sklc) + "," + STR$(lin)
DRAW "bm160,300s" + STR$(gr% * 5) + "c" + STR$(lin) + " br reuuhllgdd rug s" + STR$(gr%) + "brbep0," + STR$(lin) + "bgbls" + STR$(gr% * 5) + "c" + STR$(lin) + " ddrrueu bgbgbd s" + STR$(gr% * 2) + "l udl ububuur bd bep" + STR$(sklc) + "," + STR$(lin)
DRAW "bm190,300s" + STR$(gr% * 5) + "c" + STR$(lin) + " bduhuuerrfddgdll bep" + STR$(sklc) + "," + STR$(lin)
DRAW "bm220,300s" + STR$(gr% * 5) + "c" + STR$(lin) + " br lhuuerrfdd luf s" + STR$(gr%) + "blbhp4," + STR$(lin) + "bfbrs" + STR$(gr% * 5) + "c" + STR$(lin) + " ddlluhu bfbfbd s" + STR$(gr% * 2) + " r udr ububuul bd bhp" + STR$(sklc) + "," + STR$(lin)
DRAW "bm250,300s" + STR$(gr% * 5) + "c" + STR$(lin) + " bduhuuerrfddgdll bubuufedllr s" + STR$(gr%) + "blbhp4," + STR$(lin) + "bfbrbrbep4," + STR$(lin) + "bgblc" + STR$(lin) + "s" + STR$(gr% * 2) + " bdlrrld bd bddludrru bhp" + STR$(sklc) + "," + STR$(lin)
DRAW "bm280,300s" + STR$(gr% * 5) + "c" + STR$(lin) + " br reuuhllgdd rug s" + STR$(gr%) + "brbep4," + STR$(lin) + "bgbls" + STR$(gr% * 5) + "c" + STR$(lin) + " ddrrueu bgbgbd s" + STR$(gr% * 2) + " l udl ububuur bd bep" + STR$(sklc) + "," + STR$(lin)
GET (xs1%, ys1%)-(xs2%, ys2%), skl1a%
GET (xs1% + 30, ys1%)-(xs2% + 30, ys2%), skl2a%
GET (xs1% + 60, ys1%)-(xs2% + 60, ys2%), skl3a%
GET (xs1% + 90, ys1%)-(xs2% + 90, ys2%), skl4%
GET (xs1% + 120, ys1%)-(xs2% + 120, ys2%), skl1b%
GET (xs1% + 150, ys1%)-(xs2% + 150, ys2%), skl2b%
GET (xs1% + 180, ys1%)-(xs2% + 180, ys2%), skl3b%

DRAW "bm200,400s20c1 brbrs8brbrffdddrrrffggllldddddddgghhuuuuuuulllhheerrruuuee bdp9,1c15 fs32drs8fgs32ldds8ghs32uuls8hes32rus8e bdp15,15"
GET (200, 400)-(228, 435), kreuz%

DRAW "bm400,300c" + STR$(fo) + "s20euergdruergdruergdfr eerrflllggffrrrgllhh lgdflhuldflhuldflhuhuu brp" + STR$(ge) + "," + STR$(fo)
DRAW "bm500,300c" + STR$(fo) + "s20euergdruergdruergdfr eeffdhhggffeedgghh lgdflhuldflhuldflhuhuu brp" + STR$(ge) + "," + STR$(fo)
DRAW "a2bm400,400c" + STR$(fo) + "s20euergdruergdruergdfr eerrflllggffrrrgllhh lgdflhuldflhuldflhuhuu brp" + STR$(ge) + "," + STR$(fo)
DRAW "a2bm500,400c" + STR$(fo) + "s20euergdruergdruergdfr eeffdhhggffeedgghh lgdflhuldflhuldflhuhuu brp" + STR$(ge) + "," + STR$(fo)

kx% = 397: ky% = 284: kx2% = 467: ky2% = 326
kxmax% = kx2% - kx%: kymax% = ky2% - ky%:
GET (kx%, ky%)-(kx2%, ky2%), kaefer1%
GET (kx% + 100, ky%)-(kx2% + 100, ky2%), kaefer2%
GET (kx% - kxmax% + 2, ky% + 90)-(kx2% - kxmax% + 5, ky2% + 90), kaefer3%
GET (kx% - kxmax% + 102, ky% + 90)-(kx2% - kxmax% + 105, ky2% + 90), kaefer4%

CLS
RETURN

plan:
w(1, 1, 1) = 0:   w(1, 1, 2) = 0:   w(1, 1, 3) = 64:  w(1, 1, 4) = 5
w(1, 2, 1) = 0:   w(1, 2, 2) = 0:   w(1, 2, 3) = 5:   w(1, 2, 4) = 48
w(1, 3, 1) = 20:  w(1, 3, 2) = 5:   w(1, 3, 3) = 35:  w(1, 3, 4) = 15
w(1, 4, 1) = 35:  w(1, 4, 2) = 10:  w(1, 4, 3) = 64:  w(1, 4, 4) = 15
w(1, 5, 1) = 5:   w(1, 5, 2) = 20:  w(1, 5, 3) = 64:  w(1, 5, 4) = 25
w(1, 6, 1) = 5:   w(1, 6, 2) = 30:  w(1, 6, 3) = 35:  w(1, 6, 4) = 35
w(1, 7, 1) = 10:  w(1, 7, 2) = 40:  w(1, 7, 3) = 25:  w(1, 7, 4) = 41
w(1, 8, 1) = 10:  w(1, 8, 2) = 45:  w(1, 8, 3) = 15:  w(1, 8, 4) = 48
w(1, 9, 1) = 20:  w(1, 9, 2) = 45:  w(1, 9, 3) = 25:  w(1, 9, 4) = 48
w(1, 10, 1) = 30: w(1, 10, 2) = 40: w(1, 10, 3) = 35: w(1, 10, 4) = 48
w(1, 11, 1) = 40: w(1, 11, 2) = 30: w(1, 11, 3) = 45: w(1, 11, 4) = 41
w(1, 12, 1) = 50: w(1, 12, 2) = 30: w(1, 12, 3) = 64: w(1, 12, 4) = 35
w(1, 13, 1) = 45: w(1, 13, 2) = 40: w(1, 13, 3) = 50: w(1, 13, 4) = 41
w(1, 14, 1) = 55: w(1, 14, 2) = 35: w(1, 14, 3) = 64: w(1, 14, 4) = 48
w(1, 15, 1) = 35: w(1, 15, 2) = 46: w(1, 15, 3) = 55: w(1, 15, 4) = 48
w(2, 1, 1) = 0:   w(2, 1, 2) = 0:   w(2, 1, 3) = 64:  w(2, 1, 4) = 5
w(2, 2, 1) = 0:   w(2, 2, 2) = 10:  w(2, 2, 3) = 64:  w(2, 2, 4) = 15
w(2, 3, 1) = 35:  w(2, 3, 2) = 15:  w(2, 3, 3) = 40:  w(2, 3, 4) = 35
w(2, 4, 1) = 0:   w(2, 4, 2) = 20:  w(2, 4, 3) = 30:  w(2, 4, 4) = 25
w(2, 5, 1) = 10:  w(2, 5, 2) = 25:  w(2, 5, 3) = 20:  w(2, 5, 4) = 48
w(2, 6, 1) = 0:   w(2, 6, 2) = 40:  w(2, 6, 3) = 10:  w(2, 6, 4) = 48
w(2, 7, 1) = 25:  w(2, 7, 2) = 25:  w(2, 7, 3) = 30:  w(2, 7, 4) = 40
w(2, 8, 1) = 25:  w(2, 8, 2) = 40:  w(2, 8, 3) = 50:  w(2, 8, 4) = 48
w(2, 9, 1) = 45:  w(2, 9, 2) = 20:  w(2, 9, 3) = 64:  w(2, 9, 4) = 35
w(2, 10, 1) = 50: w(2, 10, 2) = 40: w(2, 10, 3) = 64: w(2, 10, 4) = 41
w(2, 11, 1) = 0:  w(2, 11, 2) = 30: w(2, 11, 3) = 5:  w(2, 11, 4) = 35
w(2, 12, 1) = 55: w(2, 12, 2) = 46: w(2, 12, 3) = 64: w(2, 12, 4) = 48
w(2, 13, 1) = 0: w(2, 13, 2) = 35: w(2, 13, 3) = 2: w(2, 13, 4) = 40
w(3, 1, 1) = 0:   w(3, 1, 2) = 0:   w(3, 1, 3) = 64:  w(3, 1, 4) = 5
w(3, 2, 1) = 60:  w(3, 2, 2) = 0:   w(3, 2, 3) = 64:  w(3, 2, 4) = 48
w(3, 3, 1) = 0:   w(3, 3, 2) = 10:  w(3, 3, 3) = 5:   w(3, 3, 4) = 15
w(3, 4, 1) = 10:  w(3, 4, 2) = 5:   w(3, 4, 3) = 30:  w(3, 4, 4) = 10
w(3, 5, 1) = 10:  w(3, 5, 2) = 15:  w(3, 5, 3) = 30:  w(3, 5, 4) = 20
w(3, 6, 1) = 0:   w(3, 6, 2) = 20:  w(3, 6, 3) = 30:  w(3, 6, 4) = 35
w(3, 7, 1) = 35:  w(3, 7, 2) = 10:  w(3, 7, 3) = 55:  w(3, 7, 4) = 35
w(3, 8, 1) = 0:   w(3, 8, 2) = 40:  w(3, 8, 3) = 55:  w(3, 8, 4) = 41
w(3, 9, 1) = 0:   w(3, 9, 2) = 46:  w(3, 9, 3) = 55:  w(3, 9, 4) = 48
w(3, 10, 1) = 53: w(3, 10, 2) = 40: w(3, 10, 3) = 55: w(3, 10, 4) = 43
w(4, 1, 1) = 0:   w(4, 1, 2) = 0:   w(4, 1, 3) = 5:   w(4, 1, 4) = 48
w(4, 2, 1) = 10:  w(4, 2, 2) = 0:   w(4, 2, 3) = 15:  w(4, 2, 4) = 30
w(4, 3, 1) = 20:  w(4, 3, 2) = 0:   w(4, 3, 3) = 25:  w(4, 3, 4) = 15
w(4, 4, 1) = 30:  w(4, 4, 2) = 0:   w(4, 4, 3) = 64:  w(4, 4, 4) = 5
w(4, 5, 1) = 20:  w(4, 5, 2) = 10:  w(4, 5, 3) = 64:  w(4, 5, 4) = 15
w(4, 6, 1) = 60:  w(4, 6, 2) = 5:   w(4, 6, 3) = 64:  w(4, 6, 4) = 10
w(4, 7, 1) = 20:  w(4, 7, 2) = 20:  w(4, 7, 3) = 64:  w(4, 7, 4) = 25
w(4, 8, 1) = 20:  w(4, 8, 2) = 25:  w(4, 8, 3) = 30:  w(4, 8, 4) = 30
w(4, 9, 1) = 25:  w(4, 9, 2) = 30:  w(4, 9, 3) = 30:  w(4, 9, 4) = 35
w(4, 10, 1) = 15: w(4, 10, 2) = 35: w(4, 10, 3) = 20: w(4, 10, 4) = 40
w(4, 11, 1) = 10: w(4, 11, 2) = 40: w(4, 11, 3) = 30: w(4, 11, 4) = 41
w(4, 12, 1) = 10: w(4, 12, 2) = 41: w(4, 12, 3) = 15: w(4, 12, 4) = 48
w(4, 13, 1) = 20: w(4, 13, 2) = 41: w(4, 13, 3) = 25: w(4, 13, 4) = 48
w(4, 14, 1) = 50: w(4, 14, 2) = 25: w(4, 14, 3) = 64: w(4, 14, 4) = 35
w(4, 15, 1) = 35: w(4, 15, 2) = 30: w(4, 15, 3) = 50: w(4, 15, 4) = 48
w(4, 16, 1) = 55: w(4, 16, 2) = 40: w(4, 16, 3) = 64: w(4, 16, 4) = 48
w(5, 1, 1) = 0:   w(5, 1, 2) = 0:   w(5, 1, 3) = 10:  w(5, 1, 4) = 15
w(5, 2, 1) = 10:  w(5, 2, 2) = 0:   w(5, 2, 3) = 20:  w(5, 2, 4) = 35
w(5, 3, 1) = 25:  w(5, 3, 2) = 0:   w(5, 3, 3) = 50:  w(5, 3, 4) = 41
w(5, 4, 1) = 0:   w(5, 4, 2) = 20:  w(5, 4, 3) = 5:   w(5, 4, 4) = 35
w(5, 5, 1) = 0:   w(5, 5, 2) = 40:  w(5, 5, 3) = 5:   w(5, 5, 4) = 48
w(5, 6, 1) = 10:  w(5, 6, 2) = 40:  w(5, 6, 3) = 20:  w(5, 6, 4) = 48
w(5, 7, 1) = 55:  w(5, 7, 2) = 0:   w(5, 7, 3) = 60:  w(5, 7, 4) = 20
w(5, 8, 1) = 60:  w(5, 8, 2) = 0:   w(5, 8, 3) = 64:  w(5, 8, 4) = 5
w(5, 9, 1) = 60:  w(5, 9, 2) = 10:  w(5, 9, 3) = 64:  w(5, 9, 4) = 20
w(5, 10, 1) = 55: w(5, 10, 2) = 25: w(5, 10, 3) = 64: w(5, 10, 4) = 48
w(5, 11, 1) = 25: w(5, 11, 2) = 46: w(5, 11, 3) = 50: w(5, 11, 4) = 48
w(6, 1, 1) = 0:   w(6, 1, 2) = 0:   w(6, 1, 3) = 55:  w(6, 1, 4) = 5
w(6, 2, 1) = 0:   w(6, 2, 2) = 10:  w(6, 2, 3) = 20:  w(6, 2, 4) = 20
w(6, 3, 1) = 25:  w(6, 3, 2) = 10:  w(6, 3, 3) = 55:  w(6, 3, 4) = 20
w(6, 4, 1) = 50:  w(6, 4, 2) = 5:   w(6, 4, 3) = 55:  w(6, 4, 4) = 10
w(6, 5, 1) = 0:   w(6, 5, 2) = 25:  w(6, 5, 3) = 30:  w(6, 5, 4) = 35
w(6, 6, 1) = 10:  w(6, 6, 2) = 40:  w(6, 6, 3) = 35:  w(6, 6, 4) = 48
w(6, 7, 1) = 35:  w(6, 7, 2) = 25:  w(6, 7, 3) = 55:  w(6, 7, 4) = 48
w(6, 8, 1) = 0:   w(6, 8, 2) = 35:  w(6, 8, 3) = 5:   w(6, 8, 4) = 48
w(6, 9, 1) = 60:  w(6, 9, 2) = 0:   w(6, 9, 3) = 64:  w(6, 9, 4) = 48
w(7, 1, 1) = 0:   w(7, 1, 2) = 0:   w(7, 1, 3) = 5:   w(7, 1, 4) = 48
w(7, 2, 1) = 0:   w(7, 2, 2) = 45:  w(7, 2, 3) = 64:  w(7, 2, 4) = 48
w(7, 3, 1) = 10:  w(7, 3, 2) = 0:   w(7, 3, 3) = 15:  w(7, 3, 4) = 40
w(7, 4, 1) = 20:  w(7, 4, 2) = 0:   w(7, 4, 3) = 25:  w(7, 4, 4) = 40
w(7, 5, 1) = 35:  w(7, 5, 2) = 0:   w(7, 5, 3) = 50:  w(7, 5, 4) = 15
w(7, 6, 1) = 30:  w(7, 6, 2) = 4:   w(7, 6, 3) = 35:  w(7, 6, 4) = 7
w(7, 7, 1) = 25:  w(7, 7, 2) = 10:  w(7, 7, 3) = 30:  w(7, 7, 4) = 15
w(7, 8, 1) = 25:  w(7, 8, 2) = 20:  w(7, 8, 3) = 50:  w(7, 8, 4) = 25
w(7, 9, 1) = 25:  w(7, 9, 2) = 35:  w(7, 9, 3) = 50:  w(7, 9, 4) = 40
w(7, 10, 1) = 55: w(7, 10, 2) = 0:  w(7, 10, 3) = 64: w(7, 10, 4) = 10
w(7, 11, 1) = 55: w(7, 11, 2) = 10: w(7, 11, 3) = 60: w(7, 11, 4) = 40
w(7, 12, 1) = 60: w(7, 12, 2) = 15: w(7, 12, 3) = 64: w(7, 12, 4) = 20
w(7, 13, 1) = 60: w(7, 13, 2) = 35: w(7, 13, 3) = 64: w(7, 13, 4) = 40
w(7, 14, 1) = 40: w(7, 14, 2) = 25: w(7, 14, 3) = 50: w(7, 14, 4) = 27
w(7, 15, 1) = 40: w(7, 15, 2) = 32: w(7, 15, 3) = 50: w(7, 15, 4) = 35
w(7, 16, 1) = 63: w(7, 16, 2) = 25: w(7, 16, 3) = 65: w(7, 16, 4) = 30
w(8, 1, 1) = 0:   w(8, 1, 2) = 45:  w(8, 1, 3) = 64:  w(8, 1, 4) = 48
w(8, 2, 1) = 0:   w(8, 2, 2) = 0:   w(8, 2, 3) = 5:   w(8, 2, 4) = 10
w(8, 3, 1) = 0:   w(8, 3, 2) = 15:  w(8, 3, 3) = 5:   w(8, 3, 4) = 20
w(8, 4, 1) = 0:   w(8, 4, 2) = 25:  w(8, 4, 3) = 10:  w(8, 4, 4) = 30
w(8, 5, 1) = 0:   w(8, 5, 2) = 35:  w(8, 5, 3) = 5:   w(8, 5, 4) = 40
w(8, 6, 1) = 10:  w(8, 6, 2) = 0:   w(8, 6, 3) = 20:  w(8, 6, 4) = 45
w(8, 7, 1) = 25:  w(8, 7, 2) = 0:   w(8, 7, 3) = 35:  w(8, 7, 4) = 5
w(8, 8, 1) = 35:  w(8, 8, 2) = 0:   w(8, 8, 3) = 50:  w(8, 8, 4) = 45
w(8, 9, 1) = 50:  w(8, 9, 2) = 15:  w(8, 9, 3) = 55:  w(8, 9, 4) = 45
w(8, 10, 1) = 55: w(8, 10, 2) = 40: w(8, 10, 3) = 64: w(8, 10, 4) = 45
w(8, 11, 1) = 55: w(8, 11, 2) = 0:  w(8, 11, 3) = 64: w(8, 11, 4) = 10
w(8, 12, 1) = 60: w(8, 12, 2) = 15: w(8, 12, 3) = 64: w(8, 12, 4) = 35
w(8, 13, 1) = 25: w(8, 13, 2) = 10: w(8, 13, 3) = 30: w(8, 13, 4) = 45
w(9, 1, 1) = 0:   w(9, 1, 2) = 0:   w(9, 1, 3) = 5:   w(9, 1, 4) = 10
w(9, 2, 1) = 10:  w(9, 2, 2) = 0:   w(9, 2, 3) = 55:  w(9, 2, 4) = 10
w(9, 3, 1) = 30:  w(9, 3, 2) = 10:  w(9, 3, 3) = 60:  w(9, 3, 4) = 45
w(9, 4, 1) = 0:   w(9, 4, 2) = 15:  w(9, 4, 3) = 25:  w(9, 4, 4) = 35
w(9, 5, 1) = 0:   w(9, 5, 2) = 40:  w(9, 5, 3) = 30:  w(9, 5, 4) = 45
w(9, 6, 1) = 60:  w(9, 6, 2) = 0:   w(9, 6, 3) = 65:  w(9, 6, 4) = 48
w(9, 7, 1) = 0:   w(9, 7, 2) = 45:  w(9, 7, 3) = 64:  w(9, 7, 4) = 48
b(1, 1, 1) = 50: b(1, 1, 2) = 15
b(2, 1, 1) = 50: b(2, 1, 2) = 35
b(3, 1, 1) = 15: b(3, 1, 2) = 10
b(4, 1, 1) = 55: b(4, 1, 2) = 35
b(4, 2, 1) = 59: b(4, 2, 2) = 35
b(5, 1, 1) = 25: b(5, 1, 2) = 41
b(5, 2, 1) = 35: b(5, 2, 2) = 41
b(5, 3, 1) = 45: b(5, 3, 2) = 41
b(7, 1, 1) = 40: b(7, 1, 2) = 27
p(1, 1, 1) = 40: p(1, 1, 2) = 15
p(1, 2, 1) = 34: p(1, 2, 2) = 15
p(1, 3, 1) = 28: p(1, 3, 2) = 15
p(1, 4, 1) = 22: p(1, 4, 2) = 15
p(7, 1, 1) = 40: p(7, 1, 2) = 40
zx% = 60: zy% = 60: zscr% = 1
RETURN

explosion:
FOR l% = 100 TO ba * 10 STEP -1
 FOR rad2% = 1 TO 16 STEP 1
 CIRCLE (x + xmax / 2, y + ymax / 2), rad2%, l% / 10
 NEXT
SOUND col%, .1
NEXT

ende:
LOCATE 15, 36: PRINT "GAME OVER": SLEEP 3
IF eingabe$ <> CHR$(27) THEN GOSUB start

