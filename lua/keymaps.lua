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

vim.keymap.set('n', '<leader>da', ':Dashboard<CR>', opts)

vim.keymap.set('n', '<leader>e', ':NvimTreeToggle<CR>', opts)
vim.keymap.set('n', '<leader>fb', ':Neoformat<CR>', opts)

vim.keymap.set('n', '<leader>ff', ':Telescope find_files<CR>', opts)
vim.keymap.set('n', '<leader>fh', ':Telescope find_files hidden=true<CR>', opts)

vim.keymap.set('n', '<leader>fg', ':Telescope live_grep hidden=true<CR>', opts)

vim.keymap.set('n', '<leader>tt', ':TodoTelescope keywords=TODO<CR>', opts)
vim.keymap.set('n', '<leader>tn', ':TodoTelescope keywords=NOTE<CR>', opts)
vim.keymap.set('n', '<leader>th', ':TodoTelescope keywords=HACK<CR>', opts)
vim.keymap.set('n', '<leader>tqf', ':TodoQuickFix<CR>', opts)

vim.keymap.set('n', '<leader>hw', ':HopWord<CR>', opts)
vim.keymap.set('n', '<leader>hl', ':HopLine<CR>', opts)
vim.keymap.set('n', '<leader>hp', ':HopPattern<CR>', opts)

vim.keymap.set({'n', 'v'}, '<leader>/', ':CommentToggle<CR>', opts)

vim.keymap.set('n', '<leader>de', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, opts)

vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
vim.keymap.set('i', '<C-k>', vim.lsp.buf.signature_help, opts)
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
