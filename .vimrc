set tabstop=4
set shiftwidth=4
set expandtab
set nu
set rnu
set showcmd
colorscheme codedark
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
augroup ResetCursorShape
au!
autocmd VimEnter * :normal :startInsert :stopInsert
augroup END
