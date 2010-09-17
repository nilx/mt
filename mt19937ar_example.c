/*
 * This file shows how to use mt19937ar.c. It is released in the public
 * domain and as such comes with no copyright requirement.
 *
 * compile with : cc mt19937ar_example.c mt19937ar.c
 */

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

/* include the io_png prototypes */
#include "mt19937ar.h"

int main()
{
    int i;

    /*
     * a possible (weak) initialization
     * uses the current time, in seconds
     */
    mt_init_genrand((unsigned long int) time(NULL));

    /*
     * now we can get 1000 pseudo-random value
     */
    for (i = 0; i < 1000; i++)
        printf("%10.8f\n", mt_genrand_res53());

    return EXIT_SUCCESS;
}

/**
 * @mainpage mt19937ar : portable pseudo-random number generator
 *
 * README.txt:
 * @verbinclude README.txt
 */
