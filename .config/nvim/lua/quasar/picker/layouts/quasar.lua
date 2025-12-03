return {
    layout = {
        box = "vertical",
        backdrop = false,
        row = -1,
        width = 0,
        height = 0.5,
        border = "none",
        title = " {title} {live} {flags}",
        title_pos = "left",
        { box = "horizontal", { win = "list", border = "rounded" }, { win = "preview", title = "{preview}", width = 0.5, border = "rounded" }, },
        { win = "input", height = 1, border = "top" },
    },
}
