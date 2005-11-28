" AutoAlign: ftplugin support for HTML
" Author:    Charles E. Campbell, Jr.
" Date:      Mar 31, 2005
" Version:   7
" ---------------------------------------------------------------------
let b:didautoalign_html= "v7"

"  overloading '=' to keep things lined up {{{1
ino <silent> > ><ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call AutoAlign(-1)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i>
let b:autoalign_reqdpat1 = '</[tT][rR]>$'
let b:autoalign_notpat1  = '\%(</[tT][rR]>\)\@!.\{5}$'
let b:autoalign_suspend1 = '\c</\=table>'
if !exists("g:mapleader")
 let b:autoalign_cmd1     = 'norm \Htd$'
else
 let b:autoalign_cmd1     = "norm ".g:mapleader."\Htd$"
endif
