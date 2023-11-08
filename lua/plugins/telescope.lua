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
        }
        -- Puedes agregar más atajos si es necesario
    }
}

