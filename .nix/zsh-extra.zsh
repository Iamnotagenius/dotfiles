bindkey '^ ' autosuggest-accept

zstyle :compinstall filename '/home/iamnotagenius/.zshrc'
zstyle ':completion:*' menu select
zmodload zsh/complist
_comp_options+=(globdots)

# tab complete mod
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# cursor shape
function zle-keymap-select {
if [[ $${KEYMAP} == vicmd ]] ||
  [[ $1 = 'block' ]]; then
  echo -ne '\e[1 q'
elif [[ $${KEYMAP} == main ]] ||
  [[ $${KEYMAP} == viins ]] ||
  [[ $${KEYMAP} == \'\' ]] ||
  [[ $1 = 'beam' ]]; then
  echo -ne '\e[5 q'
fi
}
zle -N zle-keymap-select
zle-line-init() {
echo -ne "\e[5 q"
}

_fix_cursor() {
  echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

fd() {
  local dir
  dir=$(find ${1:-.} -path '*/\.*' -prune \
                  -o -type d -print 2> /dev/null | fzf +m) &&
  cd "$dir"
}

source ~/.p10k.zsh
