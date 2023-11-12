vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.clipboard = 'unnamedplus'
vim.opt.completeopt = {'menu', 'menuone', 'noselect'}
vim.opt.mouse = ''

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true 
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.termguicolors = true
vim.opt.showmode = false
vim.opt.fillchars = {eob = ' '}
vim.opt.wrap = false

vim.opt.incsearch = true
vim.opt.hlsearch = false
vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.cino = 'l1'

vim.cmd([[
    autocmd FileType * set formatoptions-=cro
]])

vim.cmd([[
    highlight LineNr guibg=NONE
    highlight CursorLine guibg=NONE guifg=NONE
    highlight CursorLineNr guibg=NONE guifg=NONE
]])
