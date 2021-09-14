set tabstop=4
set nu
set showcmd
syntax on
hi Visual cterm=reverse ctermbg=NONE
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
augroup ResetCursorShape
au!
autocmd VimEnter * :normal :startInsert :stopInsert
augroup END
filetype plugin indent on
set grepprg=grep\ -nH\ $*
let g:tex_flavor = "latex"
set runtimepath=~/.vim,$VIM/vimfiles,$VIMRUNTIME,$VIM/vimfiles/after,~/.vim/after
let @e='o\begin{equation}\end{equation}OA	'
