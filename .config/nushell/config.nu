# config.nu
#
# Installed by:
# version = "0.112.2"
#
# This file is used to override default Nushell settings, define
# (or import) custom commands, or run any other startup tasks.
# See https://www.nushell.sh/book/configuration.html
#
# Nushell sets "sensible defaults" for most configuration settings, 
# so your `config.nu` only needs to override these defaults if desired.
#
# You can open this file in your default editor using:
#     config nu
#
# You can also pretty-print and page through the documentation for configuration
# options using:
#     config nu --doc | nu-highlight | less -R
#
#
$env.config.show_banner = false
$env.config.edit_mode = 'vi'
mkdir ($nu.data-dir | path join "vendor/autoload")

alias vim = nvim
alias v = vim
alias l = ls
# alias l = eza -la -ls=time --icons --color=always --group-directories-first --no-time --no-user --no-permissions
# alias ls = eza -la -ls=time --icons --color=always --group-directories-first --no-time --no-user --no-permissions
alias lt = eza -la -ls=time --icons --color=always --group-directories-first --no-time --no-user --no-permissions -T
alias f = sh /home/ehatt/.config/fzf/fzfsh.sh
alias fzf = sh /home/ehatt/.config/fzf/fzfsh.sh
alias b = batman
alias man = batman
alias grep = rg --color=auto
alias rg = rg --color=auto
alias top = btop
alias lg = lazygit
alias fetch = fastfetch -c /home/ehatt/.config/fastfetch/ehatt.jsonc
alias c = clear


#alias cd = z
alias ... = z ../..
alias .t = z ../../..
alias .f = z ../../../..
alias .v = z ../../../../..

# packages
alias p = paru
alias pget = paru -S
alias pdel = paru -R
alias pup = paru -Syyy
alias sysup = paru -Syu

# git
alias addall = git add .
alias clone = git clone
alias commit = git commit -m
alias pull = git pull origin
alias push = git push origin

# fun
alias poke = pokemon-colorscripts --no-title -s -r #without fastfetch
# alias pokefetch = pokemon-colorscripts --no-title -s -r | fastfetch -c $nu.home-dir/.config/fastfetch/pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5
alias rr = curl -s -L https://raw.githubusercontent.com/BomberFish/rickrollrc-zsh/master/roll.sh | bash

# quick configs
alias vimconf = z ~/.config/nvim/lua/quasar and nvim .
alias fishconf = z ~/.config/fish/ and nvim config.fish
alias ghosttyconf = z ~/.config/ghostty/ and nvim config
alias starshipconf = z ~/.config/ and nvim starship.toml
alias hyprconf = z ~/.config/hypr/ and nvim .
alias wbconf = z ~/.config/waybar/ and nvim .
alias roconf = z ~/.config/rofi/ and nvim .

#music
alias yta = rmpc addyt
fastfetch -c /home/ehatt/.config/fastfetch/ehatt.jsonc

starship init nu | save -f ($nu.data-dir | path join "vendor/autoload/starship.nu")

source $"($nu.cache-dir)/carapace.nu"

source ~/.zoxide.nu
