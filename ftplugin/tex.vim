" let b:ale_linters = [ 'proselint' ]

augroup VimTeX
  autocmd!
  autocmd BufReadPre /path/to/project/*.tex
        \ let b:vimtex_main = '/path/to/project/main.tex'
augroup END

nnoremap j gj
nnoremap k gk

set wrap
set linebreak
" set spell
