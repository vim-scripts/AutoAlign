" AutoAlign: ftplugin support for C
" Author:    Charles E. Campbell, Jr.
" Date:      Mar 23, 2006
" Version:   11	ASTRO-ONLY
" ---------------------------------------------------------------------
let b:loaded_autoalign_c= "v11"

"  overloading '=' to keep things lined up {{{1
ino <silent> = =<c-o>:silent call AutoAlign(1)<cr>
let b:autoalign_reqdpat1 = '^\(\s*\*\{0,}\h\w*\%(\[\%(\d\+\|\h\w*\)]\)\{0,}\%(->\|\.\)\=\)\+\s*[-+*/^|%]\=='
let b:autoalign_notpat1  = '^[^=]\+$'
if !exists("g:mapleader")
 let b:autoalign_cmd1     = 'norm \t=$'
else
 let b:autoalign_cmd1     = "norm ".g:mapleader."t=$"
endif
