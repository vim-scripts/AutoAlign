" AutoAlign: ftplugin support for Maple
" Author:    Charles E. Campbell, Jr.
" Date:      Jan 25, 2005
" Version:	6	NOT RELEASED
" ---------------------------------------------------------------------
let b:didautoalign_maple = "v6"

"  overloading '=' to keep things lined up {{{1
ino <silent> = =<ESC>:let b:autoalign_vekeep=&ve<bar>let &ve=""<bar>silent call AutoAlign(1)<bar>let &ve=b:autoalign_vekeep<bar>norm! x<cr>i=
let b:autoalign_reqdpat1 = ':='
let b:autoalign_notpat1  = '^\%(\%(:=\)\@!.\)*$'
let b:autoalign_cmd1     = "norm ".g:mapleader."a=$"

