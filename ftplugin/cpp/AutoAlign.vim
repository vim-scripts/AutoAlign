" AutoAlign: ftplugin support for C++
" Author:    Charles E. Campbell, Jr.
" Date:      Jan 25, 2005
" Version:	6	NOT RELEASED
" ---------------------------------------------------------------------
let b:didautoalign_cpp= "v6"

"  overloading '=' to keep things lined up {{{1
ino <silent> = =<ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call <sid>AutoAlign(1)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i=
let b:autoalign_reqdpat1 = '^\(\s*\h\w*\(\[\d\+]\)\{0,}\(->\|\.\)\=\)\+\s*[-+*/^|%]\=='
let b:autoalign_notpat1  = '^[^=]\+$'
let b:autoalign_cmd1     = "norm ".g:mapleader."t=$"

"  overloading '<<' to keep things lined up {{{1
ino <silent> < <<ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call <sid>AutoAlign(2)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i<
let b:autoalign_reqdpat2 = '<<'
let b:autoalign_notpat2  = '^\%(\%(<<\)\@!.\)*$'
let b:autoalign_cmd2     = "norm ".g:mapleader."a<$"

"  overloading '>>' to keep things lined up {{{1
ino <silent> > ><ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call <sid>AutoAlign(3)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i>
let b:autoalign_reqdpat3 = '>>'
let b:autoalign_notpat3  = '^\%(\%(>>\)\@!.\)*$'
let b:autoalign_cmd3     = "norm ".g:mapleader."a<$"

