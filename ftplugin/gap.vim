function! FixWSGAP()
  silent '<,'>s/\t/  /ge
  
  silent '<,'>s/,\(\S\)/, \1/ge
  silent '<,'>s/\([\[({]\)\s\+/\1/ge
  silent '<,'>s/\s\+\([\])}]\)/\1/ge
  silent '<,'>s/\(\S\):=/\1 :=/ge
  silent '<,'>s/=\(\S\)/= \1/ge
  silent '<,'>s/\([^ :]\)=/\1 =/ge
  silent '<,'>s/\(\S\)+/\1 +/ge
  silent '<,'>s/+\(\S\)/+ \1/ge
  silent '<,'>s/\(\S\)\*/\1 \*/ge
  silent '<,'>s/\*\(\S\)/\* \1/ge
  silent '<,'>s/\(\S\)\^/\1 \^/ge
  silent '<,'>s/\^\(\S\)/\^ \1/ge
  silent '<,'>s/\(\S\)<>/\1 <>/ge
  silent '<,'>s/<>\(\S\)/<> \1/ge
  silent '<,'>s/\(\S\)&lt;>/\1 \&lt;>/ge
  silent '<,'>s/&lt;>\(\S\)/\&lt;> \1/ge
  silent '<,'>s/\(\S\)->/\1 ->/ge
  silent '<,'>s/->\(\S\)/-> \1/ge
  silent '<,'>s/\.\.\(\S\)/\.\. \1/ge
  silent '<,'>s/\(\S\)\.\./\1 \.\./ge
  silent '<,'>s/\([^<#]\)\/\([^> ]\)/\1 \/ \2/ge
  silent '<,'>s/\([^<# ]\)\/\([^>]\)/\1 \/ \2/ge
  silent '<,'>s/\([0-9a-zA-Z]\)-/\1 -/ge
  silent '<,'>s/-\([0-9a-zA-Z]\)/- \1/ge
  silent '<,'>s/return - \(\d\)/return -\1/ge
  silent '<,'>s/\([\^=>,]\) - \(\d\)/\1 -\2/ge
  silent '<,'>s/\[- \(\d\)/\[-\1/ge
  silent '<,'>s/>\(\S\)/> \1/ge
  silent '<,'>s/\([^ -]\)>/\1 >/ge
  silent '<,'>s/<\(\S\)/< \1/ge
  silent '<,'>s/\(\S\)</\1 </ge
  silent '<,'>s/< >/<>/ge
  silent '<,'>s/> =/>=/ge
  silent '<,'>s/< =/<=/ge
  
  silent '<,'>s/^gap >/gap>/ge
  
  silent '<,'>s/,\s\{2,}/, /ge
  silent '<,'>s/=\s\{2,}/= /ge
  silent '<,'>s/\s\{2,}+/ +/ge
  silent '<,'>s/+\s\{2,}/+ /ge
  silent '<,'>s/\s\{2,}\*/ \*/ge
  silent '<,'>s/\*\s\{2,}/\* /ge
  silent '<,'>s/\s\{2,}\^/ \^/ge
  silent '<,'>s/\^\s\{2,}/\^ /ge
  silent '<,'>s/\s\{2,}->/ ->/ge
  silent '<,'>s/->\s\{2,}/-> /ge
  silent '<,'>s/\.\.\s\{2,}/\.\. /ge
  silent '<,'>s/\s\{2,}\.\./ \.\./ge
  silent '<,'>s/[^<#]\/[^> ]/ \/ \2/ge
  silent '<,'>s/[^<# ]\/[^>]/ \/ \2/ge
  silent '<,'>s/\s\{2,}-/ -/ge
  silent '<,'>s/-\s\{2,}/- /ge
  silent '<,'>s/[^^]>\s\{2,}/> /ge
  silent '<,'>s/\s\{2,}>/ >/ge
  silent '<,'>s/<\s\{2,}/< /ge
  silent '<,'>s/\s\{2,}</ </ge
  
  silent '<,'>s/\s\{2,}&lt;>/ \&lt;>/ge
  silent '<,'>s/&lt;>\s\{2,}/\&lt;> /ge

  silent '<,'>s/^\s*\n\{2,}/\r/ge
  "silent '<,'>s/then\s*\(\S\+.*\)$/then\r\1/ge
  "silent '<,'>s/;\s*\(\S\+.*\)$/;\r\1/ge
  silent '<,'>s/\([^ \t\n\r\f\v#]\)\s\{0,1}#/\1  #/ge
endfunction

function! DeleteComments()
  silent '<,'>s/#.*//ge
endfunction

map! <F1> <ESC>:call FixWSGAP()<CR>i
map <F1> :call FixWSGAP()<CR>
map! <F2> <ESC>:call DeleteComments()<CR>i
map <F2> :call DeleteComments()<CR>
