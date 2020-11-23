DECLARE SUB AddToPixel (index%)
DECLARE SUB DoClear ()
DECLARE SUB ReadCode ()
DECLARE SUB ReadFile (handle%, bytes%)
DECLARE SUB ReadRaster ()
DECLARE SUB ReInitialize ()
DECLARE SUB DetColor (pvalue%, mapvalue%)
DECLARE SUB DetColor13 (pvalue%, mapvalue%)
DECLARE FUNCTION GetByte% ()
DECLARE FUNCTION GetWord% ()

REM GIF read/display in QB (a hack of GIFSLOW.PAS)
REM 01-Apr-1991 v1.00
REM Cornel Huth  (see note below)
REM -------------------------------------------------------------------------
REM This is fine to look at but not to actually use in a program. BUT -
REM QBXGRAF v2.0 is a complete assembly language graphics library enhance-
REM ment to QuickBASIC+PDS EGA/VGA graphics. Fast GIF read with configurable
REM display is included as are patterned lines and fills, fast arcade-
REM like bitblt animation, complete 2-D and 3-D transformation routines
REM so fast that it'll make your head spin! 800x600x16, EMS/XMS support.
REM Lots more. Coming soon to a shareware outlet near you. Look for it.
REM -------------------------------------------------------------------------
'17-Dec-91-chh
'Note: Available 2Q92 as ZGRAFX??.ZIP where ?? will be latest version.
'This package will be totally 80x86 assembly and the single library will
'work for nearly every DOS compiler, not just QB.
'
'Other packages available from me:
'
'Programmer tools:
'
' QBEVGFX: Real-time 3-D transformations and VGA GUI tools. One word. Fast.
' v1.10. $59.00 (Font editor with 70 fonts also available).
'
' QBTree: Complete B-tree file manager. v5.51. $50.00.
'
' QBXDBF: Complete B-tree file manager using dBASE .DBF files. v1.01. $55.00
' Fast. Indexes 15,000 records/minute on an AT system.
'
' ZXBASE: Complete Xbase (.DBF) file manager written in 100% 80x86 assembly.
' Blazingly fast and incredibly small. Expression evaluator and a whole
' lot more. Single library for nearly all DOS compilers. Available 1Q92.
' Look for ZXBASE??.ZIP for most C compilers, QB/BC7, Fortran and Pascal,
' all in a single library.
'
' QBXSOUND: Complete sound routines for AdLib and Sound Blaster cards.
' Does not use external drivers. Routines to play MIDI files and VOC files
' in the background without interfering with the main program. 66 routines
' in all including many for direct access to the hardware. v1.01. $50.00.
'
' All programmer's tools are available for QuickBASIC 4.00 to 4.5, and also
' BASIC 7 PDS including near and far strings. QBXSOUND requires 4.0b or above.
'
'End-User Applications:
'
' LP100: Mixed-integer linear programming optimizer. Handles problems with
' thousands of constraints and variables. Can use 1-2-3 as matrix generator.
' v2.60. $50.00
'
' CAT100: Disk catalog system. Handles 32,000 disks and 512,000 files per
' catalog. Can expand ZIP, LZH, PAK, SDN, and ARC. CUA-compliant. Easy and
' fast to use. v2.00. $20.
'
'Site-licenses are available. For more information contact:
'
' Cornel Huth
' 6402 Ingram Rd.
' San Antonio, TX 78238-3915 U.S.A.
'-----------------------------------------------------------------------------

DEFINT A-Z
CONST FALSE = 0, TRUE = NOT FALSE

CONST RasterSize = 32000                'BASIC and its lack of unsigned
					'integers means we kludge (a lot).
DIM SHARED ByteOffset AS LONG           'GIFREAD.BAS will not handle complex
DIM SHARED BitOffset AS LONG            'GIFs (especially interlaced ones)
					'though with work you can use a size.
DIM SHARED Wide AS INTEGER
DIM SHARED Height AS INTEGER
DIM SHARED LeftOfs AS INTEGER
DIM SHARED TopOfs AS INTEGER
DIM SHARED RWidth AS INTEGER
DIM SHARED RHeight AS INTEGER
DIM SHARED ClearCode AS INTEGER
DIM SHARED EOFCode AS INTEGER
DIM SHARED OutCount AS INTEGER
DIM SHARED MaxCode AS INTEGER
DIM SHARED Code AS INTEGER
DIM SHARED CurCode AS INTEGER
DIM SHARED OldCode AS INTEGER
DIM SHARED InCode AS INTEGER
DIM SHARED FirstFree AS INTEGER
DIM SHARED FreeCode AS INTEGER
DIM SHARED GIFptr AS INTEGER
DIM SHARED RasterPtr AS INTEGER
DIM SHARED XC AS INTEGER
DIM SHARED YC AS INTEGER
DIM SHARED ReadMask AS INTEGER

DIM SHARED Interlace AS INTEGER
DIM SHARED ColorMap AS INTEGER
DIM SHARED ColorMapSize AS INTEGER
DIM SHARED char AS STRING * 1

DIM SHARED CodeSize AS INTEGER
DIM SHARED InitCodeSize AS INTEGER
DIM SHARED FinChar AS INTEGER
DIM SHARED Pass AS INTEGER
DIM SHARED BitMask AS INTEGER
DIM SHARED R AS INTEGER, G AS INTEGER, B AS INTEGER
DIM SHARED videomode AS INTEGER

REM $DYNAMIC
DIM SHARED Prefix(0 TO 4095) AS INTEGER
DIM SHARED Suffix(0 TO 4095) AS INTEGER

DIM SHARED OutCode(0 TO 1024) AS INTEGER

DIM SHARED palet(0 TO 255) AS LONG

DIM SHARED MaxCodes(0 TO 9) AS INTEGER
DIM SHARED Masks(0 TO 9) AS INTEGER

DIM SHARED Raster(0 TO RasterSize) AS STRING * 1
DIM SHARED GIFstuff(0 TO RasterSize) AS STRING * 1


CLS
ReInitialize

videomode = 13  'PORSCHE.GIF is 320x200x32 so use mode 13
filename$ = "g:\rektor.gif"
PRINT "Reading file: "; filename$; "...";

OPEN filename$ FOR BINARY AS #1
fsize& = LOF(1)
IF fsize& > RasterSize THEN fsize& = RasterSize
bytes = fsize&

ReadFile 1, bytes
CLOSE #1
PRINT "done."
PRINT

FileString$ = ""
FOR i = 1 TO 6
   FileString$ = FileString$ + CHR$(GetByte)
NEXT
IF FileString$ <> "GIF89a" THEN PRINT "Not a GIF": STOP

RWidth = GetWord
RHeight = GetWord
B = GetByte
IF B AND &H80 = &H80 THEN ColorMap = TRUE ELSE ColorMap = FALSE
Resolution = (B AND &H70) \ 16 + 1
BitsPerPixel = (B AND 7) + 1
ColorMapSize = 1 * (2 ^ BitsPerPixel)
BitMask = ColorMapSize - 1
BackGround = GetByte
B = GetByte
PRINT "Color Rez:"; Resolution;
PRINT " Number of Colors:"; ColorMapSize;
PRINT " BG:"; BackGround; "  COLOR MAP follows:": PRINT

IF ColorMap THEN
   FOR i = 0 TO ColorMapSize - 1
      Red = GetByte
      Green = GetByte
      Blue = GetByte
      IF videomode < 10 THEN
	 DetColor R, Red
	 DetColor G, Green
	 DetColor B, Blue
	 pal = (B AND 1) + (2 * (G AND 1)) + (4 * (R AND 1)) + (8 * (B \ 2)) + (16 * (G \ 2)) + (32 * (R \ 2))
	 palet(i) = pal
	 PRINT i; HEX$(Red); ","; HEX$(Green); ","; HEX$(Blue); "->"; HEX$(R); ","; HEX$(G); ","; HEX$(B); "="; pal,
      ELSE
	 DetColor13 R, Red
	 DetColor13 G, Green
	 DetColor13 B, Blue
	 pal& = 65536 * B + 256 * G + R
	 palet(i) = pal&
	 PRINT i; HEX$(Red); ","; HEX$(Green); ","; HEX$(Blue); "->"; HEX$(R); ","; HEX$(G); ","; HEX$(B),
      END IF
   NEXT
   palet(0) = BackGround
END IF
PRINT

B = GetByte
LeftOfs = GetWord
TopOfs = GetWord
Wide = GetWord
Height = GetWord
A = GetByte
IF A AND &H40 = &H40 THEN Interlace = TRUE ELSE Interlace = FALSE
PRINT
PRINT "Left/top offset:"; LeftOfs; ","; TopOfs
PRINT "Width x height/interlace:"; Wide; "x"; Height; ","; Interlace

CodeSize = GetByte
ClearCode = 2 ^ CodeSize
EOFCode = ClearCode + 1
FirstFree = ClearCode + 2
FreeCode = FirstFree
PRINT
PRINT "Clear code/EOF code:"; ClearCode; ","; EOFCode

CodeSize = CodeSize + 1
InitCodeSize = CodeSize
MaxCode = MaxCodes(CodeSize - 2)
ReadMask = Masks(CodeSize - 3)
PRINT
PRINT "Unblocking"

ReadRaster

OutCount = 0

PRINT "  Press a key and wait (a while)..."
DO: LOOP WHILE INKEY$ = ""

'GIFREAD works with any graphics mode provided enough room
'PALETTE USING only for EGA/VGA

SCREEN videomode
IF ColorMap AND videomode > 8 THEN PALETTE USING palet(0)

LOCATE 1, 1: PRINT "Hold"
PRINT "on..."
LOCATE 25, 1: PRINT "This might take a while...";
DO
   ReadCode
   IF Code <> EOFCode THEN
      IF Code = ClearCode THEN
	 DoClear
	 ReadCode
	 CurCode = Code
	 OldCode = Code
	 FinChar = Code AND BitMask
	 AddToPixel FinChar
      ELSE
	 CurCode = Code
	 InCode = Code
	 IF Code >= FreeCode THEN
	    CurCode = OldCode
	    OutCode(OutCount) = FinChar
	    OutCount = OutCount + 1
	 END IF
	 IF CurCode > BitMask THEN
	    DO
	       OutCode(OutCount) = Suffix(CurCode)
	       OutCount = OutCount + 1
	       CurCode = Prefix(CurCode)
	    LOOP UNTIL CurCode <= BitMask
	 END IF

	 FinChar = CurCode AND BitMask
	 OutCode(OutCount) = FinChar
	 OutCount = OutCount + 1

	 FOR i = OutCount - 1 TO 0 STEP -1
	    AddToPixel OutCode(i)
	 NEXT
	 OutCount = 0

	 Prefix(FreeCode) = OldCode
	 Suffix(FreeCode) = FinChar
	 OldCode = InCode

	 FreeCode = FreeCode + 1
	 IF FreeCode >= MaxCode THEN
	    IF CodeSize < 12 THEN
	       CodeSize = CodeSize + 1
	       MaxCode = MaxCode * 2
	       ReadMask = Masks(CodeSize - 3)
	    END IF
	 END IF
      END IF

      in$ = INKEY$
      IF in$ <> "" THEN Code = EOFCode
   END IF
LOOP UNTIL Code = EOFCode
BEEP
SLEEP
SCREEN 0
SYSTEM

REM $STATIC
SUB AddToPixel (index)

IF videomode <> 13 THEN index = index AND 15
PSET (XC, YC), index

XC = XC + 1
IF XC = Wide THEN
   XC = 0
   IF NOT Interlace THEN
      YC = YC + 1
   ELSE
      SELECT CASE Pass
      CASE 0
	 YC = YC + 8
	 IF YC >= Height THEN
	    Pass = Pass + 1
	    YC = 4
	 END IF
      CASE 1
	 YC = YC + 8
	 IF YC >= Height THEN
	    Pass = Pass + 1
	    YC = 2
	 END IF
      CASE 2
	 YC = YC + 4
	 IF YC >= Height THEN
	    Pass = Pass + 1
	    YC = 1
	 END IF
      CASE 3
	 YC = YC + 2
      CASE ELSE
      END SELECT
   END IF
END IF

END SUB

SUB DetColor (pvalue, mapvalue)

pvalue = mapvalue \ 64 '(2 bits per color component (R/G/B) on EGA/VGA)
IF pvalue = 1 THEN      'switch for some reason...
   pvalue = 2
ELSEIF pvalue = 2 THEN
   pvalue = 1
END IF

END SUB

SUB DetColor13 (pvalue, mapvalue)

pvalue = mapvalue \ 4 '(6 bits per color component (R/G/B) on VGA13)

END SUB

SUB DoClear

CodeSize = InitCodeSize
MaxCode = MaxCodes(CodeSize - 2)
FreeCode = FirstFree
ReadMask = Masks(CodeSize - 3)

END SUB

FUNCTION GetByte

IF GIFptr > RasterSize THEN
   PRINT "Maxed-out raster buffer."
   STOP
END IF
GetByte = ASC(GIFstuff(GIFptr))
GIFptr = GIFptr + 1

END FUNCTION

FUNCTION GetWord

A = GetByte
B = GetByte
GetWord = 256 * B + A

END FUNCTION

SUB ReadCode

ByteOffset = BitOffset \ 8

A& = (256& * ASC(Raster(ByteOffset + 1))) + ASC(Raster(ByteOffset))
IF CodeSize > 8 THEN
   B = ASC(Raster(ByteOffset + 2))
   Rawcode& = 65536 * B + A&
ELSE
   Rawcode& = A&
END IF

Rawcode& = Rawcode& \ (2 ^ (BitOffset MOD 8))
Code = Rawcode& AND ReadMask

BitOffset = BitOffset + CodeSize

END SUB

SUB ReadFile (handle, bytes)

FOR i = 0 TO (bytes - 1)
   GET #handle, , char
   GIFstuff(i) = char
NEXT


END SUB

SUB ReadRaster

RasterPtr = 0
DO
   BlockLength = GetByte
   FOR i = 0 TO BlockLength - 1
      IF GIFptr = RasterSize THEN
	 PRINT "File size exceeds program limits"
	 STOP
      END IF
      
      Raster(RasterPtr) = CHR$(GetByte)
      LOCATE , 1: PRINT RasterPtr;

      RasterPtr = RasterPtr + 1
      IF RasterPtr > RasterSize + 1 THEN
	 PRINT "Raster fill maxed-out"
	 STOP
      END IF

   NEXT
LOOP UNTIL BlockLength = 0

ERASE GIFstuff

END SUB

SUB ReInitialize

XC = 0
YC = 0
Pass = 0
BitOffset = 0
GIFptr = 0

MaxCodes(0) = 4
MaxCodes(1) = 8
MaxCodes(2) = 16
MaxCodes(3) = 32
MaxCodes(4) = 64
MaxCodes(5) = 128
MaxCodes(6) = 256
MaxCodes(7) = 512
MaxCodes(8) = 1024
MaxCodes(9) = 2048

Masks(0) = 7
Masks(1) = 15
Masks(2) = 31
Masks(3) = 63
Masks(4) = 127
Masks(5) = 255
Masks(6) = 511
Masks(7) = 1023
Masks(8) = 2047
Masks(9) = 4095

END SUB

