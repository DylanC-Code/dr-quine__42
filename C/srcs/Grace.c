#include <stdio.h>
#include <stdlib.h>

/*
    Grace_kid.c
*/

#define FILE_NAME "Grace_kid.c"
#define FT() int main(void) {    FILE * f = fopen(FILE_NAME, "w");    if (!f)        return 1;    char *model = "#include <stdio.h>%1$c#include <stdlib.h>%1$c%1$c/*%1$c    Grace_kid.c%1$c*/%1$c%1$c#define FILE_NAME %2$cGrace_kid.c%2$c%1$c#define FT() int main(void) {    FILE * f = fopen(FILE_NAME, %2$cw%2$c);    if (!f)        return 1;    char *model = %2$c%3$s%2$c;    fprintf(f, model, 10, 34, model);    fclose(f);    return 0;}%1$c#define GRACE FT()%1$cGRACE";    fprintf(f, model, 10, 34, model);    fclose(f);    return 0;}
#define GRACE FT()
GRACE