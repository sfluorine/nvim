require('jabs').setup {
    -- Options for the main window
    position = {'right', 'bottom'}, -- position = {'<position_x>', '<position_y>'} | <position_x> left, center, right,
                                    --                                             <position_y> top, center, bottom
                                    -- Default {'right', 'bottom'}

    relative = 'win', -- win, editor, cursor. Default win
    clip_popup_size = true, -- clips the popup size to the win (or editor) size. Default true

    width = 60, -- default 50
    height = 20, -- default 10
    border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default shadow

    offset = { -- window position offset
        top = 0, -- default 0
        bottom = 0, -- default 0
        left = 0, -- default 0
        right = 0, -- default 0
    },

    sort_mru = true, -- Sort buffers by most recently used (true or false). Default false
    split_filename = false, -- Split filename into separate components for name and path. Default false
    split_filename_path_width = 0, -- If split_filename is true, how wide the column for the path is supposed to be, Default 0 (don't show path)

    -- Options for preview window
    preview_position = 'top', -- top, bottom, left, right. Default top
    preview = {
        width = 70, -- default 70
        height = 30, -- default 30
        border = 'rounded', -- none, single, double, rounded, solid, shadow, (or an array or chars). Default double
    },

    -- Default symbols
    symbols = {
        current = "", -- default 
        split = "", -- default 
        alternate = "", -- default 
        hidden = "﬘", -- default ﬘
        locked = "", -- default 
        ro = "", -- default 
        edited = "", -- default 
        terminal = "", -- default 
        default_file = "", -- Filetype icon if not present in nvim-web-devicons. Default 
        terminal_symbol = "", -- Filetype icon for a terminal split. Default 
    },

    -- Keymaps
    keymap = {
        close = "D",
        jump = "<CR>", -- Jump to buffer. Default <cr>
        h_split = "h", -- Horizontally split buffer. Default s
        v_split = "v", -- Vertically split buffer. Default v
        preview = "p", -- Open buffer preview. Default P
    },

    use_devicons = true,
}
