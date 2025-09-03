--[Key mapping]--
vim.g.mapleader = " " -- changing leader key from \ to <Space>
vim.g.maplocalleader = "\\"
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

--[General]--
vim.keymap.set("n", "<C-a>", "ggVG", { desc = "Highlight all text" })
vim.keymap.set("n", "<Esc>", "<cmd>nohl<CR>", { desc = "Clear highlighting" })
vim.keymap.set("n", "<Leader>Q", "<cmd>qa!<CR>", { desc = "Force full nvim exit" })

--[Moves]--
vim.keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll half slide up and center" })
vim.keymap.set("n", "<C-f>", "<C-f>zz", { desc = "Scroll one slide down and center" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll half slide down and center" })

--[Plug key mapping]--
--[NerdTree]--
vim.keymap.set("n", "<C-n>", "<cmd>NERDTreeToggle<CR>", { desc = "Toggle NerdTree" })

--[Floating_terminal]--
vim.keymap.set("n", "<leader>t", "<cmd>Floaterminal<CR>", { desc = "Toggle Floaterminal" })

--[UndoTree]--
vim.keymap.set("n", "<leader>u", "<cmd>UndotreeToggle<CR>", { desc = "Toggle Undotree" })

--[Auto-Session]--
vim.keymap.set("n", "<Leader>wa", "<cmd>SessionToggleAutoSave<CR>", { desc = "Toggle auto-session save" })
vim.keymap.set("n", "<Leader>ws", ':execute "SessionSave " . expand("%:p")<CR>', { desc = "Save session with absolute file path" })

--[Vim-move plug]--
vim.g.move_key_modifier = "C"
vim.g.move_key_modifier_visualmode = "C"

--[Telescope]--
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<CR>", { desc = "Search buffers" })
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<CR>", { desc = "Search files" })
vim.keymap.set("n", "<leader>fc", "<cmd>Telescope commands<CR>", { desc = "Search commands" })
vim.keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<CR>", { desc = "Search jumplist" })
vim.keymap.set("n", "<leader>fl", "<cmd>Telescope help_tags<CR>", { desc = "Search help tags" })
vim.keymap.set("n", "<leader>fm", "<cmd>Telescope marks<CR>", { desc = "Search marks" })
vim.keymap.set("n", "<leader>fh", "<cmd>Telescope search_history<CR>", { desc = "Search history" })
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<CR>", { desc = "Live grep search" })
vim.keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<CR>", { desc = "Search keymaps" })
vim.keymap.set("n", "<leader>fs", "<cmd>SessionSearch<CR>", { desc = "Search sessions (auto-session)" })
