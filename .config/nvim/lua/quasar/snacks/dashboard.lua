-- ellie's dashboard.
return {
    enabled = true,
    preset = {
        keys = {
            { icon = " ", key = "f", desc = "find file", action = ":lua Snacks.dashboard.pick('files')" },
            { icon = " ", key = "n", desc = "new file", action = ":ene | startinsert" },
            { icon = " ", key = "g", desc = "find text", action = ":lua Snacks.dashboard.pick('live_grep')" },
            { icon = " ", key = "r", desc = "recent files", action = ":lua Snacks.dashboard.pick('oldfiles')" },
            { icon = " ", key = "c", desc = "config", action = ":e $MYVIMRC" },
            { icon = "󰒲 ", key = "L", desc = "lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
            { icon = " ", key = "q", desc = "quit", action = ":qa" },
        },
        header = [[
                 *       +                _   _         __     ___           
           '                  |          | \ | | ___  __\ \   / (_)_ __ ___  
       ()    .-.,="``"=.    - o -        |  \| |/ _ \/ _ \ \ / /| | '_ ` _ \ 
             '=/_       \     |          | |\  |  __/ (_) \ V / | | | | | | |
          *   |  '=._    |               |_| \_|\___|\___/ \_/  |_|_| |_| |_|
               \     `=./`,        '                                         
            .   '=.__.=' `='      *                 ~~@ehatt~~               
   +                         +                -- Now In 100% Lua! --         
        O      *        '       .                                            ]],
    },
    sections = {
        { section = "header" },
        {
      pane = 2,
      section = "terminal",
      cmd = "colorscript -e 9",
      height = 10,
      padding = 1,
    },
        { section = "keys", gap = 1, padding = 1},
        { pane = 2, icon = " ", title = "Recent Files", section = "recent_files", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Projects", section = "projects", indent = 2, padding = 1 },
        { pane = 2, icon = " ", title = "Git Status", section = "terminal",
      enabled = function()
        return Snacks.git.get_root() ~= nil
      end,
      cmd = "git status --short --branch --renames",
      height = 5,
      padding = 1,
      ttl = 5 * 60,
      indent = 3,
    },
        { section = "startup" },
    },
}
