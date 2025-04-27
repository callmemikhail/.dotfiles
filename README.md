# dotfiles
My configuration of dwm, nvim, slstatus, and dmenu is an ongoing attempt to achieve maximum comfort and productivity in my workflow.

```text
WARNING: nvim conf not full!
```

## content
- [dwm](#dwm)
- [nvim](nvim)
- [To do](#to-do)

# tools
- [alacritty](https://github.com/alacritty/alacritty)
- [btop](https://github.com/aristocratos/btop)
- [dmenu](https://tools.suckless.org/dmenu/)
- [dwm](https://dwm.suckless.org/)
- [nvim](https://neovim.io/)
- [slstatus](https://tools.suckless.org/slstatus/)
- [vifm](https://vifm.info/)
- [vimium](https://github.com/philc/vimium)
- [zathura](https://pwmt.org/projects/zathura/)

## to-do
```text
    nvim lsp setup 
    nvim refactor custom/plug/plugins.lua 
    dwm change colors
```
## nvim
```text
├── init.lua
├── lua
│   ├── core
│   │   ├── filesettings.lua
│   │   ├── general.lua
│   │   └── vars.lua
│   ├── custom
│   │   ├── colorscheme
│   │   │   ├── current.lua
│   │   │   └── themes
│   │   ├── init.lua
│   │   └── plug
│   │       ├── conf
│   │       ├── plugconf.lua
│   │       └── plugins.lua
│   └── keys
│       ├── aliases.lua
│       └── modebindings.lua
└── plugin
    └── packer_compiled.lua
```


## dwm 
```text
├── config.h
├── config.mk
├── drw.c
├── dwm
├── exitdwm.c
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
└── . 
```
