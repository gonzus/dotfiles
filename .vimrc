" these settings are required and must go BEFORE loading Vundle
set nocompatible              " be iMproved, required
filetype off                  " required


" ==  Vundle -- this must go here, let it be!  vvvvvvvvvvvv  ================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" other plugins go here
Plugin 'scrooloose/nerdTree'      " tree browser, awesome (see f4 below)
" Plugin 'vim-airline/vim-airline'
" Plugin 'leafgarland/typescript-vim'
" Plugin 'elzr/vim-json'
" Plugin 'octol/vim-cpp-enhanced-highlight'
" Bundle 'majutsushi/tagbar'
" Bundle 'geoffharcourt/vim-matchit'

" All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" ==  Vundle -- this must go here, let it be!  ^^^^^^^^^^^^  ================


" set mouse; possible values are:
"   n: only to move current position around
"   v: only for visual mode
"   i: only for insert mode
"   c: only for command line mode
"   h: all of the above, when editing help file
"   a: all previous modes -- USE OPTION-MOUSE FOR XTERM BEHAVIOR
"   r: for |hit-enter| and |more-prompt| prompt ???
set mouse=a                       " use a mouse for all modes
set ttymouse=xterm2               " use this terminal type when handling mouse

set expandtab                     " tab => spaces, num of spaces set in tabstop
set shiftwidth=4                  " number of spaces to use for autoindenting
set tabstop=4                     " a tab is four spaces
set smarttab                      " insert tabs at the start of a line

set matchpairs+=<:>               " add <> to matched parenthesis
set ai                            " set auto-indent mode
set list                          " show invisible characters
set listchars=tab:>·,trail:·      " but only show tabs and trailing whitespace
set number                        " enable line numbers
set numberwidth=3                 " line number width
syntax on                         " Syntax highlighting

set laststatus=2                  " display the status line always
set statusline=                   " clear status line, to build it ourselves:
set statusline+=%f                "   filename
set statusline+=%=                "   left side / right side separator
set statusline+=%m                "   modified flag
set statusline+=%r                "   readonly flag
set statusline+=%y                "   filetype
set statusline+=\ [%l/%L:%c]      "   cursor line/total lines,column
set statusline+=\ %B              "   character under cursor in hex
set statusline+=\ %P              "   percent through file

set cursorline		              " underline current line
set colorcolumn=80	              " show right margin

set incsearch                     " search as characters are entered
set hlsearch                      " highlight matches

colorscheme slate                 " is it nice?
set bg=dark                       " dark background

" Set f2 to toggle line numbers
nmap <f2> :set number! number?<cr>

" Set f3 to toggle showing invisible characters
nmap <f3> :set list! list?<cr>

" Set f4 to call NERD tree
nmap <f4> :NERDTreeToggle<CR>

" paste mode - this will avoid unexpected effects when you
" cut or copy some text from one window and paste it in Vim.
set pastetoggle=<f5>

" This unsets the 'last search pattern' register by hitting Ctrl-L
nnoremap <C-L> :nohlsearch<CR><C-L>

" these can only be done when autocmd is loaded:
if has("autocmd")
  " have Vim jump to the last position when reopening a file
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif

  " strip trailing whitespace on save
  au BufWritePre * :%s/\s\+$//e
endif
