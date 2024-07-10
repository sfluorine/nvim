return {
    {
        "EdenEast/nightfox.nvim",
        config = function()
            require('nightfox').setup({
                options = {
                    -- Compiled file's destination location
                    compile_path = vim.fn.stdpath("cache") .. "/nightfox",
                    compile_file_suffix = "_compiled", -- Compiled file suffix
                    transparent = true,     -- Disable setting background
                    terminal_colors = true,  -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
                    dim_inactive = false,    -- Non focused panes set to alternative background
                    module_default = true,   -- Default enable value for modules
                    styles = {               -- Style to be applied to different syntax groups
                        comments = "italic",     -- Value is any valid attr-list value `:help attr-list`
                        conditionals = "italic",
                        constants = "bold",
                        functions = "NONE",
                        keywords = "italic,bold",
                        numbers = "NONE",
                        operators = "NONE",
                        strings = "NONE",
                        types = "italic,bold",
                        variables = "NONE",
                    },
                    inverse = {             -- Inverse highlight for different types
                        match_paren = true,
                        visual = true,
                        search = true,
                    },
                    modules = {             -- List of various plugins and additional options
                        -- ...
                    },
                },
            })

            -- setup must be called before loading
            vim.cmd("colorscheme nordfox")
        end
    },
    {
        "nvim-treesitter/nvim-treesitter",
        build = ":TSUpdate",
        config = function()
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
        "echasnovski/mini.nvim",
        version = false,
        init = function()
            require("mini.animate").setup()
            require("mini.basics").setup({
                -- Options. Set to `false` to disable.
                options = {
                    -- Basic options ("number", "ignorecase", and many more)
                    basic = false,

                    -- Extra UI features ("winblend", "cmdheight=0", ...)
                    extra_ui = false,

                    -- Presets for window borders ("single", "double", ...)
                    win_borders = "default",
                },

                -- Mappings. Set to `false` to disable.
                mappings = {
                    -- Basic mappings (better "jk", save with Ctrl+S, ...)
                    basic = true,

                    -- Prefix for mappings that toggle common options ("wrap", "spell", ...).
                    -- Supply empty string to not create these mappings.
                    option_toggle_prefix = [[\]],

                    -- Window navigation with <C-hjkl>, resize with <C-arrow>
                    windows = true,

                    -- Move cursor in Insert, Command, and Terminal mode with <M-hjkl>
                    move_with_alt = false,
                },

                -- Autocommands. Set to `false` to disable
                autocommands = {
                    -- Basic autocommands (highlight on yank, start Insert in terminal, ...)
                    basic = true,

                    -- Set "relativenumber" only in linewise and blockwise Visual mode
                    relnum_in_visual_mode = false,
                },

                -- Whether to disable showing non-error feedback
                silent = true,
            }
            );
            require("mini.comment").setup()
            require("mini.cursorword").setup()
            require("mini.files").setup()
            require("mini.completion").setup()
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

            lsp_zero.on_attach(function(_, bufnr)
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
                        if not cmp.visible() or not cmp.get_selected_entry() or cmp.get_selected_entry().source.name == "nvim_lsp_signature_help" then
                            fallback()
                        else
                            cmp.confirm({
                                behavior = cmp.ConfirmBehavior.Replace,
                                select = false,
                            })
                        end
                    end,
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                        else
                            fallback()
                        end
                    end),
                    ["<S-Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            cmp.select_prev_item({ behavior = cmp.SelectBehavior.Select })
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
    {"williamboman/mason.nvim"},
    {
        "williamboman/mason-lspconfig.nvim",
        init = function()
            require("mason").setup()
            require("mason-lspconfig").setup({
                ensure_installed = {
                    "html",
                    "tailwindcss",
                    "marksman",
                    "lua_ls",
                    "emmet_language_server",
                    "tsserver",
                }
            })
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
        "nvim-telescope/telescope.nvim", tag = "0.1.6",
        -- or                              , branch = "0.1.x",
        dependencies = { "nvim-lua/plenary.nvim" }
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
    },
    {
        "stevearc/dressing.nvim",
        init = function()
            require("dressing").setup({
                input = {
                    -- Set to false to disable the vim.ui.input implementation
                    enabled = true,

                    -- Default prompt string
                    default_prompt = "Input",

                    -- Trim trailing `:` from prompt
                    trim_prompt = true,

                    -- Can be "left", "right", or "center"
                    title_pos = "center",

                    -- When true, input will start in insert mode.
                    start_in_insert = true,

                    -- These are passed to nvim_open_win
                    border = "rounded",

                    -- "editor" and "win" will default to being centered
                    relative = "cursor",

                    -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                    prefer_width = 40,
                    width = nil,
                    -- min_width and max_width can be a list of mixed types.
                    -- min_width = {20, 0.2} means "the greater of 20 columns or 20% of total"
                    max_width = { 140, 0.9 },
                    min_width = { 20, 0.2 },

                    buf_options = {},
                    win_options = {
                        -- Disable line wrapping
                        wrap = false,
                        -- Indicator for when text exceeds window
                        list = true,
                        listchars = "precedes:…,extends:…",
                        -- Increase this for more context when text scrolls off the window
                        sidescrolloff = 0,
                    },

                    -- Set to `false` to disable
                    mappings = {
                        n = {
                            ["<Esc>"] = "Close",
                            ["<CR>"] = "Confirm",
                        },
                        i = {
                            ["<C-c>"] = "Close",
                            ["<CR>"] = "Confirm",
                            ["<Up>"] = "HistoryPrev",
                            ["<Down>"] = "HistoryNext",
                        },
                    },

                    override = function(conf)
                        -- This is the config that will be passed to nvim_open_win.
                        -- Change values here to customize the layout
                        return conf
                    end,

                    -- see :help dressing_get_config
                    get_config = nil,
                },
                select = {
                    -- Set to false to disable the vim.ui.select implementation
                    enabled = true,

                    -- Priority list of preferred vim.select implementations
                    backend = { "telescope", "fzf_lua", "fzf", "builtin", "nui" },

                    -- Trim trailing `:` from prompt
                    trim_prompt = true,

                    -- Options for telescope selector
                    -- These are passed into the telescope picker directly. Can be used like:
                    -- telescope = require("telescope.themes").get_ivy({...})
                    telescope = nil,

                    -- Options for fzf selector
                    fzf = {
                        window = {
                            width = 0.5,
                            height = 0.4,
                        },
                    },

                    -- Options for fzf-lua
                    fzf_lua = {
                        -- winopts = {
                        --   height = 0.5,
                        --   width = 0.5,
                        -- },
                    },

                    -- Options for nui Menu
                    nui = {
                        position = "50%",
                        size = nil,
                        relative = "editor",
                        border = {
                            style = "rounded",
                        },
                        buf_options = {
                            swapfile = false,
                            filetype = "DressingSelect",
                        },
                        win_options = {
                            winblend = 0,
                        },
                        max_width = 80,
                        max_height = 40,
                        min_width = 40,
                        min_height = 10,
                    },

                    -- Options for built-in selector
                    builtin = {
                        -- Display numbers for options and set up keymaps
                        show_numbers = true,
                        -- These are passed to nvim_open_win
                        border = "rounded",
                        -- "editor" and "win" will default to being centered
                        relative = "editor",

                        buf_options = {},
                        win_options = {
                            cursorline = true,
                            cursorlineopt = "both",
                        },

                        -- These can be integers or a float between 0 and 1 (e.g. 0.4 for 40%)
                        -- the min_ and max_ options can be a list of mixed types.
                        -- max_width = {140, 0.8} means "the lesser of 140 columns or 80% of total"
                        width = nil,
                        max_width = { 140, 0.8 },
                        min_width = { 40, 0.2 },
                        height = nil,
                        max_height = 0.9,
                        min_height = { 10, 0.2 },

                        -- Set to `false` to disable
                        mappings = {
                            ["<Esc>"] = "Close",
                            ["<C-c>"] = "Close",
                            ["<CR>"] = "Confirm",
                        },

                        override = function(conf)
                            -- This is the config that will be passed to nvim_open_win.
                            -- Change values here to customize the layout
                            return conf
                        end,
                    },

                    -- Used to override format_item. See :help dressing-format
                    format_item_override = {},

                    -- see :help dressing_get_config
                    get_config = nil,
                },
            })
        end,
        opts = {},
    },
    {
        "rcarriga/nvim-notify",

        init = function()
            vim.notify = require("notify")
        end
    }
}
