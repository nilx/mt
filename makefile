# Copyright 2010 Nicolas Limare <nicolas.limare@cmla.ens-cachan.fr>
#
# Copying and distribution of this file, with or without
# modification, are permitted in any medium without royalty provided
# the copyright notice and this notice are preserved.  This file is
# offered as-is, without any warranty.

# source code, C language
CSRC	= mt19937ar.c mt19937ar_example.c

# source code, all languages (only C here)
SRC	= $(CSRC)
# object files (partial compilation)
OBJ	= $(CSRC:.c=.o)
# binary executable program
BIN	= example

# default target : the binary executable program
default: $(BIN)

# standard C compiler optimization options
COPT	= -O2 -funroll-loops -fomit-frame-pointer
# complete C compiler options
CFLAGS	= -ansi -pedantic -Wall -Wextra -Werror -pipe $(COPT)

# partial C compilation xxx.c -> xxx.o
%.o	: %.c
	$(CC) $< -c $(CFLAGS) -o $@

# final link of the partially compiled files
$(BIN)	: $(OBJ)
	$(CC) $(OBJ) -o $@

# cleanup
.PHONY	: clean distclean scrub
clean	:
	$(RM) $(OBJ)
	$(RM) *.flag
distclean	: clean
	$(RM) $(BIN)
