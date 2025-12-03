--   _________  _   _   _    ____    _    ____  ______
--  / / / / _ \| | | | / \  / ___|  / \  |  _ \ \ \ \ \
-- / / / / | | | | | |/ _ \ \___ \ / _ \ | |_) | \ \ \ \
-- \ \ \ \ |_| | |_| / ___ \ ___) / ___ \|  _ <  / / / /
--  \_\_\_\__\_\\___/_/   \_\____/_/   \_\_| \_\/_/_/_/

-- treesitter advanced syntax highlighting. Works for nearly any language or filetype. Having LSP installed for that type helps.

local configs = require("nvim-treesitter.configs")
configs.setup {
    ensure_installed = "all",
    sync_install = false,
    ignore_install = require("quasar.treesitter.ignore"),
    highlight = {
        enable = true, -- false will disable the whole plugin
        disable = require("quasar.treesitter.ignore"), -- list of language that will be disabled
        additional_vim_regex_highlighting = true,
    },
    indent = { enable = true, disable = { "yaml" } }, -- make smart indent smarter. Except for in yaml where it screwes everything up. So that's disabled.
    rainbow = { -- Vscode BracketPairColorizer-like bracket highlighting. super convienent, makes it way easier to see where nested parenthases/brackets connect
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    }
}
