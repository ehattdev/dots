vim.lsp.config('harper_ls', {
    settings = {
        ["harper-ls"] = {
            userDictPath = "/home/ehatt/.config/nvim/lua/quasar/lsp/dictionary.txt",
            markdown = {
                IgnoreLinkTitle = true
            },
            diagnosticSeverity = "information",
            linters = {
                AvoidCurses = false,
                SentenceCapitalization = false,
                LongSentences = false
            }
        }
    },
})
