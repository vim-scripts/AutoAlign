" AutoAlign: ftplugin support for LaTeX
" Author:    Charles E. Campbell, Jr.
" Date:      Mar 31, 2005
" Version:   7
" ---------------------------------------------------------------------
let b:didautoalign_tex = "v7"

"  overloading '=' to keep things lined up {{{1
ino <silent> \\ \\<ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call AutoAlign(1)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i\
let b:autoalign_reqdpat1 = '^\([^&]*&\)\+[^&]*\\\{2}'
let b:autoalign_notpat1  = '^.*\(\\\\\)\@<!$\&^.'
if !exists("g:mapleader")
 let b:autoalign_cmd1     = 'norm \tt$'
else
 let b:autoalign_cmd1     = "norm ".g:mapleader."tt$"
endif
