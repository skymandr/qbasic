DECLARE SUB bigletter (Word$, Size%, Clr%, Style%, Position%)
'--------------------------------Fighting Zone--------------------------------

CHDIR "c:\"
ON ERROR GOTO skip
pook:
OPEN "c:\dos\fighthsc.dat" FOR INPUT AS #2
INPUT #2, hsa, hsb, hsc, hsd, hse, hsan$, hsbn$, hscn$, hsdn$, hsen$
CLOSE #2
dookie:
GOTO hobble
skip:
hsan$ = "Mr. Nobody"
hsbn$ = "Mr. Nobody"
hscn$ = "Mr. Nobody"
hsdn$ = "Mr. Nobody"
hsen$ = "Mr. Nobody"
OPEN "c:\dos\fighthsc.dat" FOR OUTPUT AS #2
WRITE #2, hsa, hsb, hsc, hsd, hse, hsan$, hsbn$, hscn$, hsdn$, hsen$

 CLOSE #2
 GOTO pook
hobble:
ON ERROR GOTO qw
GOTO op
qw:
CLS
BEEP
PRINT "There has been an error in this program. "
SLEEP 500
CLS
GOTO maing
op:

'name$
'col-color
level = 1

 sc = 0

soundd = 1
CLS
GOTO pup
pop:
IF col = 1 THEN COLOR 0, 15
IF col = 2 THEN COLOR 15, 0
IF col = 3 THEN COLOR 4, 15
IF col = 4 THEN COLOR 4, 0
IF col = 5 THEN COLOR 0, 4
IF col = 6 THEN COLOR 15, 4

CLS
PRINT "Your data is loaded."
SLEEP 500
CLS
GOTO afterload
pup:
COLOR 13, 8
CLS
SCREEN 12

FOR h = 1 TO 3
IF h = 3 GOTO qasw
   COLOR 7
FOR x = 1 TO 500
c = INT(RND * 639) + 1
r = INT(RND * 479) + 1
t = .5
CIRCLE (c, r), t
NEXT x
COLOR 0
FOR x = 1 TO 500
c = INT(RND * 639) + 1
r = INT(RND * 479) + 1
t = 10
CIRCLE (c, r), t
NEXT x

NEXT h
qasw: COLOR 5
    FOR i% = 440 TO 1000 STEP 5
 
    NEXT i%


FOR s = 1 TO 11
PRINT
NEXT s

' (size, color, style, position)
' 1 solid 2 squares 3 slant\ 4 slant/ 5 vertical lines 6 horizontal lines
'7 crosses 8 Xs 9 outline 10 spider web 11 bubbles 12 circles 13 shadow
'14 separated squares 15 building 16 stars
bigletter "MICHAEL", 8, 2, 16, 50
bigletter "STEIN", 8, 4, 10, 150
bigletter "SOFTWARE", 8, 1, 11, 250
bigletter "INC.", 8, 6, 15, 350
FOR d = 1 TO 5000
NEXT d
CLS
SCREEN 0
PRINT "-------------------------Presents---------------------------------"
FOR d = 1 TO 7000
NEXT d
CLS
PRINT "------------------------Fighting Zone-----------------------------"
PRINT "By Michael Stein"
DO
LOOP UNTIL INKEY$ = CHR$(13)

maing:
CLS
PRINT "Choose a choice:"
PRINT "0- Quit"
PRINT "1- Play"
PRINT "2- Load"
PRINT "3- Help"
PRINT "4- Sound"
PRINT "5- High Scores"
INPUT o
IF o = 0 THEN SYSTEM
CLS
IF o = 1 GOTO doob
IF o = 2 GOTO load
IF o = 3 GOTO help
IF o = 4 GOTO asound
IF o = 5 GOTO hscores
GOTO maing
main:
o = 10
PRINT "0- Quit"
PRINT "1- Continue"
PRINT "2- Load"
PRINT "3- Sound"
INPUT o
IF o = 0 THEN GOTO maing
CLS
IF o = 1 GOTO mainf
IF o = 2 GOTO load
IF o = 3 GOTO sounda
GOTO main
doob: CLS
PRINT "Welcome to the fighting zone.  You must face dangerous fighters that"
PRINT "could kill you in 10 seconds flat.  Be prepared!  Also, what is your name"
INPUT name$
ght:
CLS
PRINT "Okay, "; name$; ".  Choose a color."
PRINT "1-Black on white"
PRINT "2-White on black"
PRINT "3-Red on white"
PRINT "4-Red on black"
PRINT "5-Black on red"
PRINT "6-White on red"
INPUT col
CLS
IF col > 6 OR col < 1 GOTO ght
IF col = 1 THEN COLOR 0, 15
IF col = 2 THEN COLOR 15, 0
IF col = 3 THEN COLOR 4, 15
IF col = 4 THEN COLOR 4, 0
IF col = 5 THEN COLOR 0, 4
IF col = 6 THEN COLOR 15, 4
PRINT "Good choice.  Now, get ready to fight!"
SLEEP 500
CLS
start:
foobie = 0
LET oname$ = "Ima"
LET ulife = 50
LET olife = 15
onamef$ = "Ima P. Brain"
nextguy:
afterload:
 IF foobie = 1 THEN GOTO start
CLS
IF imaded = 1 AND billded = 0 THEN
oname$ = "Bill"
onamef$ = "Bill E. Goat"
LET ulife = 50
LET olife = 20
END IF
IF billded = 1 AND jumboded = 0 THEN
oname$ = "Jumbo"
onamef$ = "Jumbo E. Normus"
LET ulife = 50
LET olife = 25
END IF
IF jumboded = 1 AND merlded = 0 THEN
oname$ = "Merlin"
onamef$ = "Merlin the Magician"
LET ulife = 50
LET olife = 30
END IF
IF merlded = 1 AND tomded = 0 THEN
oname$ = "Tommy"
onamef$ = "Tommy Hawk"
LET ulife = 50
LET olife = 35
END IF
IF tomded = 1 AND fredded = 0 THEN
oname$ = "Freddie"
onamef$ = "Flying Fists Freddie"
LET ulife = 50
LET olife = 40
END IF
IF fredded = 1 AND ninded = 0 THEN
oname$ = "Ninja"
onamef$ = "Ninja (real name unknown)"
LET ulife = 50
LET olife = 45
END IF
IF ninded = 1 AND shadded = 0 THEN
oname$ = "Shadow"
onamef$ = "The Shadow"
LET ulife = 50
LET olife = 50
END IF
IF shadded = 1 AND botded = 0 THEN
oname$ = "Robo"
onamef$ = "RoboBot"
LET ulife = 50
LET olife = 55
END IF
IF botded = 1 THEN
oname$ = "Mike"
onamef$ = "Michael Stein THE CHAMP!"
LET ulife = 50
LET olife = 60
END IF
LET olife = olife + xtra
IF bonus > 0 THEN
LET ulife = bonus
END IF
IF bigboy = 1 THEN LET olife = 5
PRINT "The Matchup:"; name$; " vs. "; onamef$; "."
IF soundd = 1 THEN
'nc,p1,p2,dp
    nc = 3
    p1 = 500
    p2 = 2000
    dp = 50
    d = 1
    FOR J = 1 TO nc
    FOR P = p1 TO p2 STEP dp
    SOUND P, d
    NEXT P
    NEXT J
   END IF


SLEEP 500
CLS
GOTO popli
mainf:
IF soundd = 1 THEN
'nc,p1,p2,dp
    nc = 3
    p1 = 50
    p2 = 200
    dp = 50
    d = 1
    FOR J = 1 TO nc
    FOR P = p1 TO p2 STEP dp
    SOUND P, d
    NEXT P
    NEXT J
 END IF

popli:
IF oname$ = "" THEN GOTO doob
CLS
PRINT "Your Energy: "; ulife; ".  "; oname$; "'s Energy: "; olife; "."
PRINT "Level "; level; "."
PRINT "Score "; sc; "."
PRINT "Choose an action, "; name$; ":"
PRINT ""
PRINT "1-Jab Punch- Power2 Hit%90 "
PRINT "2-Medium Punch- Power5 Hit%35"
PRINT "3-Strong Punch- Power10 Hit%15"
PRINT "4-Quick Kick- Power6 Hit%60"
PRINT "5-Medium Kick- Power10 Hit%25"
PRINT "6-Brutal Kick- Power 16 Hit%12"
PRINT "7-Sweep Kick- Power8 Hit%10- If this connects, You get a free shot!"
PRINT "8-Roundhouse Kick- Power10 Hit%20"
PRINT "9-Hook Punch- Power 8 hit%30"
PRINT "10-Low Blow Punch- Power10 hit%15"
PRINT "11-Special Moves- Super Strong Moves"
PRINT "12-Take a quick breather- Restores energy 2-5 points"
PRINT "13-Main Menu"
INPUT q$
IF q$ = "1" GOTO jab
IF q$ = "2" GOTO mp
IF q$ = "3" GOTO stp
IF q$ = "4" GOTO qk
IF q$ = "5" GOTO mk
IF q$ = "6" GOTO bk
IF q$ = "7" GOTO sk
IF q$ = "8" GOTO rk
IF q$ = "9" GOTO hk
IF q$ = "10" GOTO lb
IF q$ = "11" GOTO sp
IF q$ = "12" GOTO eng
IF q$ = "13" GOTO main
IF q$ = "GNITHGIF" GOTO super
GOTO mainf
jab:
'Pow2 Hit90
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 90 THEN
 PRINT "You do a quick Jab but "; oname$; " dodges it."
 LET olife = olife + 1
 GOTO oattack
 END IF
 PRINT "You do a Jab and it hits "; oname$; " right in the forehead."
 LET olife = olife - 2
 IF olife < 1 GOTO uwin
 GOTO oattack
mp:
'Pow5 Hit35
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 35 THEN
 PRINT "You lash out with a Medium Punch, but you miss!"
 LET olife = olife + 1
 GOTO oattack
 END IF
 PRINT "Your Medium Punch hits "; oname$; " in the stomach.  "; oname$; " backs away."
 LET olife = olife - 5
 IF olife < 1 GOTO uwin
 GOTO oattack
stp:
'Pow10 Hit15
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 15 THEN
 PRINT "You punch with all your might, but you miss!"
 LET olife = olife + 1
 GOTO oattack
 END IF
 PRINT "Your Strong Punch connects and you let out a triumphant cheer."
 LET olife = olife - 10
 IF olife < 1 GOTO uwin
 GOTO oattack

qk:
'Pow6 Hit60
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 60 THEN
 PRINT "You come out with a Quick Kick, but is easily blocked. "
 LET olife = olife + 1
 GOTO oattack
 END IF
 PRINT "Your Quick Kick hits "; oname$; " in the ribs.  You smile as they crack."
 LET olife = olife - 6
 IF olife < 1 GOTO uwin
 GOTO oattack

mk:
'Pow10 Hit25
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
  IF x > 25 THEN
  PRINT "Your Medium Kick misses by a mile."
  LET olife = olife + 1
  GOTO oattack
  END IF
  PRINT "Your kick hits your opponent.  Your opponent backs away."
  LET olife = olife - 10
  IF olife < 1 GOTO uwin
  GOTO oattack

bk:
'Pow16 Hit12
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x > 12 THEN
PRINT "Your Brutal Kick misses BIG time.  "; oname$; " prepares for an attack."
LET olife = olife + 1
GOTO oattack
END IF
PRINT "WOWIE!  Your Brutal Kick connects with "; oname$; ".  "; oname$; ""
PRINT "staggers away painfully."
LET olife = olife - 16
IF olife < 1 GOTO uwin
GOTO oattack
sk:
'Pow8 Hit10
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x > 10 THEN
PRINT "Your opponent jumps over your Sweep Kick."
LET olife = olife + 2
GOTO oattack
END IF
PRINT "SMOKIN'!  The Sweep Kick knocks "; oname$; " down!  You may attack"
PRINT "again."
LET olife = olife - 8
IF olife < 1 GOTO uwin
SLEEP 50
CLS
GOTO mainf
rk:
'Pow10 Hit20
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 20 THEN
 PRINT "Your Roundhouse Kick is easily dodged, leaving you standing there "
 PRINT "dizzily."
 LET olife = olife + 1
 GOTO oattack
 END IF
  PRINT "Your Roundhouse Kick hits "; oname$; "'s face three times."
 LET olife = olife - 10
 IF olife < 1 GOTO uwin
 GOTO oattack


hk:
'Pow6 Hit30
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
  IF x > 30 THEN
  PRINT "Your opponent ducks as your hook punch is thrown."
 LET olife = olife + 1
 GOTO oattack
 END IF
 PRINT "The punch hits your opponent in the side of it's head."
 LET olife = olife - 8
 IF olife < 1 GOTO uwin
 GOTO oattack
lb:
 'Pow10 Hit15
 CLS
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 15 THEN
 PRINT "Your opponent dodges, and then smacks you for being so rude."
 LET olife = olife + 1
 LET ulife = ulife - 1
 IF ulife < 1 GOTO owin
 GOTO oattack
 END IF
 PRINT "The punch is successfull!  "; oname$; " backs away whimpering."
 LET olife = olife - 10
 IF olife < 1 GOTO uwin
 GOTO oattack
eng:
CLS
RANDOMIZE TIMER
LET x = INT((RND) * 4) + 2
PRINT "Your quick breather gained you "; x; " energy points, now your ready for action."
LET ulife = ulife + x
GOTO oattack
sp:
CLS
IF imaded = 0 THEN PRINT "Sorry. No special moves yet.  Type 0 and press enter"
PRINT "0-goto main selection screen"
IF imaded = 1 THEN PRINT "1-Master Punch-Power12  Hit%10"
IF billded = 1 THEN PRINT "2-Head Ram-Power11 Hit%15"
IF jumboded = 1 THEN PRINT "3-Belly Bump-Power15 Hit%5"
IF merlded = 1 THEN PRINT "4-Flaming Hand Punch-Power13 Hit%13"
IF tomded = 1 THEN PRINT "5-Flying Tomahawk-Power15 Hit%10"
IF fredded = 1 THEN PRINT "6-Rapid Punch-Power20 Hit%7"
IF ninded = 1 THEN PRINT "7-Ninja Slash-Power17 Hit%10"
IF shadded = 1 THEN PRINT "8-Shadow Uppercut-Power25 Hit%10"
IF botded = 1 THEN PRINT "9-RoboPunch-Power25 Hit%15"
INPUT spe

CLS
IF spe = 0 GOTO mainf
IF spe = 1 AND imaded = 1 GOTO maspun
IF spe = 2 AND billded = 1 GOTO hedram
IF spe = 3 AND jumboded = 1 GOTO belbmp
IF spe = 4 AND merlded = 1 GOTO hotpun
IF spe = 5 AND tomded = 1 GOTO tomhwk
IF spe = 6 AND fredded = 1 GOTO rappun
IF spe = 7 AND ninded = 1 GOTO slash
IF spe = 8 AND shadded = 1 GOTO shadow
IF spe = 9 AND botded = 1 GOTO robpun
IF spe = 58 THEN
PRINT "58-Cory's fully loaded M-16, Power= leathel, Hit%100"
PRINT ""
PRINT "Are you shure you want to use this?"
PRINT " -- No, I'll kick "; oname$; "'s butt the old fashion way."
PRINT " -- Yes, it's time for "; oname$; " to die."
PRINT ""
INPUT cspe$
IF UCASE$(cspe$) = "Y" OR UCASE$(cspe$) = "yes" THEN
GOTO cory
ELSE
GOTO popli
END IF
END IF
GOTO sp
cory:
CLS
PRINT "You whip out the M-16 and let it rip, "; oname$; " becomes fertilizer."
GOTO uwin

robpun:
'Pow25 Hit 15
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x < 15 THEN
PRINT "Mike ducks your RoboPunch."
LET olife = olife + 4
GOTO oattack
END IF
PRINT "The RoboPunch splatters Mike's head."
LET olife = olife - 25
IF olife < 1 GOTO uwin
PRINT "But since this is a computer game, Mike quickly grows a new one."
GOTO oattack
shadow:
'Pow25 Hit10
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
  IF x > 10 THEN
  PRINT "Your Shadow Uppercut is easily ducked by "; oname$; "."
  LET olife = olife + 4
  GOTO oattack
  END IF
  PRINT "Your Shadow Uppercut sends your opponent up about 500 feet in the air."
LET olife = olife - 25
IF olife < 1 GOTO uwin
GOTO oattack
slash:
'Pow17 Hit10
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
  IF x > 10 THEN
  PRINT "Your slash completely misses your opponent."
  LET olife = olife + 4
  GOTO oattack
  END IF
  PRINT "You slash your opponent and his......Well, let's just say it wasn't"
  PRINT "pretty."
  LET olife = olife - 17
  IF olife < 1 GOTO owin
  GOTO oattack
rappun:
'Pow20 Hit7
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 7 THEN
 PRINT "You try to Rapid Punch "; oname$; ", but you realize you are punching air!"
 LET olife = olife + 4
 GOTO oattack
 END IF
 PRINT "Your Rapid Punches send your opponent sprawling on the floor."
 LET olife = olife - 20
 IF olife < 1 GOTO uwin
 GOTO oattack
tomhwk:
'Pow15 Hit10
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 10 THEN
 PRINT "Your Flying Tomahawk sails right by your opponent."
 LET olife = olife + 4
 GOTO oattack
 END IF
 PRINT "The Tomahawk chops off a good portion of your opponents shoulder."
 LET olife = olife - 15
 IF olife < 1 GOTO uwin
 GOTO oattack
hotpun:
'Pow13 Hit13
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 13 THEN
 PRINT ""; oname$; " dodges your punch, and attacks!"
 LET olife = olife + 4
 GOTO oattack
 END IF
 PRINT "Your Flaming Hand Punch burns your opponent very badly."
 LET olife = olife - 13
 IF olife < 1 GOTO uwin
 GOTO oattack
maspun:
'Pow12 Hit 10
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 10 THEN
 PRINT "Your Master Punch is dodged."
 LET olife = olife + 4
 GOTO oattack
 END IF
 PRINT "Your Master Punch connects with great force, sending your opponent to"
 PRINT "the floor."
 LET olife = olife - 12
 IF olife < 1 GOTO uwin
 GOTO oattack
hedram:
'Pow11 Hit 15
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 15 THEN
 PRINT "You put your head down and race towards "; oname$; " ,but go right past"
 PRINT "your target!"
 LET olife = olife + 4
 GOTO oattack
 END IF
 PRINT "You ram into "; oname$; " and he falls to the ground painfully."
 LET olife = olife - 11
 IF olife < 1 GOTO uwin
 GOTO oattack
belbmp:
'Pow15 Hit 5
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
 IF x > 5 THEN
 PRINT "You bump your belly at "; oname$; ", but miss!"
 LET olife = olife + 4
 GOTO oattack
 END IF
 PRINT "Your belly bumps into "; oname$; " and WHAM!  "; oname$; " gets up from"
 PRINT "the floor and attacks."
 LET olife = olife - 15
 IF olife < 1 GOTO uwin
 GOTO oattack
oattack:
IF soundd = 1 THEN
'nc,p1,p2,dp
    nc = 3
    p1 = 50
    p2 = 200
    dp = 50
    d = 1
    FOR J = 1 TO nc
    FOR P = p1 TO p2 STEP dp
    SOUND P, d
    NEXT P
    NEXT J
 END IF

RANDOMIZE TIMER
 LET x = INT((RND) * 12) + 1
 IF x = 1 GOTO ojab
 IF x = 2 GOTO omp
 IF x = 3 GOTO osp
 IF x = 4 GOTO oqk
 IF x = 5 GOTO omk
 IF x = 6 GOTO obk
 IF x = 7 GOTO osk
 IF x = 8 GOTO ork
 IF x = 9 GOTO ohk
 IF x = 10 GOTO olb
 IF x = 11 GOTO eng2
 IF x = 12 GOTO ospe
ospe:
PRINT
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
58 PRINT oname$; " pulls out Cory's M-16 and pumps 58 rounds into your body. I have"
PRINT "never seen a man more dead than you!"
GOTO owin
SLEEP 500
END IF

IF oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 9) + 1
IF x = 1 THEN GOTO 10
IF x = 2 THEN GOTO 20
IF x = 3 THEN GOTO 30
IF x = 4 THEN GOTO 40
IF x = 5 THEN GOTO 50
IF x = 6 THEN GOTO 60
IF x = 7 THEN GOTO 70
IF x = 8 THEN GOTO 80
IF x = 9 THEN GOTO 90
GOTO oattack
END IF

10 IF oname$ = "Ima" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 10 THEN
PRINT oname$; " throughs his MasterPunch but you easily dodge it."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; " throughs his MasterPunch and it nails you right in the face."
LET ulife = ulife - 12
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
END IF

20 IF oname$ = "Bill" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 15 THEN
PRINT oname$; "'s Head Ram went flying right by you."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; "'s Head Ram flew right into you, and your seeing a couple stars."
LET ulife = ulife - 11
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
END IF

30 IF oname$ = "Jumbo" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 5 THEN
PRINT oname$; " came flying through the air with his Belly Bump but you stepped"
PRINT "out of his way just in time."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; "'s Belly Bump pounds you straight to the ground."
LET ulife = ulife - 15
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
END IF

40 IF oname$ = "Merlin" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 13 THEN
PRINT oname$; "'s Flaming Hand Punch gets put out by your quick dodge of the head."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; "'s Flaming Hand Punch manages to light up your life with pain."
LET ulife = ulife - 13
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
END IF

50 IF oname$ = "Tommy" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 10 THEN
PRINT oname$; "'s Flying Tomahawk slips and flies off into the middle of nowhere."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; "'s Flying Tomahawk takes a good chunck out of your leg."
LET ulife = ulife - 15
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
END IF

60 IF oname$ = "Freddie" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 7 THEN
PRINT oname$; "'s Rapid Punch manages to hit everything except you."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; "'s Rapid Punch sends your head bouncing like a speed bag."
LET ulife = ulife - 20
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
END IF

70 IF oname$ = "Ninja" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 10 THEN
PRINT "You excape "; oname$; "'s Ninja Slash with only a hair cut."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; "'s Ninja Slash slices you, and all of a sudden, everything has a"
PRINT "red tinted color to it."
LET ulife = ulife - 17
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
END IF

80 IF oname$ = "Shadow" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 10 THEN
PRINT oname$; "'s Shadow Upercut went sailing right by you after a quick duck."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; "'s Shadow Upercut nails your chin and sends you flying throug the sky."
LET ulife = ulife - 25
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
END IF

90 IF oname$ = "Robo" OR oname$ = "Mike" THEN
RANDOMIZE TIMER
LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 15 THEN
PRINT oname$; "'s RoboPunch hits only air after your duck."
LET ulife = ulife + 1
SLEEP 500
CLS
GOTO mainf
END IF
PRINT oname$; "'s RoboPunch knocks your head clean off."
LET ulife = ulife - 25
IF ulife < 1 GOTO owin
PRINT "But you find it and put it back on."
SLEEP 500
GOTO mainf
END IF
GOTO oattack

eng2:
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 4) + 2
 PRINT oname$; " took a breather and gained himself "; x; " energy points."
 LET olife = olife + x
 SLEEP 500
 CLS
 GOTO mainf

ojab:
'Pow2 Hit80
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
 IF x > 90 THEN
 PRINT ""; oname$; " does a quick Jab but you dodge it."
 LET ulife = ulife + 1
 SLEEP 500
 CLS
 GOTO mainf
 END IF
 PRINT ""; oname$; " does a Jab and it hits you right in the forehead."
 LET ulife = ulife - 2
 IF ulife < 1 GOTO owin
 SLEEP 500
 GOTO mainf
omp:
'Pow5 Hit35
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
 IF x > 35 THEN
 PRINT ""; oname$; " lashes out with a Medium Punch, but misses!"
 LET ulife = ulife + 1
 SLEEP 500
 GOTO mainf
 END IF
 PRINT ""; oname$; "'s Medium Punch hits you in the stomach.  You back away."

 LET ulife = ulife - 5
 IF ulife < 1 GOTO owin
 SLEEP 500
 GOTO mainf
osp:
'Pow10 Hit10
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
 IF x > 15 THEN
 PRINT ""; oname$; " punches with super hard, but it misses!"
 LET ulife = ulife + 1
 SLEEP 500
 GOTO mainf
 END IF
 PRINT ""; oname$; "'s Strong Punch connects and you stumble to the ground."
 LET ulife = ulife - 10
 IF ulife < 1 GOTO owin
 SLEEP 500
 GOTO mainf

oqk:
'Pow3 Hit60
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
 IF x > 60 THEN
 PRINT ""; oname$; " comes out with a Quick Kick, but it is easily blocked. "
 LET ulife = ulife + 1
 SLEEP 500
 GOTO mainf
 END IF
 PRINT ""; oname$; "'s  Quick Kick hits you in the ribs.  OW!"
 LET ulife = ulife - 6
 IF ulife < 1 GOTO owin
 SLEEP 500
 GOTO mainf

omk:
'Pow7 Hit25
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
  IF x > 25 THEN
  PRINT ""; oname$; "'s Medium Kick misses by a mile."
  LET ulife = ulife + 1
  SLEEP 500
  GOTO mainf
  END IF
  PRINT ""; oname$; "'s Medium Kick hits you.  You aren't happy."
  LET ulife = ulife - 10
  IF ulife < 1 GOTO owin
  SLEEP 500
  GOTO mainf

obk:
'Pow12 Hit6
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 12 THEN
PRINT ""; oname$; "'s Brutal Kick misses BIG time.  Duh!"
LET ulife = ulife + 1
SLEEP 500
GOTO mainf
END IF
PRINT "WOWIE!  "; oname$; "'s  Brutal Kick connects with you.  OOOWWWCCCHHH!!!"
LET ulife = ulife - 16
IF ulife < 1 GOTO owin
SLEEP 500
GOTO mainf
osk:
'Pow3 Hit10
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
IF x > 10 THEN
PRINT "You jump over your opponent's Sweep Kick."
LET ulife = ulife + 1
SLEEP 500
GOTO mainf
END IF
PRINT "SMOKIN'!  "; oname$; "'s Sweep Kick knocks you down!.  "
PRINT ""; oname$; " attacks again."
LET ulife = ulife - 8
IF ulife < 1 GOTO owin
SLEEP 500
GOTO oattack
ork:
'Pow8 Hit20
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
 IF x > 20 THEN
 PRINT ""; oname$; "'s Roundhouse Kick is easily doged."
 LET ulife = ulife + 1
 SLEEP 500
 GOTO mainf
 END IF
  PRINT ""; oname$; "'s  Roundhouse Kick hits your face three times.  OWCH"
 LET ulife = ulife - 10
 IF ulife < 1 GOTO owin
 SLEEP 500
 GOTO mainf


ohk:
'Pow6 Hit30
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
  IF x > 30 THEN
  PRINT "You duck as your opponent's hook punch is thrown."
  LET ulife = ulife + 1
  SLEEP 500
  GOTO mainf
 END IF
 PRINT ""; oname$; "'s Hook Punch hits you in the side of your head."
 LET ulife = ulife - 8
 IF ulife < 1 GOTO owin
 SLEEP 500
 GOTO mainf
olb:
 'Pow9 Hit15
 PRINT
 RANDOMIZE TIMER
 LET x = INT((RND) * 100) + 1
IF x = 58 THEN
GOTO 58
END IF
 IF x > 15 THEN
 PRINT "You dodge "; oname$; "'s Low Blow and slap your opponent for being so"
 PRINT "rude. "
 LET ulife = ulife + 1
 SLEEP 500
 LET olife = olife - 1
 IF olife < 1 GOTO uwin
 GOTO mainf
 END IF
 PRINT ""; oname$; "'s Low Blow punch is successfull! you back away whimpering."
 LET ulife = ulife - 10
 IF ulife < 1 GOTO owin
 SLEEP 500
 GOTO mainf

uwin:
SLEEP 15
CLS
PRINT "And the winner is........"
SLEEP 2
PRINT name$
PRINT "(applause)"
IF soundd = 1 THEN
'nc,p1,p2,dp
    nc = 3
    p1 = 200
    p2 = 1000
    dp = 50
    d = 1
    FOR J = 1 TO nc
    FOR P = p1 TO p2 STEP dp
    SOUND P, d
    NEXT P
    NEXT J
 END IF

INPUT dlkjdf$
IF oname$ = "Ima" THEN
imaded = 1
SLEEP 500
CLS
LET scorb = scorb + 1
LET sc = sc + scorb
PRINT "You have defeated Ima P. Brain and received the Special Move"
PRINT "---------------------------Master Punch--------------------------"
END IF
IF oname$ = "Bill" THEN
billded = 1
SLEEP 500
CLS
LET scorb = scorb + 1
LET sc = sc + scorb
PRINT "You have defeated Bill E. Goat and received the Special Move"
PRINT "----------------------------Head Ram------------------------------"
END IF
IF oname$ = "Jumbo" THEN
jumboded = 1
SLEEP 500
CLS
scorb = scorb + 1
sc = sc + scorb
PRINT "You have defeated Jumbo E. Normus and received the Special Move"
PRINT "---------------------------Belly Bump------------------------------"
END IF
IF oname$ = "Merlin" THEN
merlded = 1
SLEEP 500
CLS
scorb = scorb + 1
sc = sc + scorb
PRINT "You have defeated Merlin the Magician and received the Special Move"
PRINT "--------------------------Flaming Hand Punch---------------------------"
END IF
IF oname$ = "Tommy" THEN
tomded = 1
SLEEP 500
CLS
scorb = scorb + 1
sc = sc + scorb
PRINT "You have defeated Tommy Hawk and received the Special Move"
PRINT "--------------------Flying Tomahawk------------------------"
END IF
IF oname$ = "Freddie" THEN
fredded = 1
SLEEP 500
CLS
scorb = scorb + 1
sc = sc + scorb
PRINT "You have defeated Flying Fists Freddie and received the Special Move"
PRINT "-----------------------------Rapid Punch----------------------------"
END IF
IF oname$ = "Ninja" THEN
ninded = 1
SLEEP 500
CLS
scorb = scorb + 1
sc = sc + scorb
PRINT "You have defeated Ninja and received the Special Move"
PRINT "----------------------Ninja Slash---------------------"
END IF
IF oname$ = "Shadow" THEN
shadded = 1
SLEEP 500
CLS
scorb = scorb + 1
sc = sc + scorb
PRINT "You have defeated The Shadow and received the Special Move"
PRINT "--------------------Shadow Uppercut-------------------"
END IF
IF oname$ = "Robo" THEN
botded = 1
SLEEP 500
CLS
scorb = scorb + 1
sc = sc + scorb
PRINT "You have defeated RoboBot and received the Special Move"
PRINT "--------------------Robo Punch-------------------------"
PRINT "*******************************************************"
PRINT "*                   Get ready for                     *"
PRINT "*                   Michael Stein                     *"
PRINT "*                   The CHAMPION!                    *"
PRINT "*                (at least currently)                 *"
PRINT "*******************************************************"
END IF
IF oname$ = "Mike" THEN
SLEEP 500
CLS
PRINT "*******************************************************"
PRINT "*              You are the new champion!              *"
PRINT "*     You have beaten all the warriors and claimed    *"
PRINT "*                THE 1ST PLACE TROPHY!                *"
PRINT "*       You will now start over, but the opponents    *"
PRINT "*            will be MUCH harder.  Good Luck!         *"
PRINT "*******************************************************"
LET imaded = 0
scorb = scorb + 1
sc = sc + scorb
LET billded = 0
LET jumboded = 0
LET merlded = 0
LET tomded = 0
LET fredded = 0
LET ninded = 0
LET shadded = 0
LET botded = 0
LET xtra = xtra + 20
LET foobie = 1
LET level = level + 1
END IF
SLEEP 500
INPUT lskfjlksjf$

CLS
PRINT "Do you want to save your game?"
INPUT h$
IF UCASE$(h$) = "Y" OR UCASE$(h$) = "YES" THEN GOTO save
GOTO nextguy
save:
gret:
CLS
PRINT "Enter your data filename to save your progress."
fit$ = ".fit"
INPUT po1$
poo$ = po1$ + fit$
PRINT
PRINT poo$
OPEN poo$ FOR OUTPUT AS #1
WRITE #1, name$
WRITE #1, col
WRITE #1, imaded
WRITE #1, billded
WRITE #1, jumboded
WRITE #1, merlded
WRITE #1, tomded
WRITE #1, fredded
WRITE #1, ninded
WRITE #1, shadded
WRITE #1, botded
WRITE #1, xtra
WRITE #1, foobie
WRITE #1, soundd
WRITE #1, level
WRITE #1, sc
WRITE #1, scorb
WRITE #1, bonus
WRITE #1, bigboy
CLOSE #1
CLS
PRINT "Your data is saved."
SLEEP 500
CLS
GOTO nextguy
load:
CLS
PRINT "What is your saved data filename to load your game."
fit$ = ".fit"
INPUT po1$
poo$ = po1$ + fit$
PRINT
PRINT poo$
PRINT
ON ERROR GOTO bfile
OPEN poo$ FOR INPUT AS #1
INPUT #1, name$, col, imaded, billded, jumboded, merlded, tomded, fredded, ninded, shadded, botded, xtra, foobie, soundd, level, sc, scorb, bonus, bigboy
CLOSE #1
KILL poo$
ON ERROR GOTO qw
GOTO pop
bfile:
PRINT "Bad Filename"
PRINT
PRINT
GOTO main

owin:
INPUT a$
CLS
PRINT "And the winner is........"
SLEEP 3
PRINT onamef$
hob = 1
PRINT "(applause)"
PRINT "You Lose!"
PRINT "Game Over!"
IF soundd = 1 THEN
'nc,p1,p2,dp
    nc = 3
    p1 = 200
    p2 = 1000
    dp = 50
    d = 1
    FOR J = 1 TO nc
    FOR P = p1 TO p2 STEP dp
    SOUND P, d
    NEXT P
    NEXT J
 END IF
 INPUT a$
 CLS
 GOTO hscore
GOTO maing

help:
CLS
PRINT "--------------------------Story--------------------------"
PRINT "You are a street fighter that is practicing moves, when a car pulls up"
PRINT "to you and a man says, 'Want to fight in a tournament?'  You say yes and"
PRINT "jump into the car, headed for the tournament."
PRINT "-----------------------How to Play------------------------"
PRINT "When you select play, the computer asks you some questions.  Answer them"
PRINT "and you start playing.  It shows your opponent, Ima P. Brain, and then"
PRINT "different moves.  Select a move by entering the # next to it.  Power and"
PRINT "Hit% are shown next to the attacks.  These show you how strong they are,"
PRINT "and the chances of them connecting.  After you choose one it tells you"
PRINT "how your move turned out and your opponent's move.  Every time your attack"
PRINT "does not connect, the opponent's energy will grow by 1 point.  This is the"
PRINT "same for you when you dodge an opponent's attack.  Reduce your opponent's"
PRINT "energy to 0 and you win!  Then it is time for the next opponent.  When you"
PRINT "defeat an opponent you get a special move.  They may be selected on the"
PRINT "move selection screen by typing 11.  These moves are better than regular"
PRINT "moves.  You may also save after beating an opponent.  Then if you quit and"
PRINT "load up again, you start at the next opponent.  For each fighter you defeat"
PRINT "You get points.  When you die, you may get in the high score list.  View"
PRINT "these from the main menu.  At any time hold Ctrl+Break to go to the Qbasic"
PRINT "screen.  Have fun, and happy pounding!   PRESS ENTER"
DO
LOOP UNTIL INKEY$ = CHR$(13)
CLS
GOTO maing
asound:
CLS
PRINT "Sound FX?"
PRINT "1- Yes"
PRINT "2- No"
INPUT soundd
CLS
GOTO maing
sounda:
CLS
PRINT "Sound FX?"
PRINT "1- Yes"
PRINT "2- No"
INPUT soundd
CLS
GOTO main
hscore:
IF sc > hsa THEN LET hsan$ = name$: LET hse = hsd: LET hsd = hsc: LET hsc = hsb: LET hsb = hsa: LET hsa = sc: GOTO highscoresave
IF sc > hsb THEN LET hsbn$ = name$: LET hse = hsd: LET hsd = hsc: LET hsc = hsb: LET hsb = sc: GOTO highscoresave
IF sc > hsc THEN LET hscn$ = name$: LET hse = hsd: LET hsd = hsc: LET hsc = sc: GOTO highscoresave
IF sc > hsd THEN LET hsdn$ = name$: LET hse = sc: GOTO highscoresave
IF sc > hse THEN LET hsen$ = name$: LET hse = sc: GOTO highscoresave
GOTO hscores
highscoresave:
OPEN "c:\dos\fighthsc.dat" FOR OUTPUT AS #2
WRITE #2, hsa
WRITE #2, hsb
WRITE #2, hsc
WRITE #2, hsd
WRITE #2, hse
WRITE #2, hsan$
WRITE #2, hsbn$
WRITE #2, hscn$
WRITE #2, hsdn$
WRITE #2, hsen$
CLOSE #2
hscores:
OPEN "c:\dos\fighthsc.dat" FOR INPUT AS #2
INPUT #2, hsa, hsb, hsc, hsd, hse, hsan$, hsbn$, hscn$, hsdn$, hsen$
CLOSE #2
CLS
PRINT "High Scores:"
PRINT "#1-"; hsa; "claimed by "; hsan$; "."
PRINT "#2-"; hsb; "claimed by "; hsbn$; "."
PRINT "#3-"; hsc; "claimed by "; hscn$; "."
PRINT "#4-"; hsd; "claimed by "; hsdn$; "."
PRINT "#5-"; hse; "claimed by "; hsen$; "."
SLEEP 500
CLS
IF hob = 1 THEN GOTO maing
GOTO maing
super:
CLS
PRINT "------------------------Super Options--------------------------------"
INPUT "Do you want weakling opponents? ", ght$
IF UCASE$(ght$) = "Y" OR UCASE$(ght$) = "YES" THEN
LET bigboy = 1
LET olife = 5
END IF
INPUT "What level do you want to start on? 1-5 (reconmended) ", level
LET x = (level * 20) - 20
LET xtra = x
LET olife = olife + x
INPUT "How much energy do you want? ", bonus
LET ulife = bonus
CLS
GOTO mainf

DEFINT A-Z
SUB bigletter (Word$, Size, Clr, Style, Position)
COLOR 15
   DIM Box(-1 TO 7, -1 TO 15)
   Wordlength = LEN(Word$) * Size * 8
   WordHeight = Size * 16
   WordCenter = 320 - (Wordlength / 2)
   PALETTE 15, 0
   FOR Letter = 1 TO LEN(Word$)
     LOCATE 1, 1
     PRINT MID$(Word$, Letter, 1)
     FOR x = 0 TO 7
       FOR y = 0 TO 15
        Box(x, y) = POINT(x, y)
       NEXT y
     NEXT x
     FOR x = 0 TO 7
       Left = WordCenter + (x * Size)
       Right = Left + Size
       lr = (Left + Right) \ 2
       FOR y = 0 TO 15
         Up = Position + (y * Size)
         Down = Up + Size
         UD = (Up + Down) \ 2
         IF Box(x, y) THEN
           SELECT CASE Style
              CASE 1
                'solid
                LINE (Left, Up)-(Right, Down), Clr, BF
              CASE 2
                'squares
                 LINE (Left, Up)-(Right, Down), Clr, B
              CASE 3
                'slant (\)
                 LINE (Left, Up)-(Right, Down), Clr
              CASE 4
                'slant (/)
                LINE (Right, Up)-(Left, Down), Clr
              CASE 5
                'Vertical Lines
                LINE (lr, Up)-(lr, Down), Clr
              CASE 6
                'Horizontal Lines
                LINE (Left, UD)-(Right, UD), Clr
              CASE 7
                'Crosses
                LINE (lr, Up)-(lr, Down), Clr
                LINE (Left, UD)-(Right, UD), Clr
              CASE 8
                'X's
                 LINE (Left, Up)-(Right, Down), Clr
                 LINE (Right, Up)-(Left, Down), Clr
              CASE 9
                'outline
                IF Box(x - 1, y) = 0 THEN LINE (Left, Up)-(Left, Down), Clr
                IF Box(x + 1, y) = 0 THEN LINE (Right, Up)-(Right, Down), Clr
                IF Box(x, y - 1) = 0 THEN LINE (Left, Up)-(Right, Up), Clr
                IF Box(x, y + 1) = 0 THEN LINE (Left, Down)-(Right, Down), Clr
              CASE 10
               'Spider Web
                IF Box(x - 1, y) = 0 THEN LINE (lr, UD)-(Left, UD), Clr
                IF Box(x + 1, y) = 0 THEN LINE (lr, UD)-(Right, UD), Clr
                IF Box(x, y - 1) = 0 THEN LINE (lr, UD)-(lr, Up), Clr
                IF Box(x, y + 1) = 0 THEN LINE (lr, UD)-(lr, Down), Clr
                IF Box(x - 1, y - 1) = 0 THEN LINE (lr, UD)-(Left, Up), Clr
                IF Box(x + 1, y - 1) = 0 THEN LINE (lr, UD)-(Right, Up), Clr
                IF Box(x - 1, y + 1) = 0 THEN LINE (lr, UD)-(Left, Down), Clr
                IF Box(x + 1, y + 1) = 0 THEN LINE (lr, UD)-(Right, Down), Clr
              CASE 11
                'Bubbles
                CIRCLE (lr, UD), Size \ 2, Clr
              CASE 12
                'Circles
                CIRCLE (lr, UD), Size \ 2, Clr
                PAINT STEP(0, 0), Clr
              CASE 13
                'Shadow
                IF Box(x + 1, y) = 0 THEN LINE (Right, Up)-(Right, Down), Clr
                IF Box(x, y + 1) = 0 THEN LINE (Left, Down)-(Right, Down), Clr
                IF Box(x + 1, y + 1) = 0 THEN PSET (Right, Down), Clr
              CASE 14
                'Seperated squares
                LINE (Left + 1, Up + 1)-(Right - 1, Down - 1), Clr, BF
              CASE 15
                'building
                LINE (Left, Down)-(lr, Up), Clr
                LINE STEP(0, 0)-(Right, Down), Clr
                LINE STEP(0, 0)-(Left, Down), Clr
                LINE (Left, Up)-(Right, Up), Clr
              CASE 16
                'STARS
                LINE (lr, Up)-(lr, Down), Clr
                LINE (Left, UD)-(Right, UD), Clr
                LINE (Left, Up)-(Right, Down), Clr
                LINE (Right, Up)-(Left, Down), Clr
              END SELECT
           END IF
         NEXT y
       NEXT x
     WordCenter = WordCenter + (Size * 8)
   NEXT Letter
   LOCATE 1, 1
   PRINT " "
   PALETTE
END SUB

