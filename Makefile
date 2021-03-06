#SHELL=/bin/sh
#CC=gcc
#CFLAGS=-I.
DEPS = eie.h

CFILES := eie.c add.c destroy.c init.c clear.c commit.c list.c revert.c
PROG := eie
CFLAGS := -Wall -Wextra -g
#For SHA1:
LDFLAGS := -lcrypto
DMACRO := 

# -MMD generates dependencies while compiling
CFLAGS += -MMD
CC := gcc

OBJFILES := $(CFILES:.c=.o)
DEPFILES := $(CFILES:.c=.d)

$(PROG) : $(OBJFILES)
	$(LINK.o) -o $@ $^ $(LDFLAGS)

clean:
	rm -f $(PROG) $(OBJFILES) $(DEPFILES)

install:
	install -m 755 $(PROG) /usr/bin
	

-include $(DEPFILES)
