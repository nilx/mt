% mt19937ar : Mersenne Twister pseudo-random number generator

* overview
* license
* requirements
* usage
* todo
* copyright

# OVERVIEW

mt19937ar.c contains the Mersenne Twister pseudo-random number
generator, by Takuji Nishimura and Makoto Matsumoto.

This geneator is fast and produces good pseudo-randomness. It has a
very long period of 2^19937 − 1 and is k-distributed to 32-bit
accuracy for every k in [1...623]. It passes rumerous tests for
statistical randomness, including the Diehard tests.

This genreator provides better randomness than the default built-in
ANSI C function rand(). Unlike the BSD/UNIX rand48() functions, this
implementation is portable.

The original code has been slightly amended to keep only the core
functions.

## SOURCE

http://www.math.sci.hiroshima-u.ac.jp/~m-mat/MT/emt.html

# LICENSE

Like the original version, this code can be used for any purpose,
includiong commercial use.

# REQUIREMENTS

mt19937ar.c is ANSI C, and should compile on any system with any ANSI C 
compiler.

# USAGE

Compile mt19937ar.c with your program, and include mt19937ar.h to get the
function declarations.

Initialize the random number generator with mt_init_genrand().

Get a random number in [0, 1) with 53 random bits (the maximum
randomness for such number in double-precision) with mt_genrand_res53().

## EXAMPLE

    #include <time.h>
    #include <mt19937ar.h>

    double foo;

    /*
     * a possible (weak) initialization
     * uses the current time, in seconds
     */
    mt_init_genrand((unsigned long int) time(NULL));

    /*
     * now we can get a pseudo-random value
     */
    foo = mt_genrand_res53();

# TODO

* provide examples of better yet portable initializations

# COPYRIGHT

Copyright 2010 Nicolas Limare <nicolas.limare@cmla.ens-cachan.fr>

Copying and distribution of this README file, with or without
modification, are permitted in any medium without royalty provided
the copyright notice and this notice are preserved.  This file is
offered as-is, without any warranty.
