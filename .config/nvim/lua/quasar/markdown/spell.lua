vim.lsp.config('harper_ls', {
    settings = {
        ["harper-ls"] = {
            userDictPath = "",
            markdown = {
                IgnoreLinkTitle = true
            },
            diagnosticSeverity = "information",
            linters = {
                AvoidCurses = false,
            }
        }
    },
})
