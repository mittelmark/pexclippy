# pexclippy

Cross-platform  Clibooard  Snippet  tool - Example  application  for the course
Programming Expertise in the Master course Bioinformatics at the University of
Potsdam.

This was the example  application which we build during the first few weeks of
the   C++   part   of   the    lectures.   

## Aim 

The aim of this  application is to use a folder in the users HOME directory to
store different text snippets in the different  files, calling the application
will  provide a terminal  based menu which allow by typing some text to filter
these  files by their  names and then press  enter to copy the  content of the
selected  file to the  clipboard.  Pressing  the  Escape  key will  finish the
application.  The  user can  configure  a  keyboard  shortcut  to  launch  the
application or pin the application to its taskbar for easy access.

## Implementation

The application   has   two   cpp files,   a   file
[pex.cpp](pexclippy/pex.cpp)  where general utility functions are placed and a
file  [pexclippy.cpp](pexclippy/pexclippy.cpp)  where the application specific
logic is provided in a class _PexClippy_.

The  application  should  be  cross-platform  using  windows  API calls on the
Windows  platform  and  terminal  applications  like  `xclip`  (Linux-X11),
`wl-copy`  (Linux-Wayland)  or `pbcopy`  (MacOS) using the _popen_  command on
these Unix platforms.

Here the UML diagram of the application:

<center>
![Diagram](https://kroki.io/plantuml/svg/eNptUkFu2zAQvPMVA18ixU4eEBhGivbSQ4H-QKDItURAIglyFVgo0rd3Ral23PRE7XJ2NDPc18w68TQOSnk9Uo7aECJd8EsBZtA5YyflDsfj9f50KrfA3oQ4NxwaM7jYBp1slTk539UveAvOrqCOuDHBn13XWJc2BHSMC6Eg18YN24eRFiQZDmmu_oMIuarxuZ0pZxd8w3Okf8d6nRu6MPkF8VfD2Q20iDhsUFwR9TqVSNsPUq7mRh2Pa3FYjxPKwAO-WIvAPSVM7AbHM86TNyyUGdIlgb2rd6XWaH_S5atEF-cS6P5WF3_LT0t7JD-VzhbqHouwbx8j-qxIcE-_7wmtoLEofYI8CGvnc3U3JERtCIO6dxKndnBGVHAf7GZDLDzgu7fOaCZwrxmbk0meoWzQGoCjrG42n59P2z69YFegu4Xoh0jZ-FH5wNDr7h3QTgyjPVqC9MnWajmQXNczwvmWmGgehaVyXqZT93aA6XXC42OpakXeFgalXuVzWfg__DL75g==)

<!--
@startuml

namespace pex {
  class "pex" <<namespace>> {
    +copy_to_clipboard(string): void
    +get_config_dir(string appname): string
    +get_home_directory(): string
    +get_os() : string
    +get_session_type(): string
    +has_extension(string filename, string extension)
    +read_directory(string): map<string,string> 
    ' Add other utility functions here
  }
}

class PexClippy {
  + PexClippy() : ctor
  + menu() : void
  + readDirectory(): map<string,string>
  -~PexClippy() : dtor  
  - contains(string,string): bool
  ' Add other public methods here
}

' Indicate that Clippy uses pex utilities
PexClippy ..> "pex" : " uses"

' Main method (not a class, but can be noted)
note right of PexClippy
  main(int argv, char ** argv)
end note

@enduml

-->

[Edit this diagram](https://niolesk.top/#https://kroki.io/plantuml/svg/eNptUkFu2zAQvPMVA18ixU4eEBhGivbSQ4H-QKDItURAIglyFVgo0rd3Ral23PRE7XJ2NDPc18w68TQOSnk9Uo7aECJd8EsBZtA5YyflDsfj9f50KrfA3oQ4NxwaM7jYBp1slTk539UveAvOrqCOuDHBn13XWJc2BHSMC6Eg18YN24eRFiQZDmmu_oMIuarxuZ0pZxd8w3Okf8d6nRu6MPkF8VfD2Q20iDhsUFwR9TqVSNsPUq7mRh2Pa3FYjxPKwAO-WIvAPSVM7AbHM86TNyyUGdIlgb2rd6XWaH_S5atEF-cS6P5WF3_LT0t7JD-VzhbqHouwbx8j-qxIcE-_7wmtoLEofYI8CGvnc3U3JERtCIO6dxKndnBGVHAf7GZDLDzgu7fOaCZwrxmbk0meoWzQGoCjrG42n59P2z69YFegu4Xoh0jZ-FH5wNDr7h3QTgyjPVqC9MnWajmQXNczwvmWmGgehaVyXqZT93aA6XXC42OpakXeFgalXuVzWfg__DL75g==)

</center>

## Compilation

The  compilation on MacOS and Linux should be  straightforward  if gcc, git and
make and the _ncurses_  library are installed.  Just clone the  repository  and call make
like this:

```
git clone https://github.com/mittelmark/pexclippy.git
cd pexclippy/pexclippy
make
```

On  Windows  the  [PDCurses](https://pdcurses.org/)  library  and  the  [Winlibs](https://winlibs.com/)
compiler can be used like this:

```
curl -OL https://github.com/brechtsanders/winlibs_mingw/releases/download/12.2.0-16.0.0-10.0.0-ucrt-r5/winlibs-i686-posix-dwarf-gcc-12.2.0-mingw-w64ucrt-10.0.0-r5.zip
unzip -q winlibs-i686-posix-dwarf-gcc-12.2.0-mingw-w64ucrt-10.0.0-r5.zip
PATH=%CD%\mingw32\bin;%PATH%
gcc --version
curl -OL https://github.com/wmcbrine/PDCurses/archive/refs/tags/3.9.zip
unzip 3.9.zip
cd PDCurses-3.9/wincon/
mingw32-make 
cd ..\..
git clone https://github.com/mittelmark/pexclippy.git
cd pexclippy/pexclippy
mingw32-make winlibs
```

## Prebuild binaries

Below you find a table of prebuild binaries for your platform which were build
using [Github Actions](https://github.com/mittelmark/pexclippy/actions).


| Platform    | Processor | Link |
|:------------|:---------:|------|
| Linux       | intel64   |      |
| Linux       | aarch64   |      |
| MacOS       | intel64   |      |
| MacOS       | apple64   |      |
| Windows     | intel32   |      |

The  Windows  intel32  build  should  be  working  as  well  on 64 bit and arm
platforms.



## Links

- [msys-gcc setup on Windows](https://github.com/HO-COOH/CPPDevOnWindows)
- [clipboard libs discussion](https://stackoverflow.com/questions/45654783/how-to-copy-text-to-the-clipborad-in-c)
- [wl-clipboard](https://github.com/bugaevc/wl-clipboard)
- [xclip](https://github.com/astrand/xclip)

The `wl-clipboard` and the `xclip` tool should be available via the standard
package manager on your Linux distro.

## License and Copyright

```
MIT License

Copyright (c) 2025 Detlef Groth, University of Potsdam, Germany

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

Additional Notices and Acknowledgments

This software is built using the following third-party libraries:

libstdc++

Linked under the terms of the GNU General Public License, version 3, with
the GCC Runtime Library Exception, which permits static and dynamic
linking without affecting the license of this software.

PDCurses (Windows)

Used under public domain terms. (If using PDCursesMod, note any
GPL-licensed build scripts are not included in the distributed software.)

ncurses

Used under the MIT license (or X11 license).
See the ncurses documentation for details.

```
