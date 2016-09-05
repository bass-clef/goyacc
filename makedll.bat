cd "$CURDIR/dll"
gcc -o parser.dll -m32 -mdll parser.cpp -I../src -L../src -lparser parser.def -Wl,--out-implib=libparser.dll.a -lwinmm -lws2_32 -lntdll
