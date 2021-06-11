CC=g++-9
ACC=arm-linux-gnueabi-g++

SRCDIR=src
TSTDIR=test
DBGDIR=debug
RELDIR=release
ANDDIR=android
LIBDIR=$(SRCDIR)/lib
INCDIR=$(SRCDIR)/include

BIN=strlen
ANDBIN=$(BIN).arm

SRCNAM=main
SRCEXT=cpp
SRC=$(SRCNAM).$(SRCEXT)

SRCPTH=$(SRCDIR)/$(SRC)

TSTPTH=$(TSTDIR)/$(BIN)
DBGPTH=$(DBGDIR)/$(BIN)
RELPTH=$(RELDIR)/$(BIN)
ANDPTH=$(ANDDIR)/$(ANDBIN)

CF_DBG=-g -Wall -Wextra -std=c++17
CF_REL=-O2 -std=c++17
CF_AND=$(CF_REL) -static -march=armv8-a

TSTARG=

$(SRCNAM): $(SRCPTH)
	mkdir -p $(RELDIR)
	$(CC) $(CF_REL) $(SRCPTH) -o $(RELPTH)

android: $(SRCPTH)
	mkdir -p $(ANDDIR)
	$(ACC) $(CF_AND) $(SRCPTH) -o $(ANDPTH)

debug:
	mkdir -p $(DBGDIR)
	$(CC) $(CF_DBG) $(SRCPTH) -o $(DBGPTH)

test:
	mkdir -p $(TSTDIR)
	$(CC) $(CF_DBG) $(SRCPTH) -o $(TSTPTH)
	./$(TSTPTH) $(TSTARG)

install: $(SRCNAM)
	cp -f "$(RELPTH)" "/usr/bin/$(BIN)"

clean:
	rm -rf $(RELDIR)
	rm -rf $(TSTDIR)
	rm -rf $(DBGDIR)
	rm -rf $(ANDDIR)

