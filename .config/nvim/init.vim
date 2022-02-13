call plug#begin(stdpath('data') . '/plugged')
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'jreybert/vimagit'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
call plug#end()

if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set tabstop=4
set shiftwidth=4
set expandtab
set nu
set rnu
set showcmd
set noshowmode
set nohlsearch
set guifont=Fira\ Mono:h15
colorscheme one
set background=dark
let &t_SI = "\e[5 q"
let &t_SR = "\e[3 q"
let &t_EI = "\e[1 q"
augroup ResetCursorShape
au!
autocmd VimEnter * :normal :startInsert :stopInsert
augroup END
set clipboard=unnamedplus

filetype plugin indent on
syntax enable
let g:vimtex_compiler_latexmk = {
    \ 'build_dir' : '',
    \ 'callback' : 1,
    \ 'continuous' : 1,
    \ 'executable' : 'latexmk',
    \ 'hooks' : [],
    \ 'options' : [
    \   '-verbose',
    \   '-synctex=1',
    \   '-interaction=nonstopmode',
    \ ],
    \}
let g:vimtex_compiler_method = 'latexmk'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_ignore_filters = ['Package babel Warning']
let g:vimtex_syntax_conceal = {
      \ 'accents': 1,
      \ 'cites': 1,
      \ 'fancy': 1,
      \ 'greek': 1,
      \ 'math_bounds': 0,
      \ 'math_delimiters': 0,
      \ 'math_fracs': 0,
      \ 'math_super_sub': 0,
      \ 'math_symbols': 1,
      \ 'sections': 1,
      \ 'styles': 1,
\}

let g:neovide_cursor_vfx_mode = "ripple"

"let g:airline_symbols_ascii = 1
let g:airline_powerline_fonts = 1
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#xkblayout#enabled = 1

let g:ConqueGdb_SrcSplit = 'left'
command! -nargs=1 -complete=file GG ConqueGdb <args>
command! -nargs=1 -complete=file Ga ConqueGdbCommand set args <args>
command! -nargs=1 -complete=file Gf ConqueGdbCommand file <args>
command! -nargs=1 G ConqueGdbCommand <args>
command! -nargs=1 Gp ConqueGdbCommand p <args>

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

nmap <leader>rn <Plug>(coc-rename)
" Create mapping to toggle compiling with shell escape or not
nnoremap <F12> :call ShellEscape()<CR>
function! ShellEscape()
    if g:vimtex_compiler_latexmk.options[0] ==# '-shell-escape'
        call remove(g:vimtex_compiler_latexmk.options, 0)
        call vimtex#log#info("Shell escape disabled!")
    else
        call insert(g:vimtex_compiler_latexmk.options, '-shell-escape', 0)
        call vimtex#log#info("Shell escape enabled!")
    endif
    VimtexReload
endfunction

" vim -b : edit binary using xxd-format!
augroup Binary
    au!
    au BufReadPre  *.bin,*.mp3,*.bmp let &bin=1
    au BufReadPost *.bin,*.mp3,*.bmp if &bin | %!xxd -u -g 1
    au BufReadPost *.bin,*.mp3,*.bmp set ft=xxd | endif
    au BufWritePre *.bin,*.mp3,*.bmp if &bin | %!xxd -r
    au BufWritePre *.bin,*.mp3,*.bmp endif
    au BufWritePost *.bin,*.mp3,*.bmp if &bin | %!xxd -u -g 1
    au BufWritePost *.bin,*.mp3,*.bmp set nomod | endif
augroup END
augroup Make
    au BufReadPre *.c,*.cpp,*.h,*.hpp command! M silent make | cw
    au BufReadPre *.c,*.cpp,*.h,*.hpp command! Md silent make debug | cw
augroup END
au BufEnter *.tex hi! link Conceal Operator

let g:MatrixMode = 0
function MatrixMode()
    if g:MatrixMode
        iunmap <Space>
        inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
        echo "Matrix mode disabled"
        let g:MatrixMode = 0
    else
        inoremap <Space> <Space>&<Space>
        inoremap <CR> <Space>\\<CR>
        let g:MatrixMode = 1
        echo "Matrix mode enabled"
    endif
endfunction
command M :call MatrixMode()

" Templates
nmap ,make :r ~/.vim/templates/Makefile<CR>kdd2jf=a<Space>
nmap ,tex :r ~/.vim/templates/template.tex<CR>kdd4jo

"Useful maps
nmap c; ct;
nmap d; dt;
nmap y; yt;

nmap c] ct_
nmap d] dt_
nmap y] yt_

nmap c, \(\u\|\s\|(\|)\|:\|;\|[\|]\)<CR>

nmap yp c/\u<CR>
nmap <Tab> :norm I<Tab><ESC>
nmap <S-Tab> :norm 04x<CR>

vmap <Tab> :norm I<Tab><ESC>gv
vmap <S-Tab> :norm 04x<CR>gv
