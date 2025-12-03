return {
    prompt = "  ",
    finder = "diagnostics",
    format = "diagnostic",
    sort = {
        fields = {
            "is_current",
            "is_cwd",
            "severity",
            "file",
            "lnum",
        },
    },
    matcher = { sort_empty = true },
    filter = { cwd = true },
}
