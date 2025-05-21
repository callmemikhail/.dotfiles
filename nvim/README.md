NVIM v0.11.1

--- Startup times for process: Embedded ---

times in msec
 clock   self+sourced   self:  sourced script
 clock   elapsed:              other lines

000.000  000.000: --- NVIM STARTING ---
000.059  000.059: event init
000.102  000.043: early init
000.134  000.032: locale set
000.156  000.023: init first window
000.347  000.191: inits 1
000.352  000.005: window checked
000.376  000.023: parsing arguments
001.143  000.270: init lua interpreter
001.252  000.109: expanding arguments
001.289  000.037: inits 2
002.146  000.857: init highlight
002.148  000.002: waiting for UI
002.541  000.392: done waiting for UI
002.564  000.023: clear screen
--sourcing && require
027.388  000.079  000.008: sourcing nvim_exec2() called at 



## nvim config stucture
```text
.
├── init.lua
├── lazy-lock.json
├── lua
│   ├── core
│   │   ├── filesettings.lua
│   │   ├── general.lua
│   │   └── vars.lua
│   ├── custom
│   │   ├── init.lua
│   │   └── plug
│   │       ├── auto-session.lua
│   │       ├── colorscheme-tindet-vim.lua
│   │       ├── comment.lua
│   │       ├── nerdtree.lua
│   │       ├── telescope.lua
│   │       ├── treesitter.lua
│   │       ├── undotree.lua
│   │       └── vim-move.lua
│   └── keys
│       ├── aliases.lua
│       └── modebindings.lua
└── README.md

6 directories, 17 files
```
