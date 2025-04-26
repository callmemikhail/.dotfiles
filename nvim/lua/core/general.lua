--[General]--

----[Syntax]----
	opt.syntax = 'enable'
	o.termguicolors = true

----[Lines]----
	opt.relativenumber = true -- relative numbers 	
	opt.wrap = true -- line wrapping(перенос строки)
    g.nvim_tree_quit_on_open = 1 -- sting number in status bar
	opt.cursorline = false -- highlight the current cursor line
	opt.number = true -- wraps main0aining the integrity of words
    opt.guicursor = "n-v-c:block,i:block,r-cr:block" -- setting block-cursor in every mode
    
    cmd('highlight StatusLine guibg=NONE guifg=NONE')

----[Tabulation]-----
	opt.expandtab = true -- expand tab to spaces
	opt.shiftwidth = 4 -- 4 spaces for indent width
	opt.tabstop = 4 -- 4 spaces for tabs (prettier default)
	opt.smartindent = true -- copy indent from current line when starting new one

----[Search]----
	opt.showmatch = false -- highlight founded 
	opt.ignorecase = true -- ignoring word register

----[Clipboard]----
    opt.clipboard = 'unnamedplus'
