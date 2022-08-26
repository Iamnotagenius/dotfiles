" Script Name: indent-bar.vim
" Author:      juniway <juniway@protonmail.com>
"
" Description: Display indention levels with thin vertical lines

scriptencoding utf-8

if !has("conceal") || exists("g:indent_bar_loaded")
    finish
endif
let g:indent_bar_loaded = 1

let g:indent_bar_newVersion = get(g:,'indent_bar_newVersion',v:version > 704 || v:version == 704 && has("patch792"))

let g:indent_bar_char = get(g:, 'indent_bar_char', (&encoding ==# "utf-8" && &term isnot# "linux" ? '¦' : '|'))
let g:indent_bar_char_list = get(g:, 'indent_bar_char_list', [])
let g:indent_bar_first_char = get(g:, 'indent_bar_first_char', (&encoding ==# "utf-8" && &term isnot# "linux" ? '¦' : '|'))
let g:indent_bar_indent_level = get(g:, 'indent_bar_indent_level', 20)
let g:indent_bar_enabled = get(g:, 'indent_bar_enabled', 1)
let g:indent_bar_filetype = get(g:, 'indent_bar_filetype', [])
let g:indent_bar_filetype_exclude = get(g:, 'indent_bar_filetype_exclude', [])
let g:indent_bar_bufname_exclude = get(g:, 'indent_bar_bufname_exclude', [])
let g:indent_bar_buftype_exclude = get(g:, 'indent_bar_buftype_exclude', [])
let g:indent_bar_show_first_indent_level = get(g:, 'indent_bar_show_first_indent_level', 0)
let g:indent_bar_max_lines = get(g:, 'indent_bar_max_lines', 3000)
let g:indent_bar_set_colors = get(g:, 'indent_bar_set_colors', 1)
let g:indent_bar_set_conceal = get(g:, 'indent_bar_set_conceal', 1)
let g:indent_bar_defaultgroup = get(g:, 'indent_bar_defaultgroup', "")
let g:indent_bar_faster = get(g:, 'indent_bar_faster', 0)
let g:indent_bar_leading_space_char = get(g:, 'indent_bar_leading_space_char', (&encoding ==# "utf-8" && &term isnot# "linux" ? '˰' : '.'))
let g:indent_bar_leading_space_enabled = get(g:, 'indent_bar_leading_space_enabled', 0)
let g:indent_bar_mysyntaxfile = fnamemodify(expand("<sfile>"), ":p:h:h")."/syntax/indent_bar.vim"

"{{{1 function! s:InitColor()
function! s:InitColor()
    if !g:indent_bar_set_colors
        return
    endif

    let default_term_bg = "NONE"
    let default_gui_bg  = "NONE"
    if &background ==# "light"
        let default_term_fg = 249
        let default_gui_fg = "Grey70"
    else
        let default_term_fg = 239
        let default_gui_fg = "Grey30"
    endif

    if g:indent_bar_defaultgroup != ""
        let default_id = synIDtrans(hlID(g:indent_bar_defaultgroup))
        let default_term_fg = synIDattr(default_id, "fg", "cterm") == "" ? default_term_fg :  synIDattr(default_id, "fg", "cterm")
        let default_term_bg = synIDattr(default_id, "bg", "cterm") == "" ? default_term_bg :  synIDattr(default_id, "bg", "cterm")
        let default_gui_fg = synIDattr(default_id, "fg", "gui") == "" ? default_gui_fg :  synIDattr(default_id, "fg", "gui")
        let default_gui_bg = synIDattr(default_id, "bg", "gui") == "" ? default_gui_bg :  synIDattr(default_id, "bg", "gui")
    endif

    if !exists("g:indent_bar_color_term")
        let term_color = default_term_fg
    else
        let term_color = g:indent_bar_color_term
    endif

    if !exists("g:indent_bar_bgcolor_term")
        let term_bgcolor = default_term_bg
    else
        let term_bgcolor = g:indent_bar_bgcolor_term
    endif

    if !exists("g:indent_bar_color_gui")
        let gui_color = default_gui_fg
    else
        let gui_color = g:indent_bar_color_gui
    endif

    if !exists("g:indent_bar_bgcolor_gui")
        let gui_bgcolor = default_gui_bg
    else
        let gui_bgcolor = g:indent_bar_bgcolor_gui
    endif

    execute "highlight Conceal cterm=NONE ctermfg=" . term_color . " ctermbg=" . term_bgcolor
    execute "highlight Conceal gui=NONE guifg=" . gui_color .  " guibg=" . gui_bgcolor

    if &term ==# "linux"
        if &background ==# "light"
            let tty_color = exists("g:indent_bar_color_tty_light") ? g:indent_bar_color_tty_light : 4
        else
            let tty_color = exists("g:indent_bar_color_tty_dark") ? g:indent_bar_color_tty_dark : 2
        endif
        execute "highlight Conceal cterm=bold ctermfg=" . tty_color .  " ctermbg=NONE"
    endif
endfunction

"{{{1 function! s:SetConcealOption()
function! s:SetConcealOption()
    if !g:indent_bar_set_conceal
        return
    endif
    if !(exists("b:indent_bar_ConcealOptionSet") && b:indent_bar_ConcealOptionSet)
        let b:indent_bar_ConcealOptionSet = 1
        let b:indent_bar_original_concealcursor = &l:concealcursor
        let b:indent_bar_original_conceallevel = &l:conceallevel
        let &l:concealcursor = exists("g:indent_bar_concealcursor") ? g:indent_bar_concealcursor : "inc"
        let &l:conceallevel = exists("g:indent_bar_conceallevel") ? g:indent_bar_conceallevel : "2"
    endif
endfunction

"{{{1 function! s:ResetConcealOption()
function! s:ResetConcealOption()
    if exists("b:indent_bar_ConcealOptionSet") && b:indent_bar_ConcealOptionSet
        if exists("b:indent_bar_original_concealcursor")
            let &l:concealcursor = b:indent_bar_original_concealcursor
        endif
        if exists("b:indent_bar_original_conceallevel")
            let &l:conceallevel = b:indent_bar_original_conceallevel
        endif
        let b:indent_bar_ConcealOptionSet = 0
    endif
endfunction

"{{{1 function! s:DisableOnDiff()
function! s:DisableOnDiff()
    if &diff
        call s:IndentBarDisable()
        call s:LeadingSpaceDisable()
    endif
endfunction

"{{{1 function! s:VimEnter()
function! s:VimEnter()
    let init_winnr = winnr()
    noautocmd windo call s:DisableOnDiff()
    noautocmd exec init_winnr . "wincmd w"
endfunction

"{{{1 function! s:ToggleOnDiff()
function! s:ToggleOnDiff()
    if &diff
        call s:IndentBarDisable()
        call s:LeadingSpaceDisable()
    else
        call s:Setup()
    endif
endfunction

"{{{1 function! s:IndentBarEnable()
function! s:IndentBarEnable()
    if g:indent_bar_newVersion
        if exists("b:indent_bar_enabled") && b:indent_bar_enabled == 0
            return
        endif

        if !exists("w:indent_bar_indent_bar_id")
            let w:indent_bar_indent_bar_id = []
        endif

        call s:SetConcealOption()

        if g:indent_bar_show_first_indent_level
            call add(w:indent_bar_indent_bar_id, matchadd('Conceal', '^ ', 0, -1, {'conceal': g:indent_bar_first_char}))
        endif

        let space = &l:shiftwidth == 0 ? &l:tabstop : &l:shiftwidth
        let n = len(g:indent_bar_char_list)
        let level = 0
        for i in range(space+1, space * g:indent_bar_indent_level + 1, space)
            if n > 0
                let char = g:indent_bar_char_list[level % n]
                let level += 1
            else
                let char = g:indent_bar_char
            endif
            call add(w:indent_bar_indent_bar_id, matchadd('Conceal', '^\s\+\zs\%'.i.'v ', 0, -1, {'conceal': char}))
        endfor

        return
    endif

    if exists("b:indent_bar_enabled") && b:indent_bar_enabled
        return
    else
        let b:indent_bar_enabled = 1
    endif

    call s:SetConcealOption()

    let g:mysyntaxfile = g:indent_bar_mysyntaxfile

    let space = &l:shiftwidth == 0 ? &l:tabstop : &l:shiftwidth

    if g:indent_bar_show_first_indent_level
        execute 'syntax match indent_bar /^ / containedin=ALL conceal cchar=' . g:indent_bar_first_char
    endif

    if g:indent_bar_faster
        execute 'syntax match indent_bar_space /^\s\+/ containedin=ALL contains=indent_bar'
        execute 'syntax match indent_bar / \{'.(space-1).'}\zs / contained conceal cchar=' . g:indent_bar_char
        execute 'syntax match indent_bar /\t\zs / contained conceal cchar=' . g:indent_bar_char
    else
        let pattern = line('$') < g:indent_bar_max_lines ? 'v' : 'c'
        for i in range(space+1, space * g:indent_bar_indent_level + 1, space)
            execute 'syntax match indent_bar /\%(^\s\+\)\@<=\%'.i.pattern.' / containedin=ALL conceal cchar=' . g:indent_bar_char
        endfor
    endif
endfunction

"{{{1 function! s:IndentBarDisable()
function! s:IndentBarDisable()
    if g:indent_bar_newVersion
        if exists("w:indent_bar_indent_bar_id") && ! empty(w:indent_bar_indent_bar_id)
            for id in w:indent_bar_indent_bar_id
                try
                    call matchdelete(id)
                catch /^Vim\%((\a\+)\)\=:E80[23]/
                endtry
            endfor
            let w:indent_bar_indent_bar_id = []
        endif

        call s:ResetConcealOption()
        return
    endif

    let b:indent_bar_enabled = 0
    try
        syntax clear indent_bar
        syntax clear indent_bar_space
    catch /^Vim\%((\a\+)\)\=:E28/	" catch error E28
    endtry
endfunction

"{{{1 function! s:IndentBarToggle()
function! s:IndentBarToggle()
    if g:indent_bar_newVersion
        if exists("w:indent_bar_indent_bar_id") && ! empty(w:indent_bar_indent_bar_id)
            let b:indent_bar_enabled = 0
            call s:IndentBarDisable()
        else
            let b:indent_bar_enabled = 1
            call s:IndentBarEnable()
        endif

        return
    endif

    if exists("b:indent_bar_enabled") && b:indent_bar_enabled
        call s:IndentBarDisable()
    else
        call s:IndentBarEnable()
    endif
endfunction

"{{{1 function! s:ResetWidth(...)
function! s:ResetWidth(...)
    if 0 < a:0
        noautocmd let &l:shiftwidth = a:1
    endif

    let b:indent_bar_enabled = 1
    call s:IndentBarDisable()
    call s:IndentBarEnable()
endfunction

"{{{1 function! s:AutoResetWidth()
function! s:AutoResetWidth()

    let l:enable = get(
                    \ b:,
                    \ 'indent_bar_enabled',
                    \ get(g:, 'indent_bar_enabled', 1)
                    \)

    let g:indent_bar_auto_reset_width = get(g:, 'indent_bar_auto_reset_width', 1)

    if l:enable != 1 || g:indent_bar_auto_reset_width != 1
        return
    endif

    let b:indent_bar_enabled = l:enable
    call s:IndentBarDisable()
    call s:IndentBarEnable()
endfunction

"{{{1 function! s:Filter()
function! s:Filter()
    if index(g:indent_bar_filetype_exclude, &filetype) != -1
        return 0
    endif

    if index(g:indent_bar_buftype_exclude, &buftype) != -1
        return 0
    endif

    if len(g:indent_bar_filetype) != 0 && index(g:indent_bar_filetype, &filetype) == -1
        return 0
    endif

    for name in g:indent_bar_bufname_exclude
        if matchstr(bufname(''), name) == bufname('')
            return 0
        endif
    endfor

    return 1
endfunction

"{{{1 function! s:Disable()
function! s:Disable()
    if exists("b:indent_bar_enabled") && b:indent_bar_enabled
        return
    elseif exists("b:indent_bar_leading_space_enabled") && b:indent_bar_leading_space_enabled
        return
    elseif s:Filter() == 0
        call s:IndentBarDisable()
        call s:LeadingSpaceDisable()
    endif
endfunction

"{{{1 function! s:Setup()
function! s:Setup()
    if &filetype ==# ""
        call s:InitColor()
    endif

    if s:Filter() && g:indent_bar_enabled || exists("b:indent_bar_enabled") && b:indent_bar_enabled
        call s:IndentBarEnable()
    endif

    if s:Filter() && g:indent_bar_leading_space_enabled || exists("b:indent_bar_leading_space_enabled") && b:indent_bar_leading_space_enabled
        call s:LeadingSpaceEnable()
    endif
endfunction

"{{{1 function! s:LeadingSpaceEnable()
function! s:LeadingSpaceEnable()
    if g:indent_bar_newVersion
        if exists("b:indent_bar_leading_space_enabled") && b:indent_bar_leading_space_enabled == 0
            return
        endif

        if !exists("w:indent_bar_leadingSpaceId")
            let w:indent_bar_leadingSpaceId = []
        endif

        call s:SetConcealOption()

        call add(w:indent_bar_leadingSpaceId, matchadd('Conceal', '\%(^\s*\)\@<= ', 0, -1, {'conceal': g:indent_bar_leading_space_char}))

        if exists("w:indent_bar_indent_bar_id") && ! empty(w:indent_bar_indent_bar_id)
            call s:ResetWidth()
        endif

        return
    endif

    if g:indent_bar_faster
        echoerr 'LeadingSpace can not be shown when g:indent_bar_faster == 1'
        return
    endif
    let g:mysyntaxfile = g:indent_bar_mysyntaxfile
    let b:indent_bar_leading_space_enabled = 1
    call s:SetConcealOption()
    execute 'syntax match indent_barLeadingSpace /\%(^\s*\)\@<= / containedin=ALLBUT,indent_bar conceal cchar=' . g:indent_bar_leading_space_char
endfunction

"{{{1 function! s:LeadingSpaceDisable()
function! s:LeadingSpaceDisable()
    if g:indent_bar_newVersion
        if exists("w:indent_bar_leadingSpaceId") && ! empty(w:indent_bar_leadingSpaceId)
            for id in w:indent_bar_leadingSpaceId
                try
                    call matchdelete(id)
                catch /^Vim\%((\a\+)\)\=:E80[23]/
                endtry
            endfor
            let w:indent_bar_leadingSpaceId = []
        endif

        return
    endif

    let b:indent_bar_leading_space_enabled = 0
    try
        syntax clear indent_barLeadingSpace
    catch /^Vim\%((\a\+)\)\=:E28/   " catch error E28
    endtry
endfunction

"{{{1 function! s:LeadingSpaceToggle()
function! s:LeadingSpaceToggle()
    if g:indent_bar_newVersion
        if exists("w:indent_bar_leadingSpaceId") && ! empty(w:indent_bar_leadingSpaceId)
            let b:indent_bar_leading_space_enabled = 0
            call s:LeadingSpaceDisable()
        else
            let b:indent_bar_leading_space_enabled = 1
            call s:LeadingSpaceEnable()
        endif

        return
    endif

    if exists("b:indent_bar_leading_space_enabled") && b:indent_bar_leading_space_enabled
        call s:LeadingSpaceDisable()
    else
        call s:LeadingSpaceEnable()
    endif
endfunction

"{{{1 augroup indent_bar
augroup indent-bar
    autocmd!
    if g:indent_bar_newVersion
        autocmd BufRead,BufNewFile,ColorScheme,Syntax * call s:InitColor()
        if exists("##WinNew")
            autocmd WinNew * call s:Setup()
        endif
        autocmd BufWinEnter * call s:IndentBarDisable() | call s:LeadingSpaceDisable() | call s:Setup()
        autocmd FileType * call s:Disable()
        if exists("##OptionSet")
            autocmd OptionSet diff call s:ToggleOnDiff()
            autocmd OptionSet shiftwidth,tabstop noautocmd call s:AutoResetWidth()
        endif
        autocmd VimEnter * call s:VimEnter()
    else
        autocmd BufWinEnter * call s:Setup()
        autocmd User * if exists("b:indent_bar_enabled") || exists("b:indent_bar_leading_space_enabled") |
                        \ call s:Setup() | endif
        autocmd BufRead,BufNewFile,ColorScheme,Syntax * call s:InitColor()
        autocmd BufUnload * let b:indent_bar_enabled = 0 | let b:indent_bar_leading_space_enabled = 0
        autocmd SourcePre $VIMRUNTIME/syntax/nosyntax.vim doautocmd indent_bar BufUnload
        autocmd FileChangedShellPost * doautocmd indent_bar BufUnload | call s:Setup()
        if exists("##OptionSet")
            autocmd OptionSet diff call s:ToggleOnDiff()
            autocmd OptionSet shiftwidth,tabstop noautocmd call s:AutoResetWidth()
        endif
        autocmd VimEnter * call s:VimEnter()
    endif
augroup END

"{{{1 commands
command! -nargs=? IndentBarReset call s:ResetWidth(<f-args>)
command! IndentBarToggle call s:IndentBarToggle()
if g:indent_bar_newVersion
    command! IndentBarEnable let b:indent_bar_enabled = 1 | call s:IndentBarEnable()
    command! IndentBarDisable let b:indent_bar_enabled = 0 | call s:IndentBarDisable()
    command! LeadingSpaceEnable let b:indent_bar_leading_space_enabled = 1 | call s:LeadingSpaceEnable()
    command! LeadingSpaceDisable let b:indent_bar_leading_space_enabled = 0 | call s:LeadingSpaceDisable()
else
    command! IndentBarEnable call s:IndentBarEnable()
    command! IndentBarDisable call s:IndentBarDisable()
    command! LeadingSpaceEnable call s:LeadingSpaceEnable()
    command! LeadingSpaceDisable call s:LeadingSpaceDisable()
endif
command! LeadingSpaceToggle call s:LeadingSpaceToggle()

" vim:et:ts=4:sw=4:fdm=marker:fmr={{{,}}}

