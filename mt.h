#ifndef _MT_H
#define _MT_H

#ifdef __cplusplus
extern "C" {
#endif

#define MT_VERSION "0.20110401"

void mt_init(unsigned long s);
double mt_drand53(void);

#ifdef __cplusplus
}
#endif

#endif /* !_MT_H */
