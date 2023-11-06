return {
    "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "kyazdani42/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make"
    },
  },
  event = "VeryLazy",
  keys = {
    {
      "<leader>pp",
      function()
        require('telescope.builtin').git_files({ show_untracked = true })
      end,
      desc = "Telescope Git Files"
    },
    {
      "<leader>pe",
      function()
        require('telescope.builtin').buffers()
      end,
      desc = "Telescope Buffers"
    },
    {
      "<leader>gs",
      function()
        require('telescope.builtin').git_status()
      end,
      desc = "Telescope Git Status"
    },
    {
      "<leader>gc",
      function()
        require('telescope.builtin').git_commits()
      end,
      desc = "Telescope Git Commits"
    },
    {
      "<leader>gb",
      function()
        require('telescope.builtin').git_branches()
      end,
      desc = "Telescope Git Branches"
    },
    {
      "<leader>pf",
      function()
        require('telescope.builtin').find_files()
      end,
      desc = "Telescope Find Files"
    },
    {
      "<leader>hh",
      function()
        require('telescope.builtin').help_tags()
      end,
      desc = "Telescope Help"
    }
    --{
       -- "<leader>ff",
       -- function()
     --       require('telescope').extensions.file_browser({ hidden = true })
   --     end,
 --       desc = "Telescope File Browser"
--    },


  },
}

