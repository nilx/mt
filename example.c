/*
 * This file shows how to use mt.c. It is released in the public
 * domain and as such comes with no copyright requirement.
 *
 * compile with: cc example.c mt.c
 */

#include <stdlib.h>
#include <stdio.h>
#include <time.h>

/* include the mt prototypes */
#include "mt.h"

int main()
{
    int i;

    /*
     * a possible (weak) initialization
     * uses the current time, in seconds
     */
    mt_init((unsigned long int) time(NULL));

    /*
     * now we can get 1000 pseudo-random value
     */
    for (i = 0; i < 1000; i++)
        printf("%10.8f\n", mt_drand53());

    return EXIT_SUCCESS;
}

/**
 * @mainpage mt: portable pseudo-random number generator
 *
 * README.txt:
 * @verbinclude README.txt
 */
