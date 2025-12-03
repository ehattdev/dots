return {
    layout = "vertical",
    prompt = " ❯ ",
    finder = "vim_keymaps",
    format = "keymap",
    preview = "preview",
    global = true,
    plugs = false,
    ["local"] = true,
    modes = { "n", "v", "x", "s", "o", "i", "c", "t" },
    confirm = function(picker, item)
        picker:norm(function()
            if item then
                picker:close()
                vim.api.nvim_input(item.item.lhs)
            end
        end)
    end,
    actions = {
        toggle_global = function(picker)
            picker.opts.global = not picker.opts.global
            picker:find()
        end,
        toggle_buffer = function(picker)
            picker.opts["local"] = not picker.opts["local"]
            picker:find()
        end,
    },
    win = {
        input = {
            keys = {
                ["<a-g>"] = { "toggle_global", mode = { "n", "i" }, desc = "Toggle Global Keymaps" },
                ["<a-b>"] = { "toggle_buffer", mode = { "n", "i" }, desc = "Toggle Buffer Keymaps" },
            },
        },
    },
}
