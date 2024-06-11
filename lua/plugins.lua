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
			require("mini.indentscope").setup()
			require("mini.move").setup()
			require("mini.notify").setup()
			require("mini.pairs").setup()
			require("mini.starter").setup()
			require("mini.statusline").setup()
			require("mini.surround").setup()
			require("mini.files").setup()
			require("mini.trailspace").setup()
		end
	},
    {
        'smoka7/hop.nvim',
        version = "*",
        opts = {
            keys = 'etovxqpdygfblzhckisuran'
        }
    },
    {
        "VonHeikemen/lsp-zero.nvim",
        branch = 'v3.x',
        init = function()
            local lsp_zero = require('lsp-zero')
            lsp_zero.extend_lspconfig()

            lsp_zero.on_attach(function(client, bufnr)
                lsp_zero.default_keymaps({buffer = bufnr})
            end)

            local cmp = require('cmp')

            cmp.setup({
                sources = {
                    {name = 'nvim_lsp'},
                },
                mapping = {
                    ['<C-e>'] = cmp.mapping.abort(),
                    ['<CR>'] = cmp.mapping.confirm({select = false}),
                    ['<Tab>'] = cmp.mapping.select_next_item({behavior = 'select'}),
                    ['<S-Tab>'] = cmp.mapping.select_prev_item({behavior = 'select'}),
                },
                snippet = {
                    expand = function(args)
                        require('luasnip').lsp_expand(args.body)
                    end,
                },
            })

            -- require('lspconfig').clangd.setup({})
            require('lspconfig').html.setup({})
            require('lspconfig').tailwindcss.setup({})
            require('lspconfig').marksman.setup({})
            require('lspconfig').lua_ls.setup({})
            require('lspconfig').emmet_language_server.setup{}
            require('lspconfig').eslint.setup({
                on_attach = function(client, bufnr)
                    vim.api.nvim_create_autocmd("BufWritePre", {
                        buffer = bufnr,
                        command = "EslintFixAll",
                    })
                end,
            })
        end
    },
    {"mg979/vim-visual-multi"},
    {"neovim/nvim-lspconfig"},
    {"hrsh7th/cmp-nvim-lsp"},
    {"hrsh7th/nvim-cmp"},
    {"L3MON4D3/LuaSnip"},
    {
        'barrett-ruth/live-server.nvim',
        cmd = { 'LiveServerStart', 'LiveServerStop' },
        config = true
    }
}
