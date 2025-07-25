return {
    {
        "hrsh7th/nvim-cmp",
        lazy = true, 
        dependencies = {
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-nvim-lsp",
        },


        config = function()
            local cmp = require('cmp')
            -- local luasnip = require('luasnip')

            completion ={
                completeopt = "menu,menuone,noselect" 
            },

            cmp.setup({
                -- TODO MENU
                -- menu = {
                    --     path = "[pth]",       
                    --     buffer = "[buf]",     
                    --     luasnip = "[snp]",    
                    --     nvim_lsp = "[lsp]",   
                    --     nvim_lua = "[api]",   
                    -- },
                    window = {
                        completion = cmp.config.window.bordered(),
                        documentation = cmp.config.window.bordered(),
                    },
                    sources = {
                        { name = "nvim_lsp" },
                        -- { name = "luasnip" },
                        { name = "buffer" },
                        { name = "path" },
                    },
                    mapping = cmp.mapping.preset.insert({
                        ['<C-Space>'] = cmp.mapping.complete(),
                        ["<C-j>"] = cmp.mapping.select_next_item(),
                        ["<C-k>"] = cmp.mapping.select_prev_item(),
                        ['<CR>'] = cmp.mapping.confirm({ select = true }),
                    }),
                    -- snippet = {
                        --     expand = function(args)
                            --         require('luasnip').lsp_expand(args.body)
                            --     end,
                            -- },
                            experimental = {
                                ghost_text = true
                            },
                        })
                    end
                }, 
                {                   
                    "neovim/nvim-lspconfig",
                    lazy = true,
                    config = function()
                        reuqire("nvim-lspconfig").setup({})
                    end     
                },           

                { "hrsh7th/cmp-nvim-lua", lazy = true, },
                { "saadparwaiz1/cmp_luasnip", lazy = true, },
            }
