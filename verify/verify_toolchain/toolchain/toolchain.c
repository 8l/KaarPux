/*
 *  KaarPux: http://kaarpux.kaarposoft.dk
 *
 *  Copyright (C) 2013: Henrik Kaare Poulsen
 *
 *  License: http://kaarpux.kaarposoft.dk/license.html
 */

/*
 *  Dummy driver program to verify toolchain
 */

#include <config.h>
#include <stdio.h>
#include <libiberty.h>

#include "deepthought.h"

int main (void) {
	int em = errno_max();
	printf("Nothing can go more wrong than %d\n", em);
	printf("ToolChain says the answer is %d\n", the_answer_is());
	return 0;
}

