-- Install Packer automatically if it's not installed(Bootstraping)

local ensure_pckr = function()
    local pckr_path = vim.fn.stdpath("data") .. "/pckr/pckr.nvim"

    if not vim.loop.fs_stat(pckr_path) then
        vim.fn.system({'git', 'clone', '--filter=blob:none', 'https://github.com/lewis6991/pckr.nvim', pckr_path})
        vim.opt.rtp:prepend(pckr_path)
    end

    vim.opt.rtp:prepend(pckr_path)
end

local packer_bootstrap = ensure_pckr()

local cmd = require('pckr.loader.cmd')
local keys = require('pckr.loader.keys')

require('pckr').add{
    ---------------------------------------
    -- NOTE: PUT YOUR PLUGINS HERE --
    'neovim/nvim-lspconfig';
    'hrsh7th/cmp-nvim-lsp';
    'lukas-reineke/cmp-under-comparator';
    'hrsh7th/cmp-buffer';
    'hrsh7th/cmp-path';
    'hrsh7th/cmp-cmdline';
    'hrsh7th/nvim-cmp';
    'L3MON4D3/LuaSnip';
    'saadparwaiz1/cmp_luasnip';

    'Tetralux/odin.vim';

    'sainnhe/everforest';

    {
        'AlexvZyl/nordic.nvim',

        config = function()
            require 'nordic' .setup {
                -- This callback can be used to override the colors used in the palette.
                on_palette = function(palette) return palette end,
                -- Enable bold keywords.
                bold_keywords = false,
                -- Enable italic comments.
                italic_comments = true,
                -- Enable general editor background transparency.
                transparent_bg = false,
                -- Enable brighter float border.
                bright_border = false,
                -- Reduce the overall amount of blue in the theme (diverges from base Nord).
                reduced_blue = true,
                -- Swap the dark background with the normal one.
                swap_backgrounds = false,
                -- Override the styling of any highlight group.
                override = {},
                -- Cursorline options.  Also includes visual/selection.
                cursorline = {
                    -- Bold font in cursorline.
                    bold = true,
                    -- Bold cursorline number.
                    bold_number = true,
                    -- Avialable styles: 'dark', 'light'.
                    theme = 'dark',
                    -- Blending the cursorline bg with the buffer bg.
                    blend = 0.7,
                },
                noice = {
                    -- Available styles: `classic`, `flat`.
                    style = 'flat',
                },
                telescope = {
                    -- Available styles: `classic`, `flat`.
                    style = 'flat',
                },
                leap = {
                    -- Dims the backdrop when using leap.
                    dim_backdrop = false,
                },
                ts_context = {
                    -- Enables dark background for treesitter-context window
                    dark_background = true,
                }
            }
        end
    };

    {
        'ribru17/bamboo.nvim',
        config = function()
            -- Lua
            require('bamboo').setup {
                -- Main options --
                -- NOTE: to use the light theme, set `vim.o.background = 'light'`
                style = 'multiplex', -- Choose between 'vulgaris' (regular), 'multiplex' (greener), and 'light'
                toggle_style_key = nil, -- Keybind to toggle theme style. Leave it nil to disable it, or set it to a string, e.g. "<leader>ts"
                toggle_style_list = { 'vulgaris', 'multiplex', 'light' }, -- List of styles to toggle between
                transparent = false, -- Show/hide background
                dim_inactive = false, -- Dim inactive windows/buffers
                term_colors = true, -- Change terminal color as per the selected theme style
                ending_tildes = false, -- Show the end-of-buffer tildes. By default they are hidden
                cmp_itemkind_reverse = false, -- reverse item kind highlights in cmp menu

                -- Change code style ---
                -- Options are italic, bold, underline, none
                -- You can configure multiple style with comma separated, For e.g., keywords = 'italic,bold'
                code_style = {
                    comments = 'italic',
                    conditionals = 'italic',
                    keywords = 'none',
                    functions = 'italic',
                    namespaces = 'italic',
                    parameters = 'italic',
                    strings = 'none',
                    variables = 'none',
                },

                -- Custom Highlights --
                colors = {}, -- Override default colors
                highlights = {}, -- Override highlight groups

                -- Plugins Config --
                diagnostics = {
                    darker = false, -- darker colors for diagnostic
                    undercurl = true, -- use undercurl instead of underline for diagnostics
                    background = true, -- use background color for virtual text
                },
            }
        end
    };

    {
        'sainnhe/gruvbox-material',

        config = function()
            vim.cmd([[
            let g:gruvbox_material_background = 'hard'
            let g:gruvbox_material_better_performance = 1
            ]])
        end

    };

    { 
        'rebelot/kanagawa.nvim',

        config = function()
            require('kanagawa').setup({
                compile = false,             -- enable compiling the colorscheme
                undercurl = true,            -- enable undercurls
                commentStyle = { italic = true },
                functionStyle = {},
                keywordStyle = { italic = true },
                statementStyle = { bold = true },
                typeStyle = { italic = true, bold = true },
                transparent = false,         -- do not set background color
                dimInactive = false,         -- dim inactive window `:h hl-NormalNC`
                terminalColors = true,       -- define vim.g.terminal_color_{0,17}
                colors = {                   -- add/modify theme and palette colors
                    palette = {},
                    theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
                },

                overrides = function(colors) -- add/modify highlights
                    return {}
                end,

                theme = "wave",              -- Load "wave" theme when 'background' option is not set
                background = {               -- map the value of 'background' option to a theme
                    dark = "wave",           -- try "dragon" !
                    light = "lotus"
                },
            })
        end
    };

    {
        'folke/noice.nvim',

        requires = {
            -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
            'MunifTanjim/nui.nvim',
        },

        config = function()
            require('noice').setup({
                lsp = {
                    -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
                    override = {
                        ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
                        ["vim.lsp.util.stylize_markdown"] = true,
                        ["cmp.entry.get_documentation"] = true,
                    },
                },
                -- you can enable a preset for easier configuration
                presets = {
                    bottom_search = true, -- use a classic bottom cmdline for search
                    command_palette = true, -- position the cmdline and popupmenu together
                    long_message_to_split = true, -- long messages will be sent to a split
                    inc_rename = false, -- enables an input dialog for inc-rename.nvim
                    lsp_doc_border = false, -- add a border to hover docs and signature help
                },
            })
        end
    };

    {
        'nvim-treesitter/nvim-treesitter',

        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,

        config = function()
            require'nvim-treesitter.configs'.setup {
                ensure_installed = { "c", "cpp", "vim", "lua", "odin" },

                -- Install parsers synchronously (only applied to `ensure_installed`)
                sync_install = false,

                -- Automatically install missing parsers when entering buffer
                -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
                auto_install = false,

                ---- If you need to change the installation directory of the parsers (see -> Advanced Setup)
                -- parser_install_dir = "/some/path/to/store/parsers", -- Remember to run vim.opt.runtimepath:append("/some/path/to/store/parsers")!

                highlight = {
                    enable = true,

                    -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
                    -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
                    -- the name of the parser)
                    -- list of language that will be disabled
                    -- example:
                    -- disable = { "c", "rust" },

                    disable = {},

                    -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
                    -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
                    -- Using this option may slow down your editor, and you may see some duplicate highlights.
                    -- Instead of true it can also be a list of languages
                    additional_vim_regex_highlighting = false,
                },
            }
        end
    };

    {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',

        config = function()
            require("nvim-tree").setup({
                sort_by = "case_sensitive",
                view = {
                    width = 30,
                },
                renderer = {
                    group_empty = true,
                },
                filters = {
                    dotfiles = false,
                },
            })
        end
    };

    {
        'sbdchd/neoformat',

        config = function()
            vim.g.neoformat_cpp_clangformat = {
                exe = 'clang-format',
                args = { '--style=file:".clang-format"' }
            }

            vim.g.neoformat_enabled_cpp = { 'clangformat' }
            vim.g.neoformat_enabled_c = { 'clangformat' }

            vim.g.neoformat_cmake_cmakeformat = {
                exe = 'cmake-format',
            }

            vim.g.neoformat_enabled_cmake = { 'cmakeformat' }
        end
    };

    {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = 'nvim-lua/plenary.nvim'
    };

    {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",

        config = function()
            require('todo-comments').setup()
        end
    };

    {
        'phaazon/hop.nvim',
        branch = 'v2', -- optional but strongly recommended

        config = function()
            -- you can configure Hop the way you like here; see :h hop-config
            require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
        end
    };

    {
        'nvimdev/dashboard-nvim',

        event = 'VimEnter',
        requires = 'nvim-tree/nvim-web-devicons',

        config = function()
            local header = {
                [[                                   ]],
                [[   ⣴⣶⣤⡤⠦⣤⣀⣤⠆     ⣈⣭⣭⣿⣶⣿⣦⣼⣆         ]],
                [[    ⠉⠻⢿⣿⠿⣿⣿⣶⣦⠤⠄⡠⢾⣿⣿⡿⠋⠉⠉⠻⣿⣿⡛⣦       ]],
                [[          ⠈⢿⣿⣟⠦ ⣾⣿⣿⣷⠄⠄⠄⠄⠻⠿⢿⣿⣧⣄     ]],
                [[           ⣸⣿⣿⢧ ⢻⠻⣿⣿⣷⣄⣀⠄⠢⣀⡀⠈⠙⠿⠄    ]],
                [[          ⢠⣿⣿⣿⠈  ⠡⠌⣻⣿⣿⣿⣿⣿⣿⣿⣛⣳⣤⣀⣀   ]],
                [[   ⢠⣧⣶⣥⡤⢄ ⣸⣿⣿⠘⠄ ⢀⣴⣿⣿⡿⠛⣿⣿⣧⠈⢿⠿⠟⠛⠻⠿⠄  ]],
                [[  ⣰⣿⣿⠛⠻⣿⣿⡦⢹⣿⣷   ⢊⣿⣿⡏  ⢸⣿⣿⡇ ⢀⣠⣄⣾⠄   ]],
                [[ ⣠⣿⠿⠛⠄⢀⣿⣿⣷⠘⢿⣿⣦⡀ ⢸⢿⣿⣿⣄ ⣸⣿⣿⡇⣪⣿⡿⠿⣿⣷⡄  ]],
                [[ ⠙⠃   ⣼⣿⡟  ⠈⠻⣿⣿⣦⣌⡇⠻⣿⣿⣷⣿⣿⣿ ⣿⣿⡇⠄⠛⠻⢷⣄ ]],
                [[      ⢻⣿⣿⣄   ⠈⠻⣿⣿⣿⣷⣿⣿⣿⣿⣿⡟ ⠫⢿⣿⡆     ]],
                [[       ⠻⣿⣿⣿⣿⣶⣶⣾⣿⣿⣿⣿⣿⣿⣿⣿⡟⢀⣀⣤⣾⡿⠃     ]],
                [[     ⢰⣶  ⣶ ⢶⣆⢀⣶⠂⣶⡶⠶⣦⡄⢰⣶⠶⢶⣦  ⣴⣶     ]],
                [[     ⢸⣿⠶⠶⣿ ⠈⢻⣿⠁ ⣿⡇ ⢸⣿⢸⣿⢶⣾⠏ ⣸⣟⣹⣧    ]],
                [[     ⠸⠿  ⠿  ⠸⠿  ⠿⠷⠶⠿⠃⠸⠿⠄⠙⠷⠤⠿⠉⠉⠿⠆   ]],
                [[                                   ]],
            }

            require('dashboard').setup {
                theme = 'hyper',
                config = {
                    header = header,
                },
            }
        end
    };

    {
        'terrortylor/nvim-comment',

        config = function()
            require('nvim_comment').setup()
        end
    };
}
