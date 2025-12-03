return {
    name = "scratchpad 󰙏 ",
    ft = function()
        if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
            return vim.bo.filetype
        end
        return "markdown"
    end,
    icon = nil, -- `icon|{icon, icon_hl}`. defaults to the filetype icon
    root = vim.fn.stdpath("data") .. "/scratch",
    autowrite = true, -- automatically write when the buffer is hidden
    filekey = {
        id = nil,
        cwd = true, -- use current working directory
        branch = true, -- use current branch name
        count = true, -- use vim.v.count1
    },
    win = { style = "scratch" },
    win_by_ft = {
        lua = {
            keys = {
                ["source"] = {
                    "<cr>",
                    function(self)
                        local name = "scratch." .. vim.fn.fnamemodify(vim.api.nvim_buf_get_name(self.buf), ":e")
                        Snacks.debug.run({ buf = self.buf, name = name })
                    end,
                    desc = "Source buffer",
                    mode = { "n", "x" },
                },
            },
        },
    },
}
