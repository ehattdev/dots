return {
    prompt = "󱦞 ❯",
    finder = "buffers",
    format = "buffer",
    hidden = false,
    unloaded = true,
    current = true,
    sort_lastused = true,
    win = {
        input = { keys = { ["d"] = { "bufdelete", mode = { "n", "i" } }, }, },
        list = { keys = { ["d"] = "bufdelete" } },
    },
    on_show = function()
        vim.cmd.stopinsert()
    end,
}
