vim.g.neoformat_cpp_clangformat = {
    exe = 'clang-format',
    args = { '--style=file:".clang-format"' }
}

vim.g.neoformat_enabled_cpp = { 'clangformat' }
vim.g.neoformat_enabled_c = { 'clangformat' }

vim.g.neoformat_cmake_cmakeformat = {
    exe = 'cmake-format',
}

vim.g.neoformat_enabled_cmake = { 'cmakeformat' }
