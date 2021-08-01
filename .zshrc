HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt autocd
unsetopt beep extendedglob nomatch
bindkey -v
bindkey '^ ' autosuggest-accept

zstyle :compinstall filename '/home/iamnotagenius/.zshrc'
zstyle ':completion:*' menu select
zmodload zsh/complist
autoload -Uz compinit
compinit
_comp_options+=(globdots)

autoload -U colors && colors
export PS1="%F{green}%n%f@%F{red}%m%f:%F{yellow}%1d%f %{$fg_bold[magenta]%}$%{$reset_color%} "
export PATH=$PATH:~/scripts
export VISUAL="/bin/vim"
export EDITOR="vim"
# tab complete mod
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -v '^?' backward-delete-char

# cursor shape
function zle-keymap-select {
	if [[ ${KEYMAP} == vicmd ]] ||
	   [[ $1 = 'block' ]]; then
		echo -ne '\e[1 q'
   	elif [[ ${KEYMAP} == main ]] ||
	     [[ ${KEYMAP} == viins ]] ||
	     [[ ${KEYMAP} == '' ]] ||
	     [[ $1 = 'beam' ]]; then
		echo -ne '\e[5 q'
	fi
}
zle -N zle-keymap-select
zle-line-init() {
     echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q'
preexec() { echo -ne '\e[5 q'}


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh 2 > /dev/null
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh 2 > /dev/null

### NNN CONFIG
export NNN_FIFO="/tmp/nnn.fifo"
export NNN_FCOLORS='c1e2dc31006033f7c6d6abc4'
export NNN_PLUG='p:preview-tabbed;c:x2sel;i:-!xclip -selection clipboard -t image/png $nnn*'
n ()
{
    # Block nesting of nnn in subshells
    if [ -n $NNNLVL ] && [ "${NNNLVL:-0}" -ge 1 ]; then
        echo "nnn is already running"
        return
    fi

    # The default behaviour is to cd on quit (nnn checks if NNN_TMPFILE is set)
    # To cd on quit only on ^G, remove the "export" as in:
    #     NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"
    NNN_TMPFILE="${XDG_CONFIG_HOME:-$HOME/.config}/nnn/.lastd"

    # Unmask ^Q (, ^V etc.) (if required, see `stty -a`) to Quit nnn
    # stty start undef
    # stty stop undef
    # stty lwrap undef
    # stty lnext undef

    nnn "$@" -e -x

    if [ -f "$NNN_TMPFILE" ]; then
            . "$NNN_TMPFILE"
            rm -f "$NNN_TMPFILE" > /dev/null
    fi
}
