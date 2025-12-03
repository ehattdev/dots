return {
    {'iamcco/markdown-preview.nvim', ft = {"md", "markdown", "MD"}},
    {'folke/which-key.nvim', keys = "<Space>", event = 'VeryLazy'},
    {'nvim-lualine/lualine.nvim', event = { 'BufReadPost', 'BufNewFile' }, },
    {'akinsho/bufferline.nvim', event = { 'BufReadPost', 'BufNewFile' }, },
    {'MunifTanjim/nui.nvim'},
    {"folke/noice.nvim", event = "VeryLazy"},
    { "rachartier/tiny-inline-diagnostic.nvim", opts = {}, },
    {"folke/sidekick.nvim", opts = require("quasar.sidekick").opts, event = 'InsertEnter', cmd = 'Sidekick', keys = require("quasar.sidekick").keys, },
    {"zbirenbaum/copilot.lua", cmd = "Copilot", event = "InsertEnter"},
    {"folke/trouble.nvim", opts = require("quasar.trouble").opts, cmd = "Trouble", keys = require("quasar.trouble").keys, },
    {'Bekaboo/dropbar.nvim', event = { 'BufReadPost', 'BufNewFile' },},
    { 'MeanderingProgrammer/render-markdown.nvim', lazy = true, ft = "markdown", opts = require("quasar.markdown.render") },
    { "HakonHarnes/img-clip.nvim", keys = { { "<leader>ip", "<cmd>PasteImage<cr>", desc = "image paste", mode = 'n' }, },},
    { "chrisgrieser/nvim-origami", event = "VeryLazy", opts = {} },
    { 'MagicDuck/grug-far.nvim', config = function() require('grug-far').setup({ windowCreationCommand = 'lua Snacks.win.new()' }); end }, --keep defaults but always launch in snacks floating window
    { "obsidian-nvim/obsidian.nvim", ft = "markdown", opts = require("quasar.markdown.obsidian") },
}
