local opts = {
    noremap = true,
    silent = true,
}

vim.g.mapleader = ' '

vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
vim.keymap.set('n', '<C-l>', '<C-w>l', opts)

vim.keymap.set('n', '<C-Up>', ':resize -2<CR>', opts)
vim.keymap.set('n', '<C-Down>', ':resize +2<CR>', opts)
vim.keymap.set('n', '<C-Left>', ':vertical resize -2<CR>', opts)
vim.keymap.set('n', '<C-Right>', ':vertical resize +2<CR>', opts)

vim.keymap.set('n', '<leader>vs', ':vsplit<CR>', opts)
vim.keymap.set('n', '<leader>hs', ':split<CR>', opts)

vim.keymap.set('n', '<leader>d', ':Dashboard<CR>', opts)

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>b', ':JABSOpen<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Neoformat<CR>', opts)

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>fh', ':Telescope find_files hidden=true<CR>', opts)

vim.keymap.set('n', '<leader>fg', ':Telescope live_grep hidden=true<CR>', opts)

vim.keymap.set('n', '<leader>tt', ':TodoTelescope keywords=TODO<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':TodoTelescope keywords=NOTE<CR>', opts)
vim.keymap.set('n', '<leader>th', ':TodoTelescope keywords=HACK<CR>', opts)
vim.keymap.set('n', '<leader>tqf', ':TodoQuickFix<CR>', opts)

vim.keymap.set('n', '<leader>ts', ':lua MiniTrailspace.trim()<CR>', opts)

vim.keymap.set({ "n", "x" }, "<leader>sr", function() require("ssr").open() end)

-- Aligns to 1 character
vim.keymap.set(
    'x',
    'aa',
    function()
        require('align').align_to_char({
            length = 1,
        })
    end,
    opts
)

-- Aligns to 2 characters with previews
vim.keymap.set(
    'x',
    'ad',
    function()
        require('align').align_to_char({
            preview = true,
            length = 2,
        })
    end,
    opts
)

-- Aligns to a string with previews
vim.keymap.set(
    'x',
    'aw',
    function()
        require('align').align_to_string({
            preview = true,
            regex = false,
        })
    end,
    opts
)

-- Aligns to a Vim regex with previews
vim.keymap.set(
    'x',
    'ar',
    function()
        require('align').align_to_string({
            preview = true,
            regex = true,
        })
    end,
    opts
)

-- Example gawip to align a paragraph to a string with previews
vim.keymap.set(
    'n',
    'gaw',
    function()
        local a = require('align')
        a.operator(
            a.align_to_string,
            {
                regex = false,
                preview = true,
            }
        )
    end,
    opts
)

-- Example gaaip to align a paragraph to 1 character
vim.keymap.set(
    'n',
    'gaa',
    function()
        local a = require('align')
        a.operator(a.align_to_char)
    end,
    opts
)
