-- top-level config for nvim snacks 
-- @ehatt
return {
    -- enabled snacks --
    dashboard = require("quasar.snacks.dashboard"),
    bigfile = require("quasar.snacks.bigfile"),
    statuscolumn = require("quasar.snacks.statuscolumn"),
    toggle = require("quasar.snacks.toggle"),
    picker = require("quasar.picker"),
    scratch = require("quasar.snacks.scratch"),
    styles = require("quasar.snacks.styles"),
    image = require("quasar.snacks.image"),
    win = require("quasar.snacks.win"),
    explorer = { enabled = true, replace_netrw = true},
    git = { enabled = true },
    gitbrowse = { enabled = true },
    indent = { enabled = true },
    input = { enabled = true },
    lazygit = { enabled = true },
    notifier = { enabled = true },
    notify = { enabled = true },
    quickfile = { enabled = true },
    rename = { enabled = true },
    scroll = { enabled = true },
    terminal = { enabled = true },
    zen = { enabled = true },
    debug = { enabled = true },
}
