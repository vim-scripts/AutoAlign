" AutoAlign: ftplugin support for LaTeX
" Author:    Charles E. Campbell, Jr.
" Date:      Mar 16, 2006
" Version:   10a	ASTRO-ONLY
" ---------------------------------------------------------------------
let b:didautoalign_tex = "v10a"

"  overloading '=' to keep things lined up {{{1
ino <silent> \\ \\<c-o>:silent call AutoAlign(1)<cr>
let b:autoalign_reqdpat1 = '^\([^&]*&\)\+[^&]*\\\{2}'
let b:autoalign_notpat1  = '^.*\(\\\\\)\@<!$\&^.'
if !exists("g:mapleader")
 let b:autoalign_cmd1     = 'norm \tt$'
else
 let b:autoalign_cmd1     = "norm ".g:mapleader."tt$"
endif
