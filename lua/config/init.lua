
require "config.options"

vim.api.nvim_create_autocmd("User", {
  group = vim.api.nvim_create_augroup("LazyVim", { clear = true }),
  pattern = "VeryLazy",
  callback = function()
  end,
})

vim.api.nvim_buf_line_count(0)

require "config.lazy"

