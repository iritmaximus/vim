" Vimrc setup


nnoremap <SPACE> <Nop>        " make sure space is not mapped to something else
let mapleader = "\<SPACE>"    " leader key mapped to space

set nocompatible              " needs to be on for reasons

syntax on                     " syntax highlighting
filetype plugin on            " idunno plugins work

set timeoutlen=1000 ttimeoutlen=10  " disables esc wait time
set updatetime=750                  " sets how often vim updates ex. plugins

set fileformat=unix           " linebreaks to unix?
set encoding=UTF-8            " propably dont have to do this but ok

if has("nvim")
  set clipboard+=unnamedplus  " uses system clipboard
else
  set clipboard=unnamedplus   " not sure if this has to be different, dont bother to test
endif


" different tab lengths for different filetypes
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |

au BufNewFile,BufRead *.ts
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2 |

set tabstop=2             " tablength?
set softtabstop=2         " not completely sure xd
set shiftwidth=2          " also not sure
set autoindent            " automatically indents, duh...
set smartindent           " knows how to live with if and such (?)
set smarttab              " lol
set expandtab             " no idea

set nowrap                " no linewrapping if lines go over the border
set list                  " absolutely no clue

" hidden characters
set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<

" set cursorline          " horisontal line where the cursor is
" set cursorcolumn        " vertical cursorline

set number                " set line numbers
set relativenumber        " set relative line numbers
set scrolloff=10          " screen rolls x amount of lines before
set signcolumn=auto       " shows the column on the left if there is something
" to show

set showcmd               " lol not this one either
" set noshowmode            " shows which mode you are in
set conceallevel=0        " does not 'conceal' for ex. quotations in json

set noerrorbells visualbell t_vb= " disables noises

set ignorecase            " search is not case sensitive if all lower
set smartcase             " if you include upper, then it is case sensitive

set incsearch             " suggest autocomplete's smartly???
set hlsearch              " highlights everything searched


" Reference chart of values:
"   Ps = 0  -> blinking block.
"   Ps = 1  -> blinking block (default).
"   Ps = 2  -> steady block.
"   Ps = 3  -> blinking underline.
"   Ps = 4  -> steady underline.
"   Ps = 5  -> blinking bar (xterm).
"   Ps = 6  -> steady bar (xterm).
" let &t_SI = "\e[6 q"
" let &t_EI = "\e[2 q"



" SOURCING

" so ~/.vim/autoclose.vim         " bracket pairing
" so ~/.vim/plugin/setcolors.vim  " for switching the colorthemes

set mouse=a                 " mouse support




" KEYBINDS
nnoremap <CR> :noh<CR><CR>:<backspace>



" PLUGINS

call plug#begin('~/.vim/plugged')

Plug 'dylanaraps/wal.vim'           " nice changing colors
Plug 'tpope/vim-fugitive'           " shows line's git status in signcolumn

Plug 'NLKNguyen/papercolor-theme'   " some nice colorscheme

call plug#end()


" PLUGIN THINGS


colorscheme PaperColor                      " for the nice colors
set background=dark




" COOL PLUGINLESS STUFF
set path+=**                  " tab completion for file related things

set wildmenu                  " cool tab menu

" NOW WE CAN:
" - Hit tab to :find by partial match
" - Use * to make it fuzzy

" THINGS TO CONSIDER:
" - :b lets you autocomplete any open buffer


command! MakeTags !ctags -R .  " command to create the 'tags'

" NOW WE CAN:
" - Use ^] to jump to tag under cursor
" - Use g^] for ambiguous tags
" - Use ^t to jump back up the tag stack

" AUTOCOMPLETE:

" The good stuff is documented in |ins-completion|

" HIGHLIGHTS:
" - ^x^n for JUST this file
" - ^x^f for filenames (works with our path trick!)
" - ^x^] for tags only
" - ^n for anything specified by the 'complete' option

" NOW WE CAN:
" - Use ^n and ^p to go back and forth in the suggestion list



" FILE BROWSING:
" Tweaks for browsing
let g:netrw_banner=0        " disable annoying banner
let g:netrw_browse_split=4  " open in prior window
let g:netrw_altv=1          " open splits to the right
let g:netrw_liststyle=3     " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s\)\zs\.\S\+'

" NOW WE CAN:
" - :edit a folder to open a file browser
" - <CR>/v/t to open in an h-split/v-split/tab
" - check |netrw-browse-maps| for more mappings


" SNIPPETS:
" Read an empty HTML template and move cursor to title
" nnoremap ,html :-1read $HOME/.vim/.skeleton.html<CR>3jwf>a

" NOW WE CAN:
" - Take over the world!
"   (with much fewer keystrokes)


