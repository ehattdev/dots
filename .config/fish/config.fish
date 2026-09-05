# @ehatt
# fish shell config.
# lksadfjlaksfd
if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases

# better utils
alias vim='nvim'
alias l='eza -la -ls=time --icons --color=always --group-directories-first --no-time --no-user --no-permissions'
alias ls='eza -la -ls=time --icons --color=always --group-directories-first --no-time --no-user --no-permissions'
alias lt='eza -la -ls=time --icons --color=always --group-directories-first --no-time --no-user --no-permissions -T'
alias f='sh /home/ehatt/.config/fzf/fzfsh.sh'
alias fzf='sh /home/ehatt/.config/fzf/fzfsh.sh'
alias b='batman'
alias man='batman'
alias grep='rg --color=auto'
alias rg='rg --color=auto'
alias top='btop'
alias lg='lazygit'
alias fetch='fastfetch -c /home/ehatt/.config/fastfetch/ehatt.jsonc'
alias c='clear'

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
alias vimconf='z ~/.config/nvim/lua/quasar && nvim .'
alias fishconf='z ~/.config/fish/ && nvim config.fish'
alias ghosttyconf='z ~/.config/ghostty/ && nvim config'
alias starshipconf='z ~/.config/ && nvim starship.toml'
alias hyprconf='z ~/.config/hypr/ && nvim .'
alias wbconf='z ~/.config/waybar/ && nvim .'
alias roconf='z ~/.config/rofi/ && nvim .'

#music
alias yta='rmpc addyt'
# theme
#run fish_config theme save "Catppuccin Mocha"

# vi mode
fish_vi_key_bindings

# startup
fastfetch -c /home/ehatt/.config/fastfetch/ehatt.jsonc
function starship_transient_prompt_func
  starship module character
end
starship init fish | source
enable_transience
zoxide init fish | source
