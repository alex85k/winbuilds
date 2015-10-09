winbuilds
=========

Scripts to automate building common libraries&amp;osm tools on Windows

Mostly targeted for MSVC compiler.
See also more advanced collections:
 - Mapbox windows-builds (Mapnik and OSM-related packages, professionaly supported batch scripts): https://github.com/mapbox/windows-builds
 - MSYS2 (MinGW & Cygwin fork and Arch pacman for windows): https://msys2.github.io with its huge repository of packages https://github.com/Alexpux/MINGW-packages
 - Osgeo4W (GIS targeted repository, >150 packages) https://trac.osgeo.org/osgeo4w/
 - Win-builds with yypkg package manager: http://win-builds.org/doku.php
 - Cygwin (slower but biggest set of packages) https://cygwin.com

You just need to
 - install Git for Windows (2.6.0 or later https://git-for-windows.github.io )
 - intall Visual Studio 2015 Community with Windows SDK or Mingw (testing)
 - edit settings.bat (Choose Debug or Release, MSVC or MINGW, set folders)
 - have an Internet connection and proxy variables if needed :)
 - run necessary build_... or build_all.bat

To compile with Mingw-w64, please
 - install MSYS2 : http://sourceforge.net/projects/msys2/
 - run its shell c:\msys64\msys2_shell.bat and install additional packages

```
pacman -S make binutils pkg-config diffutils automake autoconf libtool
```
(to be sure all autotools-based projects can be built)
 - unpack mingw-w64 to c:\mingw64 , for example mingw-builds 4.9.1 [here](http://sourceforge.net/projects/mingw-w64/files/Toolchains%20targetting%20Win64/Personal%20Builds/mingw-builds/4.9.1/threads-posix/seh/x86_64-4.9.1-release-posix-seh-rt_v3-rev1.7z/download)
Note that most of the packages already exists in MSYS2 repository. The scripts are mostly for creating alternative builds.

Thanks to great projects MinGW/MinGW-builds/MinGW-w64 ,  MSYS2 and also to Microsoft for having free version of their fast (and tricky) compiler :)
