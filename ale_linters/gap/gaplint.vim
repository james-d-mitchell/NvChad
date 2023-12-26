"============================================================================
"File:        gaplint.vim
"Description: Syntax checking plugin for ale.vim
"Maintainer:  jenkyfunds@pm.me 
"License:     This program is free software. It comes without any warranty,
"             to the extent permitted by applicable law. You can redistribute
"             it and/or modify it under the terms of the Do What The Fuck You
"             Want To Public License, Version 2, as published by Sam Hocevar.
"             See http://sam.zoy.org/wtfpl/COPYING for more details.
"
"============================================================================

let g:ale_linters = {'gap': ['gaplint']}
let g:ale_fixers = {'gap': ['remove_trailing_lines', 'trim_whitespace']}
let g:ale_fix_on_save = 1

call ale#Set('gap_gaplint_executable', 'gaplint')
call ale#Set('gap_gaplint_options', '')

function! ale_linters#gap#gaplint#GetCommand(buffer) abort
    let l:options = ale#Var(a:buffer, 'gap_gaplint_options')

    return '%e' . ale#Pad(l:options) . ' %s'
endfunction

function! HandleGapLintFormat(buffer, lines) abort
    let l:pattern = '^.\{-}:\(\d\+\): *\(.\+\) *\[\(.*\)\]'
    let l:output = []

    for l:match in ale#util#GetMatches(a:lines, l:pattern)
        call add(l:output, {
        \   'lnum': l:match[1] + 0,
        \   'col': 0,
        \   'text': join(split(l:match[2])),
        \   'code': l:match[3],
        \   'type': 'W',
        \})
    endfor

    return l:output
endfunction

call ale#linter#Define('gap', {
\   'name': 'gaplint',
\   'output_stream': 'stderr',
\   'executable': {b -> ale#Var(b, 'gap_gaplint_executable')},
\   'command': function('ale_linters#gap#gaplint#GetCommand'),
\   'callback': 'HandleGapLintFormat',
\   'lint_file': 1,
\})
