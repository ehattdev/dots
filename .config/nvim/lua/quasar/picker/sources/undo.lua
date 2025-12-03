return {
    title = "undo history",
    prompt = " ❯",
    finder = "vim_undo",
    format = "undo",
    preview = "diff",
    confirm = "item_action",
    win = {
        preview = { wo = { number = false, relativenumber = false, signcolumn = "no" } },
        input = {
            keys = {
                ["<c-y>"] = { "yank_add", mode = { "n", "i" } },
                ["<c-s-y>"] = { "yank_del", mode = { "n", "i" } },
            },
        },
    },
    actions = {
        yank_add = { action = "yank", field = "added_lines" },
        yank_del = { action = "yank", field = "removed_lines" },
    },
    icons = { tree = { last = "┌╴" } }, -- the tree is upside down
    diff = {
        ctxlen = 4,
        ignore_cr_at_eol = true,
        ignore_whitespace_change_at_eol = true,
        indent_heuristic = true,
    },
}
