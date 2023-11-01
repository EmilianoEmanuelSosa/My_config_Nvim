require("config")

-- Cargar el complemento del esquema de colores Tokyo Night
vim.cmd('colorscheme tokyonight-night')

-- Establecer la opacidad de toda la ventana en Neovim
vim.cmd('highlight Normal guibg=#00000070') -- Cambia el color de fondo para ajustar la opacidad al 50%


vim.o.showtabline = 0
vim.o.laststatus = 2
vim.o.cmdheight = 1
