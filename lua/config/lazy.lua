local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"

if not vim.loop.fs_stat(lazypath) then
  -- Safely clone the lazy.nvim repository.
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "--branch=stable",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end

-- Safely prepend the lazy.nvim runtime path.
vim.opt.rtp:prepend(lazypath)

-- Safely require the lazy.nvim plugin.
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
})

