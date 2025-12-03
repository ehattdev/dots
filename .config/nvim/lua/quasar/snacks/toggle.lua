return {
    map = vim.keymap.set, -- keymap.set function to use
    which_key = true, -- integrate with which-key to show enabled/disabled icons and colors
    notify = true, -- show a notification when toggling
    icon = {
        enabled = " ",
        disabled = " ",
    },
    color = {
        enabled = "green",
        disabled = "yellow",
    },
    wk_desc = {
        enabled = "Disable ",
        disabled = "Enable ",
    },
}
