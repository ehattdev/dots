-- @ehatt
-- snacks-specific keymaps
return {
    -- git operations
    {"<leader>gb", function() Snacks.gitbrowse() end, desc = "open git webpage in browser", mode = "n" },
    {"<leader>lg", function() Snacks.lazygit.open() end, desc = "open lazygit", mode = "n" }, --lazygit popup
    {"<leader>gl", function() Snacks.picker.git_log() end, desc = "view git log", mode = "n"}, --searchable commit history popup
    {"<M-b>", function() Snacks.picker.git_branches() end, desc = "view git branches", mode = "n"},

    -- scratch notes
    {"<leader>.",  function() Snacks.scratch() end, desc = "Toggle Scratch Buffer" },
    {"<leader>s.",  function() Snacks.scratch.select() end, desc = "Select Scratch Buffer" },

    -- search
    {"<leader><space>", function() Snacks.picker.files() end, desc = "search files", mode = "n"},
    {"<M-t>", function() Snacks.picker.buffers() end, desc = "search buffers", mode = "n"},
    {"<M-;>", function() Snacks.picker.commands() end, desc = "search commands", mode = "n"},
    {"<leader>sw", function() Snacks.picker.grep_word() end, desc = "search for hovered word", mode = "n"},
    {"<leader>sg", function() Snacks.picker.grep() end, desc = "general grep", mode = "n" },
    {"<M-f>", function() Snacks.picker.lines() end, desc = "search in file", mode = "n"},
    {"<M-n>", function() Snacks.picker.notifications() end, desc = "notif search", mode = "n"},
    {"<leader>rf", function() Snacks.picker.recent() end, desc = "search recent files", mode = "n"},
    {"<leader>zz", function() Snacks.picker.zoxide() end, desc = "search zoxide projects", mode = "n"},
    -- history
    {"<leader>hc", function() Snacks.picker.command_history() end, desc = "seach command history", mode = "n"},
    {"<leader>hu", function() Snacks.picker.undo() end, desc = "search undo history", mode = "n"},
    {"<leader>hn", function() Snacks.notifier.show_history() end, desc = "notification history", mode = "n"},
    -- general
    {"<leader>bz", function() Snacks.zen() end, desc = "Toggle Zen Mode", mode = "n" },
    {"<S-T>", function() Snacks.terminal.toggle() end, desc = "toggle terminal", mode = "n"},
    {"<leader>ex", function() Snacks.explorer.open() end, desc = "toggle explorer", mode = "n"},
    { "<M-k>", function() Snacks.picker.keymaps() end, desc = "Keymaps", mode = "n"},
    {"<leader>dd", function() Snacks.picker.diagnostics() end, desc = "global diagnostics", mode = "n"},
    {"<M-g>", function() Snacks.toggle() end, desc = "toggle menu", mode = "n"},

-- ADD KEYMAPS KEYMAP
-- STAGING

      {
        "<leader>tt",
        function()
          Snacks.picker.grep({
            prompt = " ",
            -- pass your desired search as a static pattern
            search = "^\\s*- \\[ \\]",
            -- we enable regex so the pattern is interpreted as a regex
            regex = true,
            -- no “live grep” needed here since we have a fixed pattern
            live = false,
            -- restrict search to the current working directory
            dirs = { vim.fn.getcwd() },
            -- include files ignored by .gitignore
            args = { "--no-ignore" },
            -- Start in normal mode
            on_show = function()
              vim.cmd.stopinsert()
            end,
            finder = "grep",
            format = "file",
            show_empty = true,
            supports_live = false,
            layout = "ivy",
          })
        end,
        desc = "[P]Search for incomplete tasks",
      },
      -- -- Iterate throuth completed tasks in Snacks_picker lamw26wmal
      {
        "<leader>tc",
        function()
          Snacks.picker.grep({
            prompt = " ",
            -- pass your desired search as a static pattern
            search = "^\\s*- \\[x\\] `done:",
            -- we enable regex so the pattern is interpreted as a regex
            regex = true,
            -- no “live grep” needed here since we have a fixed pattern
            live = false,
            -- restrict search to the current working directory
            dirs = { vim.fn.getcwd() },
            -- include files ignored by .gitignore
            args = { "--no-ignore" },
            -- Start in normal mode
            on_show = function()
              vim.cmd.stopinsert()
            end,
            finder = "grep",
            format = "file",
            show_empty = true,
            supports_live = false,
            layout = "ivy",
          })
        end,
        desc = "[P]Search for complete tasks",
      },
}
