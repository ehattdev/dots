return {
    prompt = "󱋡 ❯",
    layout = "telescope",
    finder = "recent_files",
    format = "file",
    filter = {
        paths = {
            [vim.fn.stdpath("data")] = false,
            [vim.fn.stdpath("cache")] = false,
            [vim.fn.stdpath("state")] = false,
        },
    },
}
