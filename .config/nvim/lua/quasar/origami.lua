require("origami").setup ({
    autofold = {
        enabled = false,
    },
    foldtext = {
        lineCount = {
            template = "󰘖  %d"
        },
        disableOnFt = {
            "snacks_picker_input",
            "snacks_terminal",
            "sidekick_terminal",
            "snacks_dashboard",
        },
    },
})


