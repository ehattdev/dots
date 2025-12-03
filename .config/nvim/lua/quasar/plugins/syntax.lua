return {
    {"mason-org/mason-lspconfig.nvim", opts = require("quasar.lsp.config"),
        dependencies = {
            { "mason-org/mason.nvim", opts = require("quasar.lsp.mason"), cmd = 'Mason' },
            { "neovim/nvim-lspconfig" },
        },
    },
    { 'saghen/blink.cmp', dependencies = { 'rafamadriz/friendly-snippets', "fang2hou/blink-copilot" }, version = '1.*', opts = require("quasar.blinkcmp"), opts_extend = { "sources.default" }, event = 'InsertEnter' },
    { "xzbdmw/colorful-menu.nvim", event = "InsertEnter" },
    {"saecki/crates.nvim", event = "BufRead Cargo.toml"},
    {"nvim-treesitter/nvim-treesitter", event = { 'BufReadPost', 'BufNewFile' },},
    {"HiPhish/rainbow-delimiters.nvim", event = { 'BufReadPost', 'BufNewFile' },},
    {'mrcjkb/rustaceanvim', lazy = false},
    {"mfussenegger/nvim-dap", cmd = { 'DapUIToggle', 'DapToggleRepl', 'DapToggleBreakpoint' },},
    {"folke/lazydev.nvim", opts = {}, ft = 'lua'},
}
