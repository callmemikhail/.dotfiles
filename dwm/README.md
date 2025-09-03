dwm - dynamic window manager
============================
dwm is an extremely fast, small, and dynamic window manager for X.

## dwm config structure 
```text
├── config.h
├── config.mk
├── drw.c
├── drw.h
├── dwm.1
├── dwm.c
├── dwm.png
├── exitdwm.c
├── LICENSE
├── Makefile
├── patches
│   ├── dwm-alwayscenter-20200625-f04cac6.diff
│   ├── dwm-attachbottom-6.3.diff
│   ├── dwm-colorbar-6.2.diff
│   ├── dwm-cool-autostart-6.2.diff
│   ├── dwm-exitmenu-6.3.diff
│   ├── dwm-movekeyboard-6.4.diff
│   ├── dwm-noborder-6.2.diff
│   ├── dwm-pertag-6.2.diff
│   ├── dwm-preserveonrestart-6.3.diff
│   ├── dwm-resizehere-20230824-e81f17d.diff
│   ├── dwm-restartsig-20180523-6.2.diff
│   ├── dwm-rotatestack-20161021-ab9571b.diff
│   ├── dwm-steam-6.2.diff
│   └── dwm-systray-20230922-9f88553.diff
├── README.md
├── transient.c
├── util.c
└── util.h
```



Requirements
------------
In order to build dwm you need the Xlib header files.


Installation
------------
Edit config.mk to match your local setup (dwm is installed into
the /usr/local namespace by default).

Afterwards enter the following command to build and install dwm (if
necessary as root):

    make clean install


Running dwm
-----------
Add the following line to your .xinitrc to start dwm using startx:

    exec dwm

In order to connect dwm to a specific display, make sure that
the DISPLAY environment variable is set correctly, e.g.:

    DISPLAY=foo.bar:1 exec dwm

(This will start dwm on display :1 of the host foo.bar.)

In order to display status info in the bar, you can do something
like this in your .xinitrc:

    while xsetroot -name "`date` `uptime | sed 's/.*,//'`"
    do
    	sleep 1
    done &
    exec dwm


Configuration
-------------
The configuration of dwm is done by creating a custom config.h
and (re)compiling the source code.
