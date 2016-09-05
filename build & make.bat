echo off
cd src
set PATH=%PATH%;C:\cygwin64\bin
set CC=i686-w64-mingw32-gcc
set LD=i686-w64-mingw32-ld
set GOARCH=386
set CGO_ENABLED=1

echo on
go build -buildmode=c-archive -o libparser.a parser.go

echo off
cd ..
set CURDIR=%CD%

echo on
C:\MinGW64\msys\1.0\bin\sh.exe --login -i "%CD%\makedll.bat"
pause
