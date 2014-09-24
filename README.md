winbuilds
=========

scripts to automate building common libraries&amp;osm tools on Windows

You just need to
 - install Git for Windows
 - intall Visual Studio 2013 Express or Mingw (testing)
 - edit settings.bat (Choose Debug or Release, MSVC or MINGW, set folders)
 - have an Internet connection :)
 - run necessary build_... or build_all.bat


To compile with Mingw-w64, please
 - install MSYS2 : http://sourceforge.net/projects/msys2/
 - run its shell c:\msys64\msys2_shell.bat and install additional packages

```
pacman -S make binutils pkg-config diffutils automake autoconf libtool
```
(to be sure all autotools-based projects can be built)
 - unpack mingw-w64 to c:\mingw64 , for example mingw-builds 4.9.1 [here](http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/4.9.1/threads-posix/seh/x86_64-4.9.1-release-posix-seh-rt_v3-rev1.7z/download)

Thanks to great projects MinGW/MinGW-builds/MinGW-w64 ,  MSYS2 and also to Microsoft for having free version of their fast (and tricky) compiler :)