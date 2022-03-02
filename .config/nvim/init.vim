"file-specific startup scripts
autocmd BufAdd,BufEnter *.tex ++once source ~/.config/nvim/tex.vim
call plug#begin(stdpath('data') . '/plugged')
Plug 'lervag/vimtex'
Plug 'vim-airline/vim-airline'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'vim-airline/vim-airline-themes'
Plug 'jreybert/vimagit'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'octol/vim-cpp-enhanced-highlight'
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

" VIMTEX
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
call vimtex#imaps#add_map({
  \ 'lhs' : '<m-i>',
  \ 'rhs' : '\item ',
  \ 'leader' : '',
  \ 'wrapper' : 'vimtex#imaps#wrap_environment',
  \ 'context' : ["itemize", "enumerate"],
  \})

call vimtex#imaps#add_map({
    \ 'lhs': 'mx',
    \ 'rhs': '\begin{bmatrix}<CR>',
    \ 'wrapper': 'vimtex#imaps#wrap_math',
    \})

call vimtex#imaps#add_map({
    \ 'lhs': 'vx',
    \ 'rhs': '\begin{vmatrix}<CR>',
    \ 'wrapper': 'vimtex#imaps#wrap_math',
    \})

call vimtex#imaps#add_map({
    \ 'lhs': '<Space>',
    \ 'rhs': ' & ',
    \ 'leader': '',
    \ 'wrapper': 'vimtex#imaps#wrap_environment',
    \ 'context': ['vmatrix', 'bmatrix'],
    \})

call vimtex#imaps#add_map({
    \ 'lhs': '<CR>',
    \ 'rhs': ' \\',
    \ 'leader': '',
    \ 'wrapper': 'vimtex#imaps#wrap_environment',
    \ 'context': ['vmatrix', 'bmatrix'],
    \})

let g:tabbed_doc_xid = ""
let g:vimtex_doc_handlers = ['MyHandler']
function! MyHandler(context)
    call vimtex#doc#make_selection(a:context)
    if !empty(a:context.selected)
        call system('~/scripts/mytexdoc.sh ' . shellescape(a:context.selected))
    endif
    return 1
endfunction

let g:neovide_cursor_vfx_mode = "torpedo"

let g:cpp_class_scope_highlight = 1
let g:cpp_member_variable_highlight = 1
let g:cpp_class_decl_highlight = 1
let g:cpp_experimental_simple_template_highlight = 1
let g:cpp_concepts_highlight = 1

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

let g:coc_default_semantic_highlight_groups = 1
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ coc#expandableOrJumpable() ?
    \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"
nnoremap <silent> <leader>h :call CocActionAsync('doHover')<cr>

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

xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)

xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


nmap <F2> <Plug>(coc-rename)
autocmd User CocJumpPlaceholder call
    \ CocActionAsync('showSignatureHelp')
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

command Python exe 'rightbelow 45vs term://python' | set syntax=python | norm a
tnoremap <ESC> <C-\><C-N>

function! SynStack()
  if !exists("*synstack")
    return
  endif
  echo map(synstack(line('.'), col('.')), 'synIDattr(v:val, "name")')
endfunc

"Semantic highlight
hi CocSem_namespace gui=italic guifg=LightRed
hi Macro gui=Bold
hi Include gui=Bold
hi cInclude gui=Bold
hi CocSem_variable guifg=#56b6c2
hi CocSem_property guifg=#e06c75
hi CocSem_parameter guifg=#56b6c2 gui=italic
hi CocSem_typeParameter guifg=#e5c07b gui=italic

