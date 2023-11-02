return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "kyazdani42/nvim-web-devicons" },
    { "nvim-telescope/telescope-file-browser.nvim" },
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
      dependencies = {
        "junegunn/fzf.vim",
        dependencies = {
          {
            "tpope/vim-dispatch",
            cmd = { "Make", "Dispatch" },
          },
          {
            "junegunn/fzf",
            build = ":call fzf#install()",
          }
        },
      },
    },
  },
  event = "VeryLazy",
  config = function()
    require "alpha.telescope.setup"
    require "alpha.telescope.mappings"
  end,
keys={
    "<leader>pp",
    function()
    require('telescope.builtin').git_files({show_untracked=true})
    end,
    desc="Telescope Git Files",
  },
}
