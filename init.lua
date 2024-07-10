local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not (vim.uv or vim.loop).fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end

vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

require("lazy").setup("plugins")

vim.cmd([[
    set nocompatible
    set showmatch
    set ignorecase
    set mouse=v
    set hlsearch
    set incsearch
    set tabstop=4
    set softtabstop=4
    set expandtab
    set nowrap
    set nohlsearch
    set shiftwidth=4
    set wildmode=longest,list
    set clipboard=unnamedplus
    set spell
    set noswapfile
    set backupdir=~/.cache/vim

    filetype plugin on
]])

local which_key = require("which-key")
which_key.register({
    f = {
        name = "file",
        f = { ":Telescope find_files<CR>", "Find file" },
        g = { ":Telescope live_grep<CR>", "Grep file" },
        s = { ":lua MiniFiles.open()<CR> :lua MiniFiles.reset()<CR>", "Edit filesystem" },
    },
    b = {
        name = "buffer",
        b = { ":Telescope buffers<CR>", "Find buffer" },
        d = { ":bdelete<CR>", "Delete buffer" }
    },
    c = {
        name = "code",
        t = { ":lua MiniTrailspace.trim()<CR>", "Trim trailing whitespaces" },
    },
    h = {
        name = "hop",
        w = { ":HopWord<CR>", "Hop word" },
        l = { ":HopLine<CR>", "Hop line" },
    },
    s = {
        name = "split",
        v = { ":vs<CR>", "Split vertically" },
        h = { ":split<CR>", "Split horizontally" },
    },
}, { prefix = "<leader>" })
