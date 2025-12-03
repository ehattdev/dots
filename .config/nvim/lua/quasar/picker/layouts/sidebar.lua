return {
  preview = "main",
  layout = {
    backdrop = false,
    width = 25,
    min_width = 25,
    height = 0,
    position = "left",
    border = "none",
    box = "vertical",
    {
      win = "input",
      height = 1,
      border = true,
      title = "{title} {live} {flags}",
      title_pos = "center",
    },
    { win = "list", border = "none" },
    { win = "preview", title = "{preview}", height = 0.4, border = "top" },
  },
}

