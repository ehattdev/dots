return {
        {"lewis6991/gitsigns.nvim", cmd = 'Gitsigns', event = { 'BufReadPost', 'BufNewFile' },},
        {"nvim-tree/nvim-web-devicons"},
        {"catppuccin/nvim", name = "catppuccin", priority = 1001},
        {'2kabhishek/nerdy.nvim', cmd = "Nerdy", opts = {}},
        { "michaelrommel/nvim-silicon", lazy = true, cmd = "Silicon", main = "nvim-silicon", opts = require("quasar.silicon").opts, keys = require("quasar.silicon").keys}
}


