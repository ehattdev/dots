# v2 of ellie's dotfiles. work in progress.

# oh my zsh setup
export ZSH="$HOME/.oh-my-zsh"


plugins=(
    git
    archlinux
    zsh-autosuggestions
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

# completions / correction
ENABLE_CORRECTION='true'
COMPLETION_WAITING_DOTS='true'

# pokemon colorscripts fetch from jakoolit
alias poke='pokemon-colorscripts --no-title -s -r' #without fastfetch
alias pokefetch='pokemon-colorscripts --no-title -s -r | fastfetch -c $HOME/.config/fastfetch/pokemon.jsonc --logo-type file-raw --logo-height 10 --logo-width 5'

# startup
fastfetch -c $HOME/.config/fastfetch/ehatt.jsonc
# aliases!
# ls
alias ls='lsd -al'
alias lt='lsd --tree'
# grep colors
alias grep='grep --color=auto'
# nvim / editing
alias vim='nvim'
alias zshrc='nvim /home/ehatt/.zshrc'
# z
alias cd='z'
alias ...='z ../..'
alias .3='z ../../..'
alias .4='z ../../../..'
alias .5='z ../../../../..'
# pacman / paru
alias get='paru -S'
alias del='paru -R'
alias fix='paru -Syyy'
alias pacs='pacman -S'
alias pacr='pacman -R'
alias pacfix='pacman -Syyy'
alias unlock='sudo rm /var/lib/pacman/db.lck'
# git
alias addall='git add .'
alias clone='git clone'
alias commit='git commit -m'
alias pull='git pull origin'
alias push='git push origin'
# system
alias probe='sudo -E hw-probe -all -upload' # hw info
alias top='btop'
alias free='free -mt' # available memory
alias userlist='cut -d: -f1 /etc/passwd'
# silly
alias rr='curl -s -L https://raw.githubusercontent.com/BomberFish/rickrollrc-zsh/master/roll.sh | bash'
alias p='paru'
# history
#
bindkey -v
# Set-up FZF key bindings (CTRL R for fuzzy history finder)
source <(fzf --zsh)
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory

# starship prompt
eval "$(starship init zsh)"


# bun completions
[ -s "/home/ehatt/.bun/_bun" ] && source "/home/ehatt/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

eval "$(zoxide init zsh)"
