return {
	{
		"nvim-treesitter/nvim-treesitter",
		build = ":TSUpdate",
		config = function () 
			local configs = require("nvim-treesitter.configs")

			configs.setup({
				ensure_installed = { "vimdoc", "c", "lua" },
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
        'mg979/vim-visual-multi'
    }
}
