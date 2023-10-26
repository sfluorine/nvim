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

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>bf', ':JABSOpen<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Neoformat<CR>', opts)

local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})

vim.keymap.set('n', '<leader>ftt', ':TodoTelescope keywords=TODO<CR>', opts)
vim.keymap.set('n', '<leader>ftn', ':TodoTelescope keywords=NOTE<CR>', opts)
vim.keymap.set('n', '<leader>fth', ':TodoTelescope keywords=HACK<CR>', opts)
