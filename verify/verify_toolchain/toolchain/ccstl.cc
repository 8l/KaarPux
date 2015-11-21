/*
 *  KaarPux: http://kaarpux.kaarposoft.dk
 *
 *  Copyright (C) 2012: Henrik Kaare Poulsen
 *
 *  License: http://kaarpux.kaarposoft.dk/license.html
 */

/*
 *  Dummy driver program to verify C++ in toolchain (including STL)
 */

#include <cstring>
#include <vector>
#include <iostream>
#include <algorithm>

using namespace std;

const char* str = "Hello, World!";

template<typename Container>
void print(Container container)
{
	typename Container::iterator it;
	for (it = container.begin(); it < container.end(); it++)
	{
		cout << *it;
	}
	cout << endl;
}

int main()
{
	vector<char> v(str, str + strlen(str));
	print(v);
	reverse(v.begin(), v.end());
	print(v);
	return 0;
}
