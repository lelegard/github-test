#pragma once

#if defined(_DLL_IMPL)
    #define TESTDLL __declspec(dllexport)
#elif defined(_DLL_USE)
    #define TESTDLL __declspec(dllimport)
#else
    #define TESTDLL
#endif

TESTDLL void TestFunctionInDLL();
