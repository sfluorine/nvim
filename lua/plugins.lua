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
    ---------------------------------------

    'folke/tokyonight.nvim';

    'sakhnik/nvim-gdb';

    'mg979/vim-visual-multi';

    {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,

        config = function()
            require('nvim-treesitter-config')
        end
    };

    {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons',

        config = function()
            require('nvim-tree-config')
        end
    };

    {
        'sbdchd/neoformat',

        config = function()
            require('neoformat-config')
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
            require('todo-comments-config')
        end
    };

    {
        'Vonr/align.nvim',
        branch = "v2",
    };

    {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true },

        config = function()
            require('lualine').setup({
                options = {
                    theme = 'tokyonight'
                }
            })
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
