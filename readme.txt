
#goyacc -> .go -> .a -> .dll

cygwin �� go build -buildmode=c-archive ������Ƃ���
cygwin ���� mingw gcc �̌Ăяo�����ł��Ȃ��悤�Ȃ̂�

go build -buildmode=c-archive -o libhoge hoge.go
CC=x86_64-w64-mingw32-gcc LD=x86_64-w64-mingw32-ld 
CC=i686-w64-mingw32-gcc LD=i686-w64-mingw32-ld
�� cygwin ���� mingw gcc ���g���悤�Ɏw�肷��

win32�p��gcc���g���ă��C�u�����Q�Ƃ�������p�łȂ��Ă͂Ȃ��̂�
32bit�p��mingw����N������ gcc�R���p�C��


// �N���X�R���p�C��
// "C:\MinGW64\mingw-w64.bat" ����N��
cd /d "D:\Program Files\Go\projects\goyacc\src"
set PATH=%PATH%;C:\cygwin64\bin
set CC=i686-w64-mingw32-gcc
set LD=i686-w64-mingw32-ld
set GOARCH=386
set CGO_ENABLED=1
go build -buildmode=c-archive -o libparser.a parser.go

// DLL����
// "C:\MinGW64\msys\1.0\msys.bat" ����N��
cd "D:\Program Files\Go\projects\goyacc\dll"
gcc -o parser.dll -m32 -mdll parser.cpp -I../src -L../src -lparser parser.def -Wl,--out-implib=libparser.dll.a -lwinmm -lws2_32 -lntdll

