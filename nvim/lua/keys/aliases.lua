
--[Key mapping]--
    vim.g.mapleader = " " -- changing leader key from \ to <Space>
    vim.g.maplocalleader = "\\"
    opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position
    --[General]--
    bind_key("n", "<C-a>", "ggVG", "Highlight all text" )
    bind_key("n", "<Esc>", "<cmd>nohl<CR>", "Clear highlighting" )
    bind_key("n", "<Leader>Q", "<cmd>qa!<CR>", "Force full nvim exit")

    --[Moves]--
    bind_key("n", "<C-u>", "<C-u>zz", "scroll half slide up and move cursor to the mid")
    bind_key("n", "<C-f>", "<C-f>zz", "scroll one slide down and move cursor to the mid")
    bind_key("n", "<C-d>", "<C-d>zz", "scroll half slide down and move cursor to the mid")

    --[Plug key mapping]--
        --[NerdTree]--
        bind_key("n", "<C-n>", "<cmd>NERDTreeToggle<CR>", "Toggle nerdtree plug")
        --[Floating_terminal]--
        bind_key("n", "<leader>t", "<cmd>Floaterminal<CR>", "Toggle Floaterminal")
        --[UndoTree]--
        bind_key("n", "<leader>u", "<cmd>UndotreeToggle<CR>", "Toggle undotree plug")
    
        --[Auto-Session]--
        bind_key("n", "<Leader>wa", "<cmd>SessionToggleAutoSave<CR>", "Session autotoggle")
        bind_key('n', '<Leader>ws', ':execute "SessionSave " . expand("%:p")<CR>', "Save session with absolute file path")

        --[Vim-move plug]--
        g.move_key_modifier = "C"
        g.move_key_modifier_visualmode = "C"

        --[Telescope]--
        bind_key("n", "<leader>fb", "<cmd>Telescope buffers<CR>", "Search through nvim buffers")
        bind_key("n", "<leader>ff", "<cmd>Telescope find_files<CR>", "Search through nvim files")
        bind_key("n", "<leader>fc", "<cmd>Telescope commands<CR>", "Search through nvim commands")
        bind_key("n", "<leader>fj", "<cmd>Telescope jumplist<CR>", "Search through nvim jumplist")
        bind_key("n", "<leader>fl", "<cmd>Telescope help_tags<CR>", "Search through nvim help tags")
        bind_key("n", "<leader>fm", "<cmd>Telescope marks<CR>", "Search through nvim marks (local & global)")
        bind_key("n", "<leader>fh", "<cmd>Telescope search_history<CR>", "Search through nvim search history")
        bind_key("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", "Search through nvim files with live grep")
        bind_key("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", "Search through nvim keymaps (with descriptions)")
        bind_key("n", "<leader>fs", "<cmd>SessionSearch<CR>", "Search through nvim sessions (using the auto-session plugin)")

