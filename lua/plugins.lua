return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function ()
			local configs = require("nvim-treesitter.configs")

			configs.setup({
                ensure_installed = {
                    "vimdoc",
                    "c",
                    "lua",
                    "html",
                    "javascript",
                    "typescript",
                    "json",
                    "lua",
                    "bash",
                    "markdown",
                },
                auto_install = false,
				sync_install = false,
				highlight = { enable = true },
				indent = { enable = true },
			})
		end
	},
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		init = function()
			-- vim.cmd.colorscheme("lackluster")
			-- vim.cmd.colorscheme("lackluster-hack") -- my favorite
			vim.cmd.colorscheme("lackluster-mint")
		end
	},
	{
		"echasnovski/mini.nvim",
		version = false,
		init = function()
			require("mini.animate").setup()
			require("mini.basics").setup()
			require("mini.comment").setup()
			require("mini.completion").setup()
			require("mini.cursorword").setup()
			require("mini.files").setup()
			require("mini.indentscope").setup()
			require("mini.move").setup()
			require("mini.notify").setup()
			require("mini.pairs").setup()
			require("mini.starter").setup()
			require("mini.statusline").setup()
			require("mini.surround").setup()
			require("mini.trailspace").setup()
            require("mini.tabline").setup()
		end
	},
    {
        "smoka7/hop.nvim",
        version = "*",
        opts = {
            keys = "etovxqpdygfblzhckisuran"
        }
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = "v3.x",
        init = function()
            local lsp_zero = require("lsp-zero")
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            local cmp = require("cmp")

            cmp.setup({
                sources = {
                    {name = "nvim_lsp"},
                },
                mapping = {
                    ["<C-e>"] = cmp.mapping.abort(),
                    ["<Enter>"] = function(fallback)
                        -- Don't block <CR> if signature help is active
                        -- https://github.com/hrsh7th/cmp-nvim-lsp-signature-help/issues/13
                        if not cmp.visible() or not cmp.get_selected_entry() or cmp.get_selected_entry().source.name == 'nvim_lsp_signature_help' then
                            fallback()
                        else
                            cmp.confirm({
                                -- Replace word if completing in the middle of a word
                                -- https://github.com/hrsh7th/nvim-cmp/issues/664
                                behavior = cmp.ConfirmBehavior.Replace,
                                -- Don't select first item on CR if nothing was selected
                                select = false,
                            })
                        end
                    end,
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                cmp.confirm()
                            end
                        else
                            fallback()
                        end
                    end),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then
                                cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
                            else
                                cmp.confirm()
                            end
                        else
                            fallback()
                        end
                    end),
                },
                snippet = {
                    expand = function(args)
                        require("luasnip").lsp_expand(args.body)
                    end,
                },
            })

            local lspconfig = require("lspconfig")

            lspconfig.html.setup({})
            lspconfig.tailwindcss.setup({})
            lspconfig.marksman.setup({})
            lspconfig.lua_ls.setup({})
            lspconfig.emmet_language_server.setup({})
            lspconfig.tsserver.setup({})
        end
    },
    {"mg979/vim-visual-multi"},
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/nvim-cmp"},
    {"L3MON4D3/LuaSnip"},
    {"nvim-tree/nvim-web-devicons"},
    {
        "barrett-ruth/live-server.nvim",
        cmd = { "LiveServerStart", "LiveServerStop" },
        config = true
    },
    {
        'nvim-telescope/telescope.nvim', tag = '0.1.6',
        -- or                              , branch = '0.1.x',
        dependencies = { 'nvim-lua/plenary.nvim' }
    },
    {
        "folke/which-key.nvim",
        event = "VeryLazy",
        init = function()
            vim.o.timeout = true
            vim.o.timeoutlen = 300
        end,
        opts = {
            -- your configuration comes here
            -- or leave it empty to use the default settings
        }
    }
}
