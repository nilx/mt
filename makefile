# Copyright 2010 Nicolas Limare <nicolas.limare@cmla.ens-cachan.fr>
#
# Copying and distribution of this file, with or without
# modification, are permitted in any medium without royalty provided
# the copyright notice and this notice are preserved.  This file is
# offered as-is, without any warranty.

# source code, C language
SRC	= mt.c example/rand.c
# object files (partial compilation)
OBJ	= $(SRC:.c=.o)
# binary executable program
BIN	= example/rand

# C compiler optimization options
COPT	= -O2
# complete C compiler options
CFLAGS	= $(COPT)
# preprocessor options
CPPFLAGS	= -I. -DNDEBUG
# linker options
LDFLAGS	=
# libraries
LDLIBS	=

# default target: the binary executable program
default: $(BIN)

# dependencies
-include makefile.dep

# partial C compilation xxx.c -> xxx.o
%.o	: %.c
	$(CC) -c $(CFLAGS) $(CPPFLAGS) -o $@ $<

# final link of the partially compiled files
$(BIN)	: $(OBJ)
	$(CC) $(LDFLAGS) -o $@ $^ $(LDLIBS)

# cleanup
.PHONY	: clean distclean
clean	:
	$(RM) $(OBJ)
	$(RM) *.flag
distclean	: clean
	$(RM) $(BIN)
	$(RM) -r srcdoc

################################################
# dev tasks
PROJECT	= mt
-include	makefile.dev
