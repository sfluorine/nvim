vim.g.neoformat_cpp_clangformat = {
    exe = 'clang-format',
    args = { '--style=file:".clang-format"' }
}

vim.g.neoformat_enabled_cpp = { 'clangformat' }
vim.g.neoformat_enabled_c = { 'clangformat' }
