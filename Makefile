
##
##  $Id: Makefile,v 1.14 2014/03/26 05:37:52 anoncvs Exp $
##
##  Makefile for JALV2 programs (=not= for the compiler itself).
##

TOP = /home/gaijin/PIC/JAL2
TOOLCHAIN = $(TOP)/JALLIB
CC = $(TOOLCHAIN)/compiler/jalv2	## Jallib version "p"
LIB = $(TOP)/JALLIB/lib
## NOTE - The "-Z" option preserves EEPROM data.
PK2 = /usr/local/bin/pk2cmd -P -J -E -M -R -T -Z -F
BLDR =

candles:	Sampled_LED_Candle.hex Hamlet_candle.hex AConst_candle.hex

prog:	$(TARG).hex
	$(PK2) $<

clean:
	rm -f ./*.cod ./*.asm ./*.hex

Sampled_LED_Candle.hex:		Sampled_LED_Candle.jal
	$(CC) $(BLDR) -s $(LIB) $<

Hamlet_candle.hex:		Hamlet_candle.jal
	$(CC) $(BLDR) -s $(LIB) $<

AConst_candle.hex:		AConst_candle.jal
	$(CC) $(BLDR) -s $(LIB) $<

scandle_prog:	Sampled_LED_Candle.hex
	$(PK2) $<

hcandle_prog:	Hamlet_candle.hex
	$(PK2) $<

acandle_prog:	AConst_candle.hex
	$(PK2) $<
