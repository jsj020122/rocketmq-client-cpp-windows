chcp 936
@if "%programfiles%"=="" ("set programfiles=c:\Program Files (x86)")
call "%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat"
cd thirdparty
set  ZLIB_SOURCE="%cd%\zlib-1.2.3-src\src\zlib\1.2.3\zlib-1.2.3\"
cd boost_1_58_0
call bootstrap.bat
@echo build start.....
bjam.exe --with-serialization --with-atomic --with-log --with-locale --with-iostreams --with-system --with-regex --with-thread --with-date_time --with-chrono --with-filesystem  link=static  threading=multi variant=release runtime-link=shared
cd ../../
devenv ./rocketmq-client-cpp.sln  /Rebuild "Release|x86" /out log.txt