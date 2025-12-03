# @ehatt
# fish shell config.

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases
# better utils
alias vim='nvim'
alias l='lsd -al'
alias ls='lsd -al'
alias lt='lsd --tree'
alias grep='rg --color=auto'
alias rg='rg --color=auto'
alias top='btop'
alias lg='lazygit'

# zoxide / navigation
alias cd='z'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'

# packages
alias p='paru'
alias pget='paru -S'
alias pdel='paru -R'
alias pup='paru -Syyy'
alias sysup='paru -Syu'

# git
alias addall='git add .'
alias clone='git clone'
alias commit='git commit -m'
alias pull='git pull origin'
alias push='git push origin'

# fun
alias poke='pokemon-colorscripts --no-title -s -r' #without fastfetch
alias pokefetch='pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5'
alias rr='curl -s -L https://raw.githubusercontent.com/BomberFish/rickrollrc-zsh/master/roll.sh | bash'

# quick configs
alias vimconf='nvim ~/.config/nvim/init.lua'
alias fishconf='nvim ~/.config/fish/config.fish'
alias ghosttyconf='nvim ~/.config/ghostty/config'
alias starshipconf='nvim ~/.config/starship.toml'
# TODO add hyprland configs

# theme
#run fish_config theme save "Catppuccin Mocha"

# vi mode
fish_vi_key_bindings

# startup
fastfetch -c /home/ehatt/.config/fastfetch/ehatt.jsonc
starship init fish | source
enable_transience
zoxide init fish | source
