-- Install Packer automatically if it's not installed(Bootstraping)

local ensure_packer = function()
    local fn = vim.fn
    local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
    if fn.empty(fn.glob(install_path)) > 0 then
        fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
        vim.cmd [[packadd packer.nvim]]
        return true
    end
    return false
end

local packer_bootstrap = ensure_packer()

-- Install plugins here - `use ...`

local packer_result = require('packer').startup(function(use)
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    ---------------------------------------
    -- NOTE: PUT YOUR PLUGINS HERE --
    ---------------------------------------

    use 'folke/tokyonight.nvim'

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    use {
        'nvim-tree/nvim-tree.lua',
        requires = 'nvim-tree/nvim-web-devicons'
    }

    use 'matbme/JABS.nvim'
    use 'sbdchd/neoformat'

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.x',
        requires = 'nvim-lua/plenary.nvim'
    }

    use {
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
    }

    -- Automatically set up your configuration after cloning packer.nvim
    -- Put this at the end after all plugins
    if packer_bootstrap then
        require('packer').sync()
    end
end)

require('nvim-tree-config')
require('JABS-config')
require('nvim-treesitter-config')
require('neoformat-config')
require('todo-comments-config')

return packer_result
