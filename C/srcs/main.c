#include <stdio.h>

#define DQUOTE 34
#define NEWLINE 10

/* Outside comment */
void	show_source(void)
{
	char *data = "#include <stdio.h>%1$c%1$c#define DQUOTE 34%1$c#define NEWLINE 10%1$c%1$c/* Outside comment */%1$cvoid	show_source(void)%1$c{%1$c	char *data = %2$c%3$s%2$c;%1$c	printf(data, NEWLINE, DQUOTE, data);%1$c}%1$c%1$cint	main(void)%1$c{%1$c	/* Inside comment */%1$c	show_source();%1$c	return (0);%1$c}%1$c";
	printf(data, NEWLINE, DQUOTE, data);
}

int	main(void)
{
	/* Inside comment */
	show_source();
	return (0);
}
