return {
    keymap = { preset = 'super-tab' },
    appearance = {
      -- 'mono' (default) for 'Nerd Font Mono' or 'normal' for 'Nerd Font'
      -- Adjusts spacing to ensure icons are aligned
      nerd_font_variant = 'mono'
    },
    completion = {
        documentation = { auto_show = true, window = { border = 'rounded', winblend = 15 } },
        menu = { 
            border = 'rounded', 
            winblend = 15,
            draw = {
                columns = { { "kind_icon" }, {"label", gap = 1} },
                components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end,
                        }
                    }
            }
        },
        list = {
            selection = {
                preselect = true,
                auto_insert = false,
            },
        },
        ghost_text = { enabled = true }
    },
    signature = { enabled = true, window = { border = 'rounded', winblend = 15 } },

    -- Default list of enabled providers defined so that you can extend it
    -- elsewhere in your config, without redefining it, due to `opts_extend`
    sources = {
        default = { 'lazydev', 'lsp', 'copilot', 'path', 'snippets', 'buffer' },
        providers = {
            copilot = {
                name = "copilot",
                module = "blink-copilot",
                async = true,
            },
            lazydev = {
                name = "LazyDev",
                module = "lazydev.integrations.blink",
                score_offset = 100,
          },
        }
    },

    -- (Default) Rust fuzzy matcher for typo resistance and significantly better performance
    -- You may use a lua implementation instead by using `implementation = "lua"` or fallback to the lua implementation,
    -- when the Rust fuzzy matcher is not available, by using `implementation = "prefer_rust"`
    --
    -- See the fuzzy documentation for more information
    fuzzy = { implementation = "prefer_rust_with_warning"}
}
