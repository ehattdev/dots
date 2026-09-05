#!/bin/fish

fzf --style full \
    --height 40% \
    --border --padding 1,2 \
    --border-label ' fzf ' --input-label '  ' --header-label '  type ' \
    --preview 'bat --color=always --style=numbers {}' \
    --bind 'result:transform-list-label:
        if [[ -z $FZF_QUERY ]]; then
          echo " $FZF_MATCH_COUNT items "
        else
          echo " $FZF_MATCH_COUNT matches for [$FZF_QUERY] "
        fi
        ' \
    --bind 'focus:transform-preview-label:[[ -n {} ]] && printf " Previewing [%s] " {}' \
    --bind 'focus:+transform-header:file --brief {} || echo "No file selected"' \
    --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)' \
    --color 'border:#b4befe,label:#f5e0dc' \
    --color 'preview-border:#a6e3a1,preview-label:#94e2d5' \
    --color 'list-border:#f9e2af,list-label:#fab387' \
    --color 'input-border:#cba6f7,input-label:#f5c2e7' \
    --color 'header-border:#89b4fa,header-label:#74c7ec' \
    --color=bg+:#313244,bg:#1E1E2E,spinner:#F5E0DC,hl:#F38BA8 \
    --color=fg:#CDD6F4,header:#F38BA8,info:#CBA6F7,pointer:#F5E0DC \
    --color=marker:#B4BEFE,fg+:#CDD6F4,prompt:#CBA6F7,hl+:#F38BA8 \
    --color=selected-bg:#45475A \
