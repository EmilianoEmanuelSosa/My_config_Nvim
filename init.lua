require("config")
require("keymaps")

-- Cargar el complemento del esquema de colores Tokyo Night
vim.cmd('colorscheme tokyonight-night')

-- Establecer la opacidad de toda la ventana en Neovim
vim.cmd('highlight Normal guibg=#00000070') -- Cambia el color de fondo para ajustar la opacidad al 50%

vim.o.showtabline = 0
vim.o.laststatus = 2
vim.o.cmdheight = 1
vim.opt.termguicolors = true

-- BUFFERLINE
local bufferline = require('bufferline')
bufferline.setup {
options = {
      separator_style = "none",
      mode = "buffers",
      style_preset = "default",
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


















local ok, lualine = pcall(require, "lualine")
local theme = require("plugins.config.theme")

if not ok then
    return
end

local function line_count()
    return vim.api.nvim_buf_line_count(0)
end

lualine.setup({
    options = {
        icons_enabled = true,
        theme = theme,
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
            statusline = {},
            winbar = {
                "help",
                "startify",
                "dashboard",
                "packer",
                "neogitstatus",
                "NvimTree",
                "Trouble",
                "alpha",
                "lir",
                "Outline",
                "spectre_panel",
                "toggleterm",
            },
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = true,
        refresh = {
            statusline = 1000,
            tabline = 1000,
            winbar = 1000,
        },
    },
    sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diff", "diagnostics" },
        lualine_c = { "filename" },
        lualine_x = { "encoding", "fileformat", "filetype" },
        lualine_y = { "progress", "location" },
        lualine_z = { "date", { line_count, icon = '﬘' } },
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { "filename" },
        lualine_x = { "location" },
        lualine_y = {},
        lualine_z = {},
    },
    tabline = {},
    winbar = {},
    inactive_winbar = {},
    extensions = { "nvim-tree" },
})

