/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   main.c                                             :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: dylan <dylan@student.42.fr>                +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2025/11/02 22:57:20 by dylan             #+#    #+#             */
/*   Updated: 2025/11/02 22:57:20 by dylan            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include <stdio.h>

/* Outside comment */
void	show_source(void)
{
	char *data = "#include <stdio.h>\n\n/* Outside comment */\nvoid\tshow_source(void)\n{\n\tchar *data = %c%s%c;\n\tprintf(data, 34, data, 34);\n}\n\nint\tmain(void)\n{\n\t/* Inside comment */\n\tshow_source();\n\treturn (0);\n}\n";
	printf(data, 34, data, 34);
}

int	main(void)
{
	/* Inside comment */
	show_source();
	return (0);
}
