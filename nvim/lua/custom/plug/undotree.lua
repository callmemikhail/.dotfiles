return {
    "mbbill/undotree",
    lazy = true,
    cmd = 'UndotreeToggle',
    config = function()
        vim.o.undofile = true
        vim.o.undodir = vim.fn.expand("~/.local/share/nvim/undofiles")
    end
}
