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

vim.cmd([[  set nocompatible
	        set showmatch
	        set ignorecase
	        set mouse=v
	        set hlsearch
	        set incsearch
	        set tabstop=4
	        set softtabstop=4
	        set expandtab
	        set shiftwidth=4
	        set wildmode=longest,list
	        set cc=80
	        set clipboard=unnamedplus
	        set spell
	        set noswapfile
	        set backupdir=~/.cache/vim

	        filetype plugin on
 ]])

local opt = {
    noremap = true,
    silent = true,
}

vim.keymap.set("n", "<leader>f", ":lua MiniFiles.open()<CR> :lua MiniFiles.reset()<CR>", opt)
