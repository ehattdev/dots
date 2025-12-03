return {
    completions = { blink = { enabled = true, }, lsp = { enabled = true } },
    latex = { enabled = false },
    heading = {
      sign = true,
      icons = { " 󰲠 ", "󰲢 ", "󰲤 ", "󰲦 ", "󰲨 ", "󰲪 " },
    },
    code = {
        language_border = ' ',
        language_left = '',
        language_right = '',
        width = 'block',
        left_pad = 2,
        right_pad = 4,
    },
    bullet = {
        icons = { ' ', ' ', '󰴈 ', ' ', ' '},
    },
    checkbox = { checked = { scope_highlight = '@markup.strikethrough' } },
    indent = { enabled = false },
}
