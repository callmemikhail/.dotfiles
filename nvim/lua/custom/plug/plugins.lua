local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data").."/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({
      "git",
      "clone",
      "--depth",
      "1",
      "https://github.com/wbthomason/packer.nvim",
      install_path
    })
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()


return require('packer').startup(function(use)
    --packer
    use 'wbthomason/packer.nvim'  
    -- vim move
    use 'matze/vim-move' 
    -- undotree
    use 'mbbill/undotree'    
    -- nerdree 
    use 'preservim/nerdtree'
    -- colorscheme
    use 'tinted-theming/tinted-vim'
    -- treesitter
    use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})
    -- telescope
    use {
        'nvim-telescope/telescope.nvim', 
        tag = '0.1.8',
        requires = { {'nvim-lua/plenary.nvim'} }
    }
    -- comment
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end 
    }
        -- nvim surround
    use({
        "kylechui/nvim-surround",
        tag = "*", -- Use for stability; ddit to use `main` branch 
        config = function()
            require("nvim-surround").setup({
            })
        end 
    })
    -- auto session
    use {
        'rmagatti/auto-session',
        config = function()
            require("auto-session").setup {
                suppressed_dirs = { "~/", "~/Projects", "~/Downloads", "/"},
            }
        end 
    }
        -- lsp
        end)
