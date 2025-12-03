return {
    prompt = "󰩉 ❯",
    title = "search in file",
    finder = "lines",
    format = "lines",
    layout = {
        preview = "main",
        preset = "select",
    },
    jump = { match = true },
    -- allow any window to be used as the main window
    main = { current = true },
    on_show = function(picker)
        local cursor = vim.api.nvim_win_get_cursor(picker.main)
      local info = vim.api.nvim_win_call(picker.main, vim.fn.winsaveview)
      picker.list:view(cursor[1], info.topline)
      picker:show_preview()
  end,
  sort = { fields = { "score:desc", "idx" } },
}
