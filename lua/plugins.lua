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
    'dart-lang/dart-vim-plugin';

    'sainnhe/everforest';
    'AlexvZyl/nordic.nvim';
    'ellisonleao/gruvbox.nvim';
    'junegunn/fzf.vim';
    'mg979/vim-visual-multi';

    {
        'olimorris/onedarkpro.nvim',
        config = function()
            require("onedarkpro").setup({
                styles = {
                    types = "NONE",
                    methods = "NONE",
                    numbers = "NONE",
                    strings = "NONE",
                    comments = "italic",
                    keywords = "bold,italic",
                    constants = "NONE",
                    functions = "italic",
                    operators = "NONE",
                    variables = "NONE",
                    parameters = "NONE",
                    conditionals = "italic",
                    virtual_text = "italic",
                }
            })
        end
    };

    {
        'akinsho/flutter-tools.nvim',

        requires = {
            'nvim-lua/plenary.nvim',
            'stevearc/dressing.nvim', -- optional for vim.ui.select
        },

        config = function()
            require("flutter-tools").setup {
                flutter_path = "/home/freedbytes/bin/flutter/bin/flutter", -- <-- this takes priority over the lookup
            } -- use defaults
        end
    };

    {
        'kylechui/nvim-surround',

        config = function()
            require("nvim-surround").setup({
                -- Configuration here, or leave empty to use defaults
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
        'mhartington/formatter.nvim',

        config = function()
            -- Utilities for creating configurations
            local util = require("formatter.util")

            -- Provides the Format, FormatWrite, FormatLock, and FormatWriteLock commands
            require("formatter").setup {
                -- Enable or disable logging
                logging = true,

                -- Set the log level
                log_level = vim.log.levels.WARN,

                -- All formatter configurations are opt-in
                filetype = {
                    odin = {
                        function()
                            return {
                                exe = "odinfmt",
                                args = {
                                    "-stdin",
                                    util.get_current_buffer_file_path(),
                                },
                                stdin = true,
                            }
                        end
                    },
                    c = {
                        function()
                            return {
                                exe = "clang-format",
                                stdin = true,
                            }
                        end
                    },
                    -- Use the special "*" filetype for defining formatter configurations on
                    -- any filetype
                    ["*"] = {
                        -- "formatter.filetypes.any" defines default configurations for any
                        -- filetype
                        require("formatter.filetypes.any").remove_trailing_whitespace
                    }
                }
            }

            local augroup = vim.api.nvim_create_augroup
            local autocmd = vim.api.nvim_create_autocmd
            augroup("__formatter__", { clear = true })
            autocmd("BufWritePost", {
                group = "__formatter__",
                command = ":FormatWrite",
            })
        end
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
        'terrortylor/nvim-comment',

        config = function()
            require('nvim_comment').setup()
        end
    };
}
