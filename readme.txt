
#goyacc -> .go -> .a -> .dll

cygwin で go build -buildmode=c-archive をするときは
cygwin から mingw gcc の呼び出しができないようなので

go build -buildmode=c-archive -o libhoge hoge.go
CC=x86_64-w64-mingw32-gcc LD=x86_64-w64-mingw32-ld 
CC=i686-w64-mingw32-gcc LD=i686-w64-mingw32-ld
で cygwin から mingw gcc を使うように指定する

win32用のgccを使ってライブラリ群とかもそれ用でなくてはならんので
32bit用のmingwから起動して gccコンパイル


// クロスコンパイル
// "C:\MinGW64\mingw-w64.bat" から起動
cd /d "D:\Program Files\Go\projects\goyacc\src"
set PATH=%PATH%;C:\cygwin64\bin
set CC=i686-w64-mingw32-gcc
set LD=i686-w64-mingw32-ld
set GOARCH=386
set CGO_ENABLED=1
go build -buildmode=c-archive -o libparser.a parser.go

// DLL生成
// "C:\MinGW64\msys\1.0\msys.bat" から起動
cd "D:\Program Files\Go\projects\goyacc\dll"
gcc -o parser.dll -m32 -mdll parser.cpp -I../src -L../src -lparser parser.def -Wl,--out-implib=libparser.dll.a -lwinmm -lws2_32 -lntdll

