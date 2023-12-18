local colorscheme = 'nordic'

local ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)
if not ok then
    vim.notify('cannot load colorscheme: \'' .. colorscheme .. '\'', 'error')
end
