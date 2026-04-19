local M = {}

M.opts = {
    providers = {
        priority = {
            "markdown",
            "lsp",
            "man"
        }
    },
    outline_items = {
        show_symbol_lineno = true,
    },
    preview_window = {
        auto_preview = true,
        border = "rounded",
        winblend = 15,
        live = true
    },
}

M.keys = {
    { "<leader>oo", "<cmd>Outline<cr>", desc = " toggle outline", mode = 'n' },
}

return M
