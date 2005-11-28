" AutoAlign: ftplugin support for bib
" Author:    Charles E. Campbell, Jr.
" Date:      Mar 31, 2005
" Version:   7
" ---------------------------------------------------------------------
let b:didautoalign_bib= "v7"

"  overloading '=' to keep things lined up {{{1
ino <silent> = =<ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call AutoAlign(1)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i=
let b:autoalign_reqdpat1= '^\(\s*\h\w*\(\[\d\+]\)\{0,}\(->\|\.\)\=\)\+\s*[-+*/^|%]\=='
let b:autoalign_nopat1  = '^[^=]\+$'
if !exists("g:mapleader")
 let b:autoalign_cmd1    = 'norm \t=$'
else
 let b:autoalign_cmd1    = "norm ".g:mapleader."t=$"
endif
