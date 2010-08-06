#ifdef __cplusplus
extern "C" {
#endif

#define MT19937AR_VERSION 0.20100806

/* mt19937ar.c */
void mt_init_genrand(unsigned long s);
double mt_genrand_res53(void);

#ifdef __cplusplus
}
#endif
