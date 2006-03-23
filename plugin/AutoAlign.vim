" AutoAlign.vim: a ftplugin for C
" Author:	Charles E. Campbell, Jr.  <NdrOchip@ScampbellPfamily.AbizM>-NOSPAM
" Date:		Mar 23, 2006
" Version:	10
" GetLatestVimScripts: 884  1 :AutoInstall: AutoAlign.vim
" GetLatestVimScripts: 294  1 :AutoInstall: Align.vim
" GetLatestVimScripts: 1066 1 :AutoInstall: cecutil.vim
" ---------------------------------------------------------------------
"  Load Once: {{{1
if exists("b:didautoalign")
 finish
endif
let b:loaded_autoalign = "v10"
let s:keepcpo      = &cpo
set cpo&vim

" ---------------------------------------------------------------------
"  Support Plugin Loading: {{{1
" insure that cecutil's SaveWinPosn/RestoreWinPosn has been loaded
if !exists("*SaveWinPosn")
 silent! runtime plugin/cecutil.vim
endif

" Debugging support: debugging output goes to g:dechovar
"if !exists("*Decho")                  " Decho
" silent! runtime plugin/Decho.vim     " Decho
"endif                                 " Decho
"DechoVarOn

" ---------------------------------------------------------------------
" Public Interface: AA toggles AutoAlign {{{1
com! -nargs=0 AA let b:autoalign= exists("b:autoalign")? !b:autoalign : 0|echo "AutoAlign is ".(b:autoalign? "on" : "off")

" ---------------------------------------------------------------------
"  AutoAlign: decides when to use Align/AlignMap {{{1
fun! AutoAlign(i)
"  call Dfunc("AutoAlign(i=".a:i.")")

  " AutoAlign uses b:autoalign_reqdpat{|i|} and b:autoalign_notpat{|i|}
  " A negative a:i means that a trigger character has been encountered,
  " but not to AutoAlign if the reqdpat isn't present.
  let i= (a:i < 0)? -a:i : a:i
  if exists("b:autoalign") && b:autoalign == 0
"   call Dret("AutoAlign")
   return
  endif

  " sanity check: must have a reqdpat
  if !exists("b:autoalign_reqdpat{i}")
"   call Dret("AutoAlign")
   return
  endif
"  call Decho("match(<".getline(".").">,reqdpat<".b:autoalign_reqdpat{i}.">) = ".match(getline("."),b:autoalign_reqdpat{i}))

  " set up some options for AutoAlign
  let lzkeep= &lz
  let vekeep= &ve
  set lz ve=all

  if match(getline("."),b:autoalign_reqdpat{i}) >= 0
   let curline   = line(".")
   if v:version >= 700
    let curposn   = SaveWinPosn(0)
    let nopatline = search(b:autoalign_notpat{i},'bW')
    call RestoreWinPosn(curposn)
   else
    let nopatline = search(b:autoalign_notpat{i},'bWn')
   endif
   let atend= col(".") >= col("$") - 1

"   call Decho("nopatline=".nopatline." (using autoalign_notpat<".b:autoalign_notpat{i}.">)")
"   call Decho("b:autoalign (".(exists("b:autoalign")? "exists" : "doesn't exist").")")
"   call Decho("line('a)=".line("'a")." b:autoalign=".(exists("b:autoalign")? b:autoalign : -1)." curline=".curline." nopatline=".nopatline." atend=".atend)

   if exists("b:autoalign") && line("'a") == b:autoalign && b:autoalign < curline && nopatline < line("'a")
"    call Decho("autoalign multi")
"	call Decho("atend=".atend)
    exe "norm! i\<c-g>u\<esc>"
    exe b:autoalign_cmd{i}
    if !atend
     norm! h
    endif
   else
    let b:autoalign= line(".")
    ka
"	call Decho("autoalign start")
   endif

  elseif exists("b:autoalign")
   " trigger character encountered, but reqdpat not present
   if a:i > 0
    unlet b:autoalign
"    call Decho("autoalign suspend")
   endif
  elseif exists("b:autoalign_suspend{i}")
   " trigger character encounted, but reqdpat not present, but takes more than
   " one trigger
   if match(getline("."),b:autoalign_suspend{i}) >= 0
    unlet b:autoalign
"    call Decho("autoalign suspend: matches autoalign_suspend<".b:autoalign_suspend{i}.">")
   endif
  endif

  let &ve= vekeep
  let &lz= lzkeep
  if atend
"   call Decho("using startinsert!: atend=".atend)
   startinsert!
  else
"   call Decho("using startinsert: atend=".atend)
   startinsert
  endif

"  call Dret("AutoAlign")
endfun

let &cpo= s:keepcpo
unlet s:keepcpo
" ---------------------------------------------------------------------
" vim: ts=4 fdm=marker
