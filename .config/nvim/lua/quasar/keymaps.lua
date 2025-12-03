--@ehatt
--keymaps.
--also defined in plugin-specific configs.

--Setup
local k = vim.keymap.set

k("", "<Space>", "<Nop>", { silent = true })
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c"



k("n", "<leader>sv", ":vsplit<CR>", { desc = "vertical split" })
k("n", "<leader>sp", ":split<CR>", { desc = "horizontal split" })
k("n", "<C-h>", "<C-w>h", { desc = "move to left split" })
k("n", "<C-j>", "<C-w>j", { desc = "move to bottom split" })
k("n", "<C-k>", "<C-w>k", { desc = "move to top split" })
k("n", "<C-l>", "<C-w>l", { desc = "move to right split" }) --^4 move between splits without ctrl-W
k("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "increase split height" })
k("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "decrease split height" })
k("n", "<C-Right>", "<cmd>vertical resize -2<CR>", { desc = "decrease split width" })
k("n", "<C-Left>", "<cmd>vertical resize +2<CR>", { desc = "increase split width" }) --^4 move between splits w/ctrl+arrows
k("n", "<leader>cg", "<cmd>e $MYVIMRC<CR>", { desc = "open root config (init.lua)" })
k("n", "<C-[>", "<cmd>BufferLineCyclePrev<CR>", { desc = "go to previous buffer" })
k("n", "<C-]>", "<cmd>BufferLineCycleNext<CR>", { desc = "go to next buffer" })
k("n", "<C-S-[>", "<cmd>BufferLineMovePrev<CR>", { desc = "move buffer left" })
k("n", "<C-S-]>", "<cmd>BufferLineMoveNext<CR>", { desc = "move buffer right" })
k("n", "<leader>te", "<cmd>BufferLineSortByExtension<CR>", { desc = "sort buffers by extension" })
k("n", "<leader>td", "<cmd>BufferLineSortByDirectory<CR>", { desc = "sort buffers by directory" })
k("n", "<leader>tb", "<cmd>BufferLinePick<CR>", { desc = "pick buffer" })
k("n", "<leader>tc", "<cmd>BufferLinePickClose<CR>", { desc = "pick and close buffer" })

k("n", "<leader>L", "<cmd>Lazy<CR>", {desc = "open lazy plugin manager"})
k("n", "<leader>M", "<cmd>Mason<CR>", {desc = "open Mason LSP server manager"})
k("n", "<leader>snf", "<cmd>Nerdy<CR>", {desc = "search nerdfont icons"})

k("n", "<leader>mm", function() MiniMap.toggle() end, {desc = "toggle minimap"})

-- find and replace
k("n", "<leader>hg", function() require('grug-far').open({ transient = true }) end, {desc = "find + replace in dir"})
k("n", "<leader>hr", function() require('grug-far').open({ transient = true, prefills = { paths = vim.fn.expand("%") } }) end, {desc = "find + replace in file"})
k("v", "<leader>hv", "<cmd>GrugFarWithin<CR>", {desc = "find + replace within selection"})

k("n", "<leader>hwd", function() require('grug-far').open({ transient = true, prefills = { search = vim.fn.expand("<cword>") } }) end, {desc = "launch f+r with word, in dir"})
k("n", "<leader>hwf", function() require('grug-far').open({ prefills = { search = vim.fn.expand("<cword>"), paths = vim.fn.expand("%") } }) end, {desc = "launch f+r with word, in file"})

k("v", "<leader>hsd", function() require('grug-far').with_visual_selection({ transient = true }) end, { desc = "launch f+r with selection, in dir"})
k("v", "<leader>hsf", function() require('grug-far').with_visual_selection({ transient = true, prefills = { paths = vim.fn.expand("%") } }) end, {desc = "launch f+r with selection, in file"})
-- Insert Mode --
k("i", ";;", "<ESC>", { desc = "exit insert mode" })

-- Visual Mode --
k("v", "p", '"_dP', { desc = "paste without replacing register" })


-- Terminal Mode --
k("t", ";;", "<C-\\><C-N>", { desc = "make ;; go to normal mode in terminal" })

-- lsp
vim.api.nvim_create_autocmd("LspAttach", {
    group = vim.api.nvim_create_augroup("UserLspConfig", {}),
    callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf, silent = true }

    -- set keybinds
    opts.desc = "Show LSP references"
    k("n", "gR", function() Snacks.picker.lsp_references() end, opts) -- show definition, references

    opts.desc = "Go to declaration"
    k("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

    opts.desc = "Show LSP definition"
    k("n", "gd", vim.lsp.buf.definition, opts) -- show lsp definition

    opts.desc = "Show LSP implementations"
    k("n", "gi", function() Snacks.picker.lsp_implementations() end, opts) -- show lsp implementations

    opts.desc = "Show LSP type definitions"
    k("n", "gt", function() Snacks.picker.lsp_type_definitions() end, opts) -- show lsp type definitions

    opts.desc = "See available code actions"
    k({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

    opts.desc = "Smart rename"
    k("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

    opts.desc = "Go to previous diagnostic"
    k("n", "[d", function()
            vim.diagnostic.jump({ count = -1, float = true })
    end, opts) -- jump to previous diagnostic in buffer
    --
    opts.desc = "Go to next diagnostic"
    k("n", "]d", function()
            vim.diagnostic.jump({ count = 1, float = true })
    end, opts) -- jump to next diagnostic in buffer

    opts.desc = "Show documentation for what is under cursor"
    k("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

    opts.desc = "Restart LSP"
    k("n", "<leader>rs", "<cmd>LspRestart<CR>", opts) -- mapping to restart lsp if necessary
  end,
})

-- only, only, only trust two godspeeds
