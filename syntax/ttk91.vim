" Vim syntax file
" Language: ttk-91 machine language (.k91)
" Maintainer: Aaro
" Latest Revision: 28.11.2022



" comments... duh
syntax region ttkComment start=";" end="\n"

" all ttk operators
syntax keyword ttkOperators load store in out
syntax keyword ttkOperators add sub mul div mod
syntax keyword ttkOperators and or xor shl shr not shra
syntax keyword ttkOperators comp
syntax keyword ttkOperators jump jneg jzer jpos jnneg jnzer jnpos
syntax keyword ttkOperators jles jequ jgre jnles jnequ jngre
syntax keyword ttkOperators call exit push pop pushr popr
syntax keyword ttkOperators svc
syntax keyword ttkOperators nop

syntax keyword ttkSpecialOperators equ dc ds

" there should be an easier way than to copy these but i
" can't be bothered to search for it
syntax keyword ttkOperators LOAD STORE IN OUT
syntax keyword ttkOperators ADD SUB MUL DIV MOD
syntax keyword ttkOperators AND OR XOR SHL SHR NOT SHRA
syntax keyword ttkOperators COMP
syntax keyword ttkOperators JUMP JNEG JZER JPOS JNNEG JNZER JNPOS
syntax keyword ttkOperators JLES JEQU JGRE JNLES JNEQU JNGRE
syntax keyword ttkOperators CALL EXIT PUSH POP PUSHR POPR
syntax keyword ttkOperators SVC
syntax keyword ttkOperators NOP

syntax keyword ttkSpecialOperators EQU DC DS

"
"
"
" all numbers, both 1 and =1 for ex.
syntax match ttkValues "\v[=][0-9]*"
syntax match ttkNumbers "\v[0-9]"



" register names rx or Rx while 0<x<=8
syntax match ttkRegisters "\v<r[0-8]>"
syntax match ttkRegisters "\v<R[0-8]>"


" special constants for ex. kbd and sp and fp registers
syntax keyword ttkConstants sp fp
syntax keyword ttkConstants SP FP
syntax match ttkConstants "\v[=]halt|[=]kbd|[=]crt"
syntax match ttkConstants "\v[=]HALT|[=]KBD|[=]CRT"







" hl groups
highlight default link ttkComment Comment

highlight default link ttkOperators Function
highlight default link ttkSpecialOperators Constant

highlight default link ttkConstants Constant
highlight default link ttkRegisters Keyword

highlight default link ttkValues Number
highlight default link ttkNumbers Number
