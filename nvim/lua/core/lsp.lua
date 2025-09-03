vim.lsp.enable({
  "clangd",
  "pyright",
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function(ev)
    local filetype = ev.match
    local lsp_config_path = "lsp." .. filetype

    local ok, config = pcall(require, lsp_config_path)
    if ok and config then
      vim.lsp.start(config)
    end
  end,
})

vim.diagnostic.config({
  virtual_lines = false,
  virtual_text = { current_line = true },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
  float = {
    border = "rounded",
    source = true,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "R",
      [vim.diagnostic.severity.WARN]  = "W",
      [vim.diagnostic.severity.INFO]  = "I",
      [vim.diagnostic.severity.HINT]  = "H",
    },
    numhl = {
      [vim.diagnostic.severity.ERROR] = "ErrorMsg",
      [vim.diagnostic.severity.WARN]  = "WarningMsg",
    },
  },
})

local function cmp_keymap(key, direction)
  vim.keymap.set("i", key, function()
    if vim.fn.pumvisible() == 1 then
      if direction == "next" then
        return vim.api.nvim_replace_termcodes("<C-n>", true, true, true)
      else
        return vim.api.nvim_replace_termcodes("<C-p>", true, true, true)
      end
    else
      return key
    end
  end, { expr = true, noremap = true })
end

vim.api.nvim_create_autocmd("LspAttach", {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    local buf = ev.buf
    local bufopts = { buffer = buf, noremap = true, silent = true }

    ---[Navigation]---
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
    vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)

    ---[Documentation]---
    vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)

    ---[Editing]---
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, bufopts)
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, bufopts)

    ---[Diagnostic]---
    vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts)
    vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts)
    vim.keymap.set("n", "<leader>dl", vim.diagnostic.open_float, bufopts)

    -- Completion в InsertMode
    if client and client:supports_method("textDocument/completion") then
      cmp_keymap("<C-j>", "next")
      cmp_keymap("<C-k>", "prev")

      vim.api.nvim_buf_set_option(buf, "omnifunc", "v:lua.vim.lsp.omnifunc")

      vim.api.nvim_create_autocmd("TextChangedI", {
        buffer = buf,
        callback = function()
          local col = vim.fn.col(".") - 1
          if col > 0 and vim.fn.pumvisible() == 0 then
            vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<C-x><C-o>", true, false, true), "n")
          end
        end,
      })
    end
  end,
})
