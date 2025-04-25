
--[Key mapping]--
    vim.g.mapleader = " " -- changing leader key from \ to <Space>
    opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

    --[Moves]--
    bind_key("n", "<C-u>", "<C-u>zz", "scroll half slide up and move cursor to the mid")
    bind_key("n", "<C-f>", "<C-f>zz", "scroll one slide down and move cursor to the mid")
    bind_key("n", "<C-d>", "<C-d>zz", "scroll half slide down and move cursor to the mid")

    --[Plug key mapping]--

        --[Nvim-Surround]--
        bind_key("v", "<C-y>s", ":'<,'> norm yss'", "surround selected area")

        --[NerdTree]--
        bind_key("n", "<C-n>", ":NERDTreeToggle <CR>", "toggle nerdtree plug")

        --[UndoTree]--
        bind_key("n", "<leader>u", ":UndotreeToggle <CR>", "toggle undotree plug")

        --[Vim-move plug]--
        g.move_key_modifier = "C"
        g.move_key_modifier_visualmode = "C"

        --[Telescope]--
        bind_key("n", "<leader>fb", ":Telescope buffers<CR>", "Search through nvim buffers")
        bind_key("n", "<leader>ff", ":Telescope find_files<CR>", "Search through nvim files")
        bind_key("n", "<leader>fc", ":Telescope commands<CR>", "Search through nvim commands")
        bind_key("n", "<leader>fj", ":Telescope jumplist<CR>", "Search through nvim jumplist")
        bind_key("n", "<leader>fl", ":Telescope help_tags<CR>", "Search through nvim help tags")
        bind_key("n", "<leader>fm", ":Telescope marks<CR>", "Search through nvim marks (local & global)")
        bind_key("n", "<leader>fh", ":Telescope search_history<CR>", "Search through nvim search history")
        bind_key("n", "<leader>fg", ":Telescope live_grep<CR>", "Search through nvim files with live grep")
        bind_key("n", "<leader>fk", ":Telescope keymaps<CR>", "Search through nvim keymaps (with descriptions)")
        bind_key("n", "<leader>fo", ":SessionSearch<CR>", "Search through nvim sessions (using the auto-session plugin)")

