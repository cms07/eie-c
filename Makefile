#SHELL=/bin/sh
#CC=gcc
#CFLAGS=-I.
DEPS = eie.h

CFILES := eie.c add.c destroy.c init.c clear.c commit.c
PROG := eie
CFLAGS := -Wall -Wextra -g
LDFLAGS :=
DMACRO := 

# -MMD generates dependencies while compiling
CFLAGS += -MMD
CC := gcc

OBJFILES := $(CFILES:.c=.o)
DEPFILES := $(CFILES:.c=.d)

$(PROG) : $(OBJFILES)
	$(LINK.o) $(LDFLAGS) -o $@ $^

clean :
	rm -f $(PROG) $(OBJFILES) $(DEPFILES)

-include $(DEPFILES)
