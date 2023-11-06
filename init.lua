require("config")
vim.g.mapleader = " "


-- Cargar el complemento del esquema de colores Tokyo Night
vim.cmd('colorscheme tokyonight-night')

-- Establecer la opacidad de toda la ventana en Neovim
vim.cmd('highlight Normal guibg=#00000070') -- Cambia el color de fondo para ajustar la opacidad al 50%

vim.o.showtabline = 0
vim.o.laststatus = 2
vim.o.cmdheight = 1
vim.opt.termguicolors = true

local bufferline = require('bufferline')
bufferline.setup {
    options = {
        separator_style = { '', '' },
        separator_style = "none", -- Establece el separador a "none" para eliminar la barra
        mode = "buffers",
        style_preset = bufferline.style_preset.default,
        max_name_length = 18,
        max_prefix_length = 15,
        truncate_names = true,
        tab_size = 18,
        diagnostics = false,
        diagnostics_update_in_insert = false,
        custom_filter = function(buf_number, _)
            if vim.bo[buf_number].filetype ~= "<i-dont-want-to-see-this>" then
                return true
            end
            -- Agrega más condiciones de filtrado si es necesario
        end,
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = true,
        show_close_icon = true,
        show_tab_indicators = true,
        show_duplicate_prefix = true,
        persist_buffer_sort = true,
        move_wraps_at_ends = false,
        separator_style = "slant",
        enforce_regular_tabs = false,
        always_show_bufferline = true,
        hover = {
            enabled = true,
            delay = 200,
            reveal = {'close'}
        },
        sort_by = 'insert_after_current',

        -- Mapeos de teclado para cambiar entre pestañas y buffers
        mappings = {
            next = "<Tab>",
            prev = "<S-Tab>"
        }
    }
}

-- Mapeos de teclado para cambiar entre pestañas y buffers
vim.api.nvim_set_keymap('n', '<Tab>', ':BufferLineCycleNext<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-x>', ':bd<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap("n","<space>ff",":Telescope file_browser path=%:p:h select_buffer=true<CR>",{ noremap = true })
