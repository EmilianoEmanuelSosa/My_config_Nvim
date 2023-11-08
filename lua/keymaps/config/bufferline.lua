local set = vim.api.nvim_set_keymap
local default_opts = { noremap = true, silent = true }

set("n", "<TAB>", "<cmd>BufferLineCycleNext<cr>", default_opts)
set('n', '<S-Tab>', ':BufferLineCyclePrev<CR>', default_opts)
set("n", "<leader><TAB>", "<cmd>BufDel<cr>", default_opts)
