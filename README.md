# Doghead Realms

My brother found this on an old floppy disk. It was written by an 11 year old version of myself in September of 1997. It appeared to be unfinished and un-named, but came with a text file full of snippets of BASIC named doghead.txt. Save files are written with the file extension '.dog'. The game welcomes the user to "the realms." So I've decided to call this "Doghead Realms." Enjoy.

# Installation

You'll need dosemu

    apt-get install dosemu

And qbasic

    wget http://web.archive.org/web/20120215074213/http://download.microsoft.com/download/win95upg/tool_s/1.0/w95/en-us/olddos.exe
    dosemu -t -6 -E "lredir y: linux\\fs`pwd` c"
    mkdir olddos
    cd olddos
    copy y:\olddos.exe
    olddos.exe
    exitemu

Add qbasic to PATH

    sed -e 's/\r//' -e 's/^path.*$/&;c:\olddos/1' -e 's/$/\r/' ~/.dosemu/drive_c/autoexec.bat

# Getting Started

In X

    dosemu -6 "run.bat"

In a terminal

    stty columns 80 rows 25
    dosemu -t -6 "run.bat"
