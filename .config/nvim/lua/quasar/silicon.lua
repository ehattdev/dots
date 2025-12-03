local M = {}

M.opts = {
    font = "JetBrainsMono Nerd Font=34;Noto Color Emoji=34",
    theme = "mocha",
    background = "#b4befe",
    to_clipboard = true,
    window_title = function()
        return vim.fn.fnamemodify(
            vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
            ":t"
        )
    end,
    output = function()
		return "/home/ehatt/screenshots/" .. os.date("!%Y-%m-%dT%H-%M-%SZ") .. "_nvim.png"
	end,
}

M.keys = {
    {
        "<leader>ss",
        function() require("nvim-silicon").shoot() end,
        desc = "Create code screenshot",
        mode = 'v',
    }
}
return M

