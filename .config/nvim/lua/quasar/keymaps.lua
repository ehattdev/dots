--@ehatt
--ellie's keymaps!
--mostly defined here, collected over the years.
--i have tried to organize most of them under comment headings. 
--which-key is used to define categories for leader keymaps.
--some keymaps are defined elsewhere, usually because they are lazy-loaded and are triggered by the keymap.

--------------- reference ---------------

--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"

-- leader, localleader = space, set in:
---@module "quasar.options"

-- plugins directly called in keymaps defined here: (keymaps are used with other plugins)
---@module "snacks"
---@module "grug-far"
---@module "mini"

-- custom functions in keymaps defined here:
---@module "quasar.markdown.fold"

-- other files where keymaps are defined:
---@module "quasar.sidekick"
---@module "quasar.markdown.outline"
---@module "quasar.mini.comment"
---@module "quasar.mini.move"
---@module "quasar.silicon"
---@module "quasar.trouble"

--------------- setup ---------------
local k = vim.keymap.set
local w = require("which-key")

k("", "<Space>", "<Nop>", { silent = true })

--------------- general ---------------
k("i", ";;", "<ESC>", { desc = "exit insert mode" })
k("t", ";;", "<C-\\><C-N>", { desc = "make ;; go to normal mode in terminal" })

k("v", "p", '"_dP', { desc = "paste without replacing register" })

w.add({{"<leader>b", group = "mode toggle"}})
k("n", "<leader>bz", function() Snacks.zen() end, { desc = "Toggle Zen Mode" })

--------------- splits + window navigation ---------------
w.add({{"<leader>s", group = " splits"}})
k("n", "<leader>sv", ":vsplit<CR>", { desc = "vertical split" })
k("n", "<leader>sp", ":split<CR>", { desc = "horizontal split" })

k("n", "<C-h>", "<C-w>h", { desc = "move to left split" })
k("n", "<C-j>", "<C-w>j", { desc = "move to bottom split" })
k("n", "<C-k>", "<C-w>k", { desc = "move to top split" })
k("n", "<C-l>", "<C-w>l", { desc = "move to right split" })

k("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "increase split height" })
k("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "decrease split height" })
k("n", "<C-Right>", "<cmd>vertical resize -2<CR>", { desc = "decrease split width" })
k("n", "<C-Left>", "<cmd>vertical resize +2<CR>", { desc = "increase split width" })

--------------- tabs + buffers ---------------
w.add({{"<leader>t", group = "buffers + tabs"}})
k("n", "<leader>te", "<cmd>BufferLineSortByExtension<CR>", { desc = "sort buffers by extension" })
k("n", "<leader>td", "<cmd>BufferLineSortByDirectory<CR>", { desc = "sort buffers by directory" })
k("n", "<leader>tb", "<cmd>BufferLinePick<CR>", { desc = "pick buffer" })
k("n", "<leader>tc", "<cmd>BufferLinePickClose<CR>", { desc = "pick and close buffer" })

k("n", "<C-[>", "<cmd>BufferLineCyclePrev<CR>", { desc = "go to previous buffer" })
k("n", "<C-]>", "<cmd>BufferLineCycleNext<CR>", { desc = "go to next buffer" })
k("n", "<C-S-[>", "<cmd>BufferLineMovePrev<CR>", { desc = "move buffer left" })
k("n", "<C-S-]>", "<cmd>BufferLineMoveNext<CR>", { desc = "move buffer right" })

k("n", "<M-t>", function() Snacks.picker.buffers() end, { desc = "search buffers" })

--------------- text movement + navigation ---------------
---@module "quasar.mini.move" <M-H>, <M-J>, <M-K>, <M-L> = move line (normal) or selection (visual)

--------------- package managers ---------------
k("n", "<leader>L", "<cmd>Lazy<CR>", {desc = "open lazy"})

k("n", "<leader>M", "<cmd>Mason<CR>", {desc = "󰢛 open mason"})

--------------- search ---------------
w.add({
    {"<leader>f", group = " search"},
    {"<leader>fh", group = "󰥔 search history"},
    {"<leader>ft", group = " search tasks"},
    {"<leader>fl", group = "  search lsp"}
})
k("n", "<leader><space>", function() Snacks.picker.files() end, {desc = "search files"})
k("n", "<leader>fw", function() Snacks.picker.grep_word() end, { desc = "search current word"})
k("n", "<leader>fg", function() Snacks.picker.grep() end, {desc = " general grep"})
k("n", "<leader>fr", function() Snacks.picker.recent() end, {desc = "󱋡 search recent files"})
k("n", "<leader>fz", function() Snacks.picker.zoxide() end, {desc = "󱐋 search zoxide projects"})
k("n", "<leader>fn", "<cmd>Nerdy<CR>", {desc = " search nerdfont icons"})
k("n", "<leader>fd", function() Snacks.picker.diagnostics() end, {desc = " search global diagnostics"})

k("n", "<leader>fhc", function() Snacks.picker.command_history() end, {desc = " command history"})
k("n", "<leader>fhu", function() Snacks.picker.undo() end, {desc = "󰕌 undo history"})
k("n", "<leader>fhn", function() Snacks.notifier.show_history() end, {desc = "󰨼 notification history"})

k("n", "<leader>ftt", function()
      Snacks.picker.grep({
        prompt = " ",
        search = "^\\s*- \\[ \\]",
        regex = true,
        live = false,
        dirs = { vim.fn.getcwd() },
        args = { "--no-ignore" },
        on_show = function()
          vim.cmd.stopinsert()
        end,
        finder = "grep",
        format = "file",
        show_empty = true,
        supports_live = false,
        layout = "quasar",
      })
    end, { desc = " incomplete tasks" })
k("n", "<leader>ftc", function()
      Snacks.picker.grep({
        prompt = " ",
        search = "^\\s*- \\[x\\] `done:",
        regex = true,
        live = false,
        dirs = { vim.fn.getcwd() },
        args = { "--no-ignore" },
        on_show = function()
          vim.cmd.stopinsert()
        end,
        finder = "grep",
        format = "file",
        show_empty = true,
        supports_live = false,
        layout = "quasar",
      })
    end, { desc = " completed tasks" })

k("n", "<leader>f.", function() Snacks.scratch.select() end, { desc = "󱓧 select scratch buffer" })

k("n", "<M-;>", function() Snacks.picker.commands() end, {desc = "search commands"})
k("n", "<M-f>", function() Snacks.picker.lines() end, {desc = "search in file"})
k("n", "<M-n>", function() Snacks.picker.notifications() end, {desc = "search notifications"})
k("n", "<M-k>", function() Snacks.picker.keymaps() end, {desc = "search keymaps"})

--------------- surrounding window utilities ---------------
w.add({
    {"<leader>o", group = "open sidebars right", icon = " "},
    {"<leader>e", group = "open sidebars left", icon = " "},
    {"<leader>x", group = "open underbar", icon = " "}
})

k("n", "<leader>om", function() MiniMap.toggle() end, {desc = "󰍍 toggle minimap"})
---@module "quasar.sidekick": <leader>oc = toggle opencode
---@module "quasar.markdown.outline": <leader>oo = toggle outline
---@module "quasar.trouble": <leader>os = toggle lsp symbols, <leader>ol = toggle lsp list

k("n", "<leader>ex", function() Snacks.explorer.open() end, {desc = "󰙅 toggle explorer"})

k("n", "<S-T>", function() Snacks.terminal.toggle() end, {desc = " toggle terminal"})
---@module "quasar.trouble": <leader>xX = toggle buffer diagnostics, <leader>xx = toggle diagnostics, <leader>xL = toggle location list, <leader>xQ = toggle quickfix list

--------------- find and replace ---------------
w.add({
    {"<leader>h", group = " find + replace", icon = " "},
    {"<leader>hw", group = " with word", icon = " "},
    {"<leader>hs", group = " with selection", icon = " "},
})

k("n", "<leader>hg", function() require('grug-far').open({ transient = true }) end, {desc = "find + replace in dir"})
k("n", "<leader>hr", function() require('grug-far').open({ transient = true, prefills = { paths = vim.fn.expand("%") } }) end, {desc = "find + replace in file"})
k("v", "<leader>hv", "<cmd>GrugFarWithin<CR>", {desc = "find + replace within selection"})

k("n", "<leader>hwd", function() require('grug-far').open({ transient = true, prefills = { search = vim.fn.expand("<cword>") } }) end, {desc = "launch f+r with word, in dir"})
k("n", "<leader>hwf", function() require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") } }) end, {desc = "launch f+r with word, in file"})

k("v", "<leader>hsd", function() require('grug-far').with_visual_selection({ transient = true }) end, { desc = "launch f+r with selection, in dir"})
k("v", "<leader>hsf", function() require('grug-far').with_visual_selection({ transient = true, prefills = { paths = vim.fn.expand("%") } }) end, {desc = "launch f+r with selection, in file"})

--------------- git ---------------
w.add({
    {"<leader>g", group = "git"},
    {"<leader>gs", group = "gitsigns"}
})
k("n", "<leader>gb", function() Snacks.gitbrowse() end, { desc = " open git webpage"})
k("n", "<leader>gz", function () Snacks.lazygit.open() end, { desc = "open lazygit"})
k("n", "<leader>gl", function() Snacks.picker.git_log() end, { desc = " open git log" })

k("n", "<leader>gsa", "<cmd>Gitsigns toggle_current_line_blame<CR>", { desc = "toggle line blame" })
k("n", "<leader>gsl", "<cmd>Gitsigns blame_line<CR>", { desc = "blame line" })
k("n", "<leader>gsb", "<cmd>Gitsigns blame<CR>", { desc = "blame file" })
k("n", "<leader>gsn", "<cmd>Gitsigns toggle_numhl<CR>", { desc = "toggle line number highlights" })
k("n", "<leader>gsh", "<cmd>Gitsigns toggle_linehl<CR>", { desc = "toggle line highlights" })
k("n", "<leader>gsw", "<cmd>Gitsigns toggle_word_diff<CR>", { desc = "toggle word diff" })
k("n", "<leader>gsd", "<cmd>Gitsigns diffthis<CR>", { desc = "git diff this" })

k("n", "<M-b>", function() Snacks.picker.git_branches() end, { desc = " open git branches" })

--------------- scratch notes ---------------
k("n", "<leader>.", function() Snacks.scratch() end, { desc = "󱘒 scratch note"})

--------------- comments ---------------
w.add({{"<leader>c", group = "comments", icon = "󰠗 "}})
---@module "quasar.mini.comment": <leader>cc = normal -> comment line, <leader>c = visual -> comment selection

--------------- ai ---------------
w.add({{"<leader>a", group = " ai"}})
---@module "quasar.sidekick": sidekick ai keybinds

--------------- screenshots ---------------
w.add({{"<leader>s", group = "screenshots", icon = "󰹑 "}})
---@module "quasar.silicon": <leader>ss = copy + save screenshot of selection (visual)

--------------- images ---------------
w.add({{"<leader>i", group = "images", icon = " "}})
---@module "img-clip": <leader>ip = paste image

--------------- lsp ---------------
w.add({{"<leader>l", group = "lsp", icon = " "}})

vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
    -- Buffer local mappings.
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
    opts.desc = "lsp references"
    k("n", "lR", function() Snacks.picker.lsp_references() end, opts) -- show definition, references

    opts.desc = "go to declaration"
    k("n", "lD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "show definition"
    k("n", "ld", vim.lsp.buf.definition, opts) -- show lsp definition

    opts.desc = "show implementations"
    k("n", "li", function() Snacks.picker.lsp_implementations() end, opts) -- show lsp implementations

    opts.desc = "show type definitions"
    k("n", "lt", function() Snacks.picker.lsp_type_definitions() end, opts) -- show lsp type definitions

    opts.desc = "view code actions"
    k({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "smart rename"
    k("n", "<leader>lr", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "previous diagnostic"
    k("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
    end, opts) -- jump to previous diagnostic in buffer
    --
    opts.desc = "next diagnostic"
    k("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
    end, opts) -- jump to next diagnostic in buffer

    opts.desc = "lsp hover"
    k("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "restart lsp"
    k("n", "<leader>lrs", "<cmd>LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})

--------------- folds ---------------
-- functions from:
---@module "quasar.markdown.fold"

w.add({{"z", group = "folds", icon = "󰘖 "}})
k("n", "zj", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfj", function()
  -- Reloads the file to refresh folds, otheriise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_markdown_headings({ 6, 5, 4, 3, 2, 1 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "fold headings @level 1" })

k("n", "zk", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfk", function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_markdown_headings({ 6, 5, 4, 3, 2 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "fold headings @level 2" })

k("n", "zl", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfl", function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_markdown_headings({ 6, 5, 4, 3 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "fold headings @level 3" })

k("n", "z;", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mf;", function()
  -- Reloads the file to refresh folds, otherwise you have to re-open neovim
  vim.cmd("edit!")
  -- Unfold everything first or I had issues
  vim.cmd("normal! zR")
  fold_markdown_headings({ 6, 5, 4 })
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "fold headings @level 4" })

k("n", "<CR>", function()
  -- Get the current line number
  local line = vim.fn.line(".")
  -- Get the fold level of the current line
  local foldlevel = vim.fn.foldlevel(line)
  if foldlevel == 0 then
    vim.notify("No fold found", vim.log.levels.INFO)
  else
    vim.cmd("normal! za")
    vim.cmd("normal! zz") -- center the cursor line on screen
  end
end, { desc = "toggle fold" })

k("n", "zu", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- vim.keymap.set("n", "<leader>mfu", function()
  -- Reloads the file to reflect the changes
  vim.cmd("edit!")
  vim.cmd("normal! zR") -- Unfold all headings
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "󰘖 unfold headings" })

k("n", "zi", function()
  -- "Update" saves only if the buffer has been modified since the last save
  vim.cmd("silent update")
  -- Difference between normal and normal!
  -- - `normal` executes the command and respects any mappings that might be defined.
  -- - `normal!` executes the command in a "raw" mode, ignoring any mappings.
  vim.cmd("normal gk")
  -- This is to fold the line under the cursor
  vim.cmd("normal! za")
  vim.cmd("normal! zz") -- center the cursor line on screen
end, { desc = "fold heading @ cursor level" })

-- only, only, only trust two godspeeds
