" Make external commands work through a pipe instead of a pseudo-tty
"set noguipty

set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
" Git plugin not hosted on GitHub
" Plugin 'wincent/command-t'
Plugin 'kien/ctrlp.vim'
Plugin 'elzr/vim-json'
Plugin 'vim-multiple-cursors'
call vundle#end()            " required
filetype plugin indent on    " required
" set the X11 font to use
" set guifont=-adobe-courier-bold-r-normal--20-140-100-100-m-110-iso8859-1
" set guifont=-misc-fixed-medium-r-normal--14-130-75-75-c-70-iso8859-1
" Highly recommended to set tab keys to 4 spaces
set tabstop=4
set shiftwidth=4
set expandtab
set smarttab
set wrapscan
set autoindent
set hlsearch
set mousehide
"set equalprg
set showmode
set showcmd
set showmatch
set wildmenu
set ruler
set number

:set vb t_vb=

set guifont=Monaco:h14
colorscheme torte

"java specific stuff
let java_comment_strings=1
let java_highlight_debug=1
let java_highlight_java_lang_ids=1
let java_highlight_functions="style"
let java_minlines = 50 


" Make command line two lines high
set ch=2

" I like highlighting strings inside C comments
let c_comment_strings=1

" Switch on syntax highlighting.
syntax on


" Set nice colors
" background for normal text is light grey
" Text below the last line is darker grey
  " Cursor is green
  " Constants are not underlined but have a slightly lighter background
"  highlight Normal guibg=grey10 guifg=grey95
  highlight Cursor guibg=Green guifg=NONE
"  highlight NonText guibg=grey80
"  highlight Constant gui=NONE
" guibg=grey50
"  highlight Special gui=NONE
" guibg=grey95

"This unsets the "last search pattern" register by hitting return
nnoremap <CR> :noh<CR><CR>

" Insert only one space when joining lines that contain sentence-terminating
" punctuation like `.`.
set nojoinspaces


"   Edit another file in the same directory as the current file
"   uses expression to extract path from current file's path
"  (thanks Douglas Potts)
if has("unix")
    map ,e :e <C-R>=expand("%:p:h") . "/" <CR>
else
    map ,e :e <C-R>=expand("%:p:h") . "\" <CR>
endif



" removed the following line from $VIM/gvimrc
"    macmenu &File.New\ Tab key=<nop>
let mapleader = ","
if has("gui_macvim")
    macmenu &File.New\ Tab key=<nop>
endif

nmap <silent> <c-n> :NERDTreeToggle<CR>
"nnoremap <silent> <Leader>t :CommandT<CR>
set runtimepath^=~/.vim/bundle/ctrlp.vim
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:multi_cursor_skip_key='<C-x>'
