return {
    enabled = true,

    -- configurations
    sources = require("quasar.picker.sources"),
    icons = require("quasar.picker.icons"),
    layouts = require("quasar.picker.layouts"),

    --defaults
    debug = { scores = false, },
    layout = { preset = "quasar", cycle = false, },
    matcher = { frecency = true, },
    win = {
        input = {
            keys = {
                ["<Esc>"] = { "close", mode = { "n", "i" } },
                ["J"] = { "preview_scroll_down", mode = { "i", "n" } },
                ["K"] = { "preview_scroll_up", mode = { "i", "n" } },
                ["H"] = { "preview_scroll_left", mode = { "i", "n" } },
                ["L"] = { "preview_scroll_right", mode = { "i", "n" } },
            },
        },
    },
    formatters = {
        file = { filename_first = true, truncate = 80, },
    },
}
