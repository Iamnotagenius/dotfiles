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
setopt prompt_subst
autoload -Uz vcs_info
zstyle ':vcs_info:*' branchformat  \
    '%B%F{cyan}[%F{yellow}%b%F{cyan}]%f'
zstyle ':vcs_info:*' actionformats \
    '%F{5}%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f %F{red}%a%f'
zstyle ':vcs_info:*' formats       \
    '%B%F{cyan}[%F{yellow}%b%m%F{cyan}]%f%%b'

zstyle ':vcs_info:*' enable git 
# or use pre_cmd, see man zshcontrib
vcs_info_wrapper() {
  vcs_info
  if [ -n "$vcs_info_msg_0_" ]; then
    echo "%{$fg[grey]%}${vcs_info_msg_0_}%{$reset_color%}$del "
  fi
}
#RPROMPT='$(vcs_info_wrapper)'
export PS1='$(vcs_info_wrapper)%F{blue}%~ %B%F{%(?.green.red)}$%f%b '
export PATH=$PATH:~/scripts
export VISUAL="nvim"
export EDITOR="nvim"
fpath+=~/.config/functions
_ftp () {
	_describe 'command' "('start:Start bftpd server' 'stop:Stop bftpd server' 'restart:Restart bftpd server')"
}
compdef _ftp ftp
# aliases
[ -f "$HOME/.config/.aliasrc" ] && source "$HOME/.config/.aliasrc"
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

_fix_cursor() {
   echo -ne '\e[5 q'
}
precmd_functions+=(_fix_cursor)

LS_COLORS='rs=0;35:di=01;35:ln=01;36:mh=00:pi=40;33:so=01;34:do=01;35:bd=01;33;04:cd=33;04:or=41;30;01;05:mi=00:su=37;41:sg=30;43:ca=30;41:tw=35;01:ow=35;01:st=37;44:ex=01;32:*.tar=01;31:*.tgz=01;31:*.arc=01;31:*.arj=01;31:*.taz=01;31:*.lha=01;31:*.lz4=01;31:*.lzh=01;31:*.lzma=01;31:*.tlz=01;31:*.txz=01;31:*.tzo=01;31:*.t7z=01;31:*.zip=01;31:*.z=01;31:*.dz=01;31:*.gz=01;31:*.lrz=01;31:*.lz=01;31:*.lzo=01;31:*.xz=01;31:*.zst=01;31:*.tzst=01;31:*.bz2=01;31:*.bz=01;31:*.tbz=01;31:*.tbz2=01;31:*.tz=01;31:*.deb=01;31:*.rpm=01;31:*.jar=01;31:*.war=01;31:*.ear=01;31:*.sar=01;31:*.rar=01;31:*.alz=01;31:*.ace=01;31:*.zoo=01;31:*.cpio=01;31:*.7z=01;31:*.rz=01;31:*.cab=01;31:*.wim=01;31:*.swm=01;31:*.dwm=01;31:*.esd=01;31:*.jpg=01;34:*.jpeg=01;34:*.mjpg=01;34:*.mjpeg=01;34:*.gif=01;34:*.bmp=01;34:*.pbm=01;34:*.pgm=01;34:*.ppm=01;34:*.tga=01;34:*.xbm=01;34:*.xpm=01;34:*.tif=01;34:*.tiff=01;34:*.png=01;34:*.svg=01;34:*.svgz=01;34:*.mng=01;34:*.pcx=01;34:*.mov=01;34:*.mpg=01;34:*.mpeg=01;34:*.m2v=01;34:*.mkv=01;34:*.webm=01;34:*.webp=01;34:*.ogm=01;34:*.mp4=01;34:*.m4v=01;34:*.mp4v=01;34:*.vob=01;34:*.qt=01;34:*.nuv=01;34:*.wmv=01;34:*.asf=01;34:*.rm=01;34:*.rmvb=01;34:*.flc=01;34:*.avi=01;34:*.fli=01;34:*.flv=01;34:*.gl=01;34:*.dl=01;34:*.xcf=01;34:*.xwd=01;34:*.yuv=01;34:*.cgm=01;34:*.emf=01;34:*.ogv=01;34:*.ogx=01;34:*.aac=00;36:*.au=00;36:*.flac=00;36:*.m4a=00;36:*.mid=00;36:*.midi=00;36:*.mka=00;36:*.mp3=00;36:*.mpc=00;36:*.ogg=00;36:*.ra=00;36:*.wav=00;36:*.oga=00;36:*.opus=00;36:*.spx=00;36:*.xspf=00;36:*rc=04;35:*.log=04;35;02';
export LS_COLORS

source ~/.zsh/zsh-nix-shell/nix-shell.plugin.zsh
