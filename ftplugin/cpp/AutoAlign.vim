" AutoAlign: ftplugin support for C++
" Author:    Charles E. Campbell, Jr.
" Date:      May 06, 2005
" Version:   8a	ASTRO-ONLY
" ---------------------------------------------------------------------
let b:didautoalign_cpp= "v8a"

"  overloading '=' to keep things lined up {{{1
ino <silent> = =<ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call AutoAlign(1)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i=
let b:autoalign_reqdpat1 = '^\(\s*\h\w*\(\[\d\+]\)\{0,}\(->\|\.\)\=\)\+\s*[-+*/^|%]\=='
let b:autoalign_notpat1  = '^[^=]\+$'
if !exists("g:mapleader")
 let b:autoalign_cmd1     = 'norm \t=$'
else
 let b:autoalign_cmd1     = "norm ".g:mapleader."t=$"
endif

"  overloading '<<' to keep things lined up {{{1
ino <silent> < <<ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call AutoAlign(2)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i<
let b:autoalign_reqdpat2 = '<<'
let b:autoalign_notpat2  = '^\%(\%(<<\)\@!.\)*$'
if !exists("g:mapleader")
 let b:autoalign_cmd2     = 'norm \a<$'
else
 let b:autoalign_cmd2     = "norm ".g:mapleader."a<$"
endif

"  overloading '>>' to keep things lined up {{{1
ino <silent> > ><ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call AutoAlign(3)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i>
let b:autoalign_reqdpat3 = '>>'
let b:autoalign_notpat3  = '^\%(\%(>>\)\@!.\)*$'
if !exists("g:mapleader")
 let b:autoalign_cmd3     = 'norm \a<$'
else
 let b:autoalign_cmd3     = "norm ".g:mapleader."a<$"
endif
