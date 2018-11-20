chcp 936
@if "%programfiles%"=="" ("set programfiles=c:\Program Files (x86)")
call "%ProgramFiles(x86)%\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat"
cd thirdparty
set  ZLIB_SOURCE="%cd%\zlib-1.2.3-src\src\zlib\1.2.3\zlib-1.2.3\"
cd boost_1_58_0
call bootstrap.bat
@echo build start.....
bjam.exe --with-iostreams --with-system --with-thread  --with-chrono --with-filesystem  --build-type=complete
cd ../../