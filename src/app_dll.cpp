#include "dll.h"
#include <iostream>

int main(int argc, char* argv[])
{
    std::cout << "In DLL-dependent app main(), before calling DLL" << std::endl;
    TestFunctionInDLL();
    std::cout << "In DLL-dependent app main(), after calling DLL" << std::endl;
}
