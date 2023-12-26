function! ZapMarkdown()
  silent '<,'>s/\$\([^$]*\)\$/\\\\(\1\\\\)/ge
  silent '<,'>s/\\\\(\\\\)/$$/ge
  silent '<,'>s/\\{/\\\\{/ge
  silent '<,'>s/\\}/\\\\}/ge
endfunction

map! <buffer> <F1> <ESC>:call ZapMarkdown()<CR>i
map <buffer> <F1> :call ZapMarkdown()<CR>
