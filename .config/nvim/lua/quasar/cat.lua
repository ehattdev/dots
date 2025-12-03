require("catppuccin").setup({
    flavour = "mocha", -- latte, frappe, macchiato, mocha
    background = { -- :h background
        light = "latte",
        dark = "mocha",
    },
    transparent_background = false, -- disables setting the background color.
    float = {
        transparent = true, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
    },
    show_end_of_buffer = false, -- shows the '~' characters after the end of buffers
    term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
    dim_inactive = {
        enabled = true, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
    },
    no_italic = false, -- Force no italic
    no_bold = false, -- Force no bold
    no_underline = false, -- Force no underline
    styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
        keywords = { "underline" },
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
    },
    lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
            errors = { "italic" },
            hints = { "italic" },
            warnings = { "italic" },
            information = { "italic" },
            ok = { "italic" },
        },
        underlines = {
            errors = { "underline" },
            hints = { "underline" },
            warnings = { "underline" },
            information = { "underline" },
            ok = { "underline" },
        },
        inlay_hints = {
            background = true,
        },
    },
    default_integrations = true,
    auto_integrations = true,
    integrations = {
        gitsigns = true,
        mini = {
            enabled = true,
            indentscope_color = "",
        },
        blink_cmp = {
            style = 'bordered',
        },
        dropbar = {
            enabled = true,
            color_mode = true, -- enable color for kind's texts, not just kind's icons
        },
        flash = true,
        noice = true,
        copilot_vim = true,
        rainbow_delimiters = true,
        snacks = {
            enabled = true,
            indent_scope_color = "lavender", -- catppuccin color (eg. `lavender`) Default: text
        },
        lsp_trouble = true,
        which_key = true,
        rendered_markdown = true,
    },
    highlight_overrides = {
        mocha = function(mocha)
            return {
                RenderMarkdownH1 = { fg = mocha.mauve, style = { "bold" } },
                RenderMarkdownH1Bg = { fg = mocha.crust, bg = mocha.mauve, style = { "bold" }},
                ["@markup.heading.1.markdown"] = { fg = mocha.mauve },

                RenderMarkdownH2 = { fg = mocha.green, style = { "bold" } },
                RenderMarkdownH2Bg = { fg = mocha.crust, bg = mocha.green, style = { "bold" }},
                ["@markup.heading.2.markdown"] = { fg = mocha.green },

                RenderMarkdownH3 = { fg = mocha.sky, style = { "bold" } },
                RenderMarkdownH3Bg = { fg = mocha.crust, bg = mocha.sky, style = { "bold" }},
                ["@markup.heading.3.markdown"] = { fg = mocha.sky },

                RenderMarkdownH4 = { fg = mocha.red, style = { "bold" } },
                RenderMarkdownH4Bg = { fg = mocha.crust, bg = mocha.red, style = { "bold" }},
                ["@markup.heading.4.markdown"] = { fg = mocha.red },

                RenderMarkdownH5 = { fg = mocha.peach, style = { "bold" } },
                RenderMarkdownH5Bg = { fg = mocha.crust, bg = mocha.peach, style = { "bold" }},
                ["@markup.heading.5.markdown"] = { fg = mocha.peach },

                RenderMarkdownH6 = { fg = mocha.yellow, style = { "bold" } },
                RenderMarkdownH6Bg = { fg = mocha.crust, bg = mocha.yellow, style = { "bold" }},
                ["@markup.heading.6.markdown"] = { fg = mocha.yellow },

                RenderMarkdownBullet = { fg = mocha.pink },
            }
        end
    }
})

-- setup must be called before loading
vim.cmd.colorscheme "catppuccin"
