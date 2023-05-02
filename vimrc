" Vimrc setup

" make sure space is not mapped to something else
nnoremap <Space> <nop>
let mapleader = "\<SPACE>"    " leader key mapped to space

set nocompatible              " needs to be on for reasons
syntax on                     " syntax highlighting
filetype plugin on            " idunno plugins work

set timeoutlen=1000 ttimeoutlen=10  " disables esc wait time
set updatetime=300                  " sets how often vim updates ex. plugins
" set fileformat=unix           " breaks vimtex?
set encoding=UTF-8            " propably dont have to do this but ok

if has("nvim")
set clipboard+=unnamedplus  " uses system clipboard
else
set clipboard=unnamedplus   " not sure if this has to be different, dont bother to test
endif

set undodir=~/.vim/undodir
set undofile
set noswapfile                  " disables swap files

" different tab lengths for different filetypes
au BufNewFile,BufRead *.py
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |

au BufNewFile,BufRead *.ts
  \ set tabstop=2 |
  \ set softtabstop=2 |
  \ set shiftwidth=2 |

au BufNewFile,BufRead *.k91
  \ set tabstop=4 |
  \ set softtabstop=4 |
  \ set shiftwidth=4 |



set tabstop=2             " tablength?
set softtabstop=2         " not completely sure xd
set shiftwidth=2          " also not sure
set autoindent            " automatically indents, duh...
set smartindent           " knows how to live with if and such (?)
set smarttab              " lol
set expandtab             " no idea

set nowrap                " no linewrapping if lines go over the border
set textwidth=0           " disables line hard wrapping
set list                  " absolutely no clue

" hidden characters
set listchars=eol:.,tab:>-,trail:~,extends:>,precedes:<

" set cursorline          " horisontal line where the cursor is
" set cursorcolumn        " vertical cursorline

set number                " set line numbers
set relativenumber        " set relative line numbers
set scrolloff=0           " screen rolls x amount of lines before
set signcolumn=auto       " shows the column on the left if there is something to show

set showcmd               " lol not this one either
" set noshowmode            " shows which mode you are in
set conceallevel=0        " does not 'conceal' for ex. quotations in json
set noerrorbells visualbell t_vb= " disables noises
set concealcursor=""

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
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"


set mouse=a                 " mouse support
set t_Co=256                " 256 color support


autocmd BufEnter * lcd %:p:h  " set vim dir to where vim was opened
autocmd VimEnter * if !argc() | Explore | endif " opens explorer if only vim was called

function! SynGroup()
    let l:s = synID(line('.'), col('.'), 1)
    echo synIDattr(l:s, 'name') . ' -> ' . synIDattr(synIDtrans(l:s), 'name')
endfun   (with much fewer keystrokes)



" SOURCING

so ~/.vim/autoclose.vim         " bracket pairing
" so ~/.vim/plugin/setcolors.vim  " for switching the colorthemes



" KEYBINDS
nnoremap <CR> :noh<CR><CR>:<backspace>
nnoremap <Leader>ss :so ~/.vim/vimrc<CR>
nnoremap <Leader>e :edit .<CR>
nnoremap <Leader>n :tabnew<CR>
" nnoremap <Leader>lb :set linebreak<CR>
" nnoremap <Leader>lnb :set nolinebreak<CR>

nnoremap <Leader>v :vsplit<CR>

nnoremap <Leader>h <C-w>h
nnoremap <Leader>l <C-w>l
nnoremap <Leader>j <C-w>j
nnoremap <Leader>k <C-w>k

" nnoremap <Leader>hh :HardTimeToggle<CR>
" nnoremap <Leader>H :HardTimeOff<CR>

nnoremap <Leader>ad :ALEDetail<CR>

nnoremap <Leader>rs :call UltiSnips#RefreshSnippets()<CR>

" nnoremap <Leader>ll <plug>(vimtex-compile)
" nnoremap <Leader>le <plug>(vimtex-errors)

" sets current directory as project root???
nnoremap <Leader>ch :call SynGroup()<CR>

nnoremap <Leader>gt :Goyo<CR>
nnoremap <Leader>go :Goyo!<CR>

nnoremap <Leader>sw :w !sudo tee %<CR>

" PLUGINS

call plug#begin('~/.vim/plugged')

Plug 'tpope/vim-fugitive'           " implements git commands in vim
Plug 'airblade/vim-gitgutter'       " git diffs in signcolumn

Plug 'NLKNguyen/papercolor-theme'   " some nice colorscheme
Plug 'ghifarit53/tokyonight-vim'
Plug 'frankier/neovim-colors-solarized-truecolor-only'

Plug 'dense-analysis/ale'           " linting and syntax checking
Plug 'mattn/emmet-vim'              " html tag managing

Plug 'tpope/vim-commentary'         " comments lines
Plug 'somini/vim-autoclose'         " closes brackets smartly
Plug 'Yggdroot/indentLine'          " shows | on different indenting levels
Plug 'SirVer/ultisnips'           " nice snippets
Plug 'mg979/vim-visual-multi'
Plug 'junegunn/goyo.vim'          " for presentations :D

Plug 'leafgarland/typescript-vim'   " typescript syntax highlighting
Plug 'maxmellon/vim-jsx-pretty'     " jsx aka react syntax highlighting
Plug 'lervag/vimtex'                " latex support
Plug 'hdima/python-syntax'          " python support

Plug 'takac/vim-hardtime'           " disables repeated use of hjkl

call plug#end()



" color themes
set termguicolors

if has("termguicolors")
  set termguicolors
  if &t_8f == ''
    " The first characters after the equals sign are literal escape characters.
    set t_8f=[38;2;%lu;%lu;%lum
    set t_8b=[48;2;%lu;%lu;%lum
  endif
endif

let g:solarized_termcolors=256
" let g:solarized_visibility="normal"
" let g:solarized_underline=0
" let g:solarized_termtrans=1
set background=dark                       " dark or light theme
colorscheme solarized


let python_highlight_all=1

" PLUGIN THINGS


" indentLine
let g:indentLine_setColors = 0
let g:indentLine_char_list = ['|', '¦', '┆', '┊'] " what chars are used to show indention xd
let g:indentLine_color_term = 239                 " set the iL color to gray


" ale
" alehover
augroup ale_hover_cursor
  autocmd!
  autocmd CursorHold * ALEHover
augroup END

let g:ale_hover_to_floating_preview = 1     " not sure if this helps
let g:ale_hover_cursor = 1      " enables ale to show things on hover
let g:ale_set_balloons = 1      " enables ale to use hover 'balloons' aka preview window

let g:ale_floating_window_border = ['│', '─', '╭', '╮', '╯', '╰', '│', '─']

let g:ale_fix_on_save = 1                       " ale triggers fixer on file save
let g:ale_sign_column_always = 1                " shows char in the signcolumn
let g:ale_echo_msg_error_str = 'E'              " error char
let g:ale_echo_msg_warning_str = 'W'            " error char
let g:ale_echo_msg_info_str = 'I'               " info char
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'    " message format
let g:ale_linters_explicit = 1                  " run only linters i specify

let g:ale_fixers = {
\  "*": [ "remove_trailing_lines", "trim_whitespace" ]
\}

let g:ale_lint_on_save = 1


" vim hard mode

let g:hardtime_default_on = 0


" ultisnippsss
let g:UltiSnipsExpandTrigger = '<tab>'
let g:UltiSnipsJumpForwardTrigger = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'

let g:UltiSnipsSnippetDirectories=[ "snips" ]


" vimtex
let g:tex_flavor='latex'
let g:vimtex_view_method='zathura'
let g:vimtex_quickfix_mode=0
set conceallevel=0
" let g:tex_conceal='abdmg'
let g:vimtex_syntax_conceal_disable = 1


" CTRLP
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

" 'a' - the directory of the current file, unless it is a subdirectory of the cwd
" 'r' - the nearest ancestor of the current file that contains one of these directories or files: .git .hg .svn .bzr _darcs
let g:ctrlp_working_path_mode = 'ra'

" If none of the default markers (.git .hg .svn .bzr _darcs) are present in a project,
" you can define additional ones with g:ctrlp_root_markers:
" let g:ctrlp_root_markers = ['pom.xml', '.p4ignore']

" set wildignore+=/node_modules/*
let g:ctrlp_custom_ignore = { 'dir': '\v(__pycache__|venv|build|node_modules|target)$' }


" interferes with better movement
let g:gitgutter_map_keys = 0



" EMMET
let g:user_emmet_leader_key='<C-Z>'


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
let g:netrw_browse_split=0  " open in prior window
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
