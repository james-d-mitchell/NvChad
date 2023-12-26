function! ZapLatex()
  silent '<,'>s/{\\em\s*/\\defn{/ge
  silent '<,'>s/{\\it\s*/\\defn{/ge
  silent '<,'>s/{\\bf\s*/\\textbf{/ge
  silent '<,'>s/\\emph{/\\textit{/ge
  silent '<,'>s/\\vspace{\\baselineskip}//ge
  silent '<,'>s/\\fullskip//ge
  silent '<,'>s/\\halfskip//ge
  silent '<,'>s/\\reals/\\R/ge
  silent '<,'>s/\\nat/\\N/ge
  silent '<,'>s/\\integer/\\Z/ge
  silent '<,'>s/\\proof/\\begin{proof}/ge
  silent '<,'>s/\\qed/\\end{proof}/ge
  silent '<,'>s/\\hrel/\\mathscr{H}/ge
  silent '<,'>s/\\lrel/\\mathscr{L}/ge
  silent '<,'>s/\\rrel/\\mathscr{R}/ge
  silent '<,'>s/\\drel/\\mathscr{D}/ge
  silent '<,'>s/\\jrel/\\mathscr{J}/ge
  silent '<,'>s/\\textrm/\\text/ge
  silent '<,'>s/\s\+\\ref/\~\\ref/ge
  silent '<,'>s/&\(\S\)/\& \1/ge
  silent '<,'>s/\(\S\)&/\1 \&/ge
  silent '<,'>s/^\s*%*$//ge
  silent '<,'>s/^\s*\n\{2,}/\r/ge
  silent '<,'>s/\\item\(\s*\S\+\)/\\item\r\1/ge
  silent '<,'>s/\(^\s*\S.*\)\n\s*\\item/\1\r\r\\item/ge
  silent '<,'>s/\\presn{\([^}]*\)}{\([^}]*\)}/\\langle \1 | \2 \\rangle/ge
  silent '<,'>s/{\s*\\rm\s*\(\w*\)\s*}/\\\1/ge
  silent '<,'>s/\\://ge
  silent '<,'>s/\\cal\s*\(\w*\)\s*/\\mathscr{\1}/ge
  silent '<,'>norm j
  silent '<,'>norm!==
endfunction

map! <buffer> <f1> <esc>:call ZapLatex()<cr>i
map <buffer> <f1> :call ZapLatex()<cr>

function! RemoveMT3501Macros()
  silent '<,'>s/\\A\>/\\mathscr{A}/gIe
  silent '<,'>s/\\B\>/\\mathscr{B}/gIe
  silent '<,'>s/\\\[/$$/ge
  silent '<,'>s/\\\]/$$/ge
  silent '<,'>s/\~/ /ge
  silent '<,'>s/\\e_/\\vec{e}_/ge
  silent '<,'>s/\\R\>/\\mathbb{R}/ge
  silent '<,'>s/\\pair{\([^}]*\)}{\([^}]*\)}/\\begin{pmatrix}\r \1 \\\\\r \2 \r \\end{pmatrix}/ge 
  silent '<,'>s/\\triplevec{\([^}]*\)}{\([^}]*\)}{\([^}]*\)}/\\begin{pmatrix}\r \1 \\\\\r \2 \\\\\r \3 \\\\\r \\end{pmatrix}/ge 
  silent '<,'>s/\\quadvec{\([^}]*\)}{\([^}]*\)}{\([^}]*\)}{\([^}]*\)}/\\begin{pmatrix}\r \1 \\\\\r \2 \\\\\r \3 \\\\\r \4 \\\\\r \\end{pmatrix}/ge
endfunction

map! <buffer> <F2> <ESC>:call RemoveMT3501Macros()<CR>i
map <buffer> <F2> :call RemoveMT3501Macros()<CR>
