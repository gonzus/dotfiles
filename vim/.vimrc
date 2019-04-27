" do not be compatible with original VI
set nocompatible

" manage our plugins with Plug
call plug#begin('~/.vim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' } " tree browser
Plug 'ziglang/zig.vim', { 'for': 'zig' }                " ziglang support
Plug 'nanotech/jellybeans.vim'                          " color scheme
Plug 'ryanoasis/vim-devicons'                           " font icons
call plug#end()

" autodetect file type
filetype plugin indent on

set viminfo=%,'1000,/1000,:1000,n$HOME/.vim/viminfo
"           | |     |     |     +: viminfo file path inside VIM directory
"           | |     |     + command-line history saved
"           | |     + search history saved
"           | + file marks saved
"           + save / restore buffer list

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
set ttyfast                       " we have a fast tty, just use it
set encoding=UTF8                 " use UTF8 everywhere!

" when shifting a block around, keep the selection
vmap < <gv
vmap > >gv

set path+=**                      " search files recursively (tab completion!)
set wildmenu                      " display matched files with tab
set clipboard=unnamed             " make vim use same clipboard as system; not working?

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

set incsearch                     " search as characters are entered
set hlsearch                      " highlight matches

colorscheme jellybeans            " is it nice?
set bg=dark                       " dark background

highlight StatusLine cterm=NONE ctermbg=59 ctermfg=252

" show current line with a dark grey highlight
set cursorline
highlight CursorLine cterm=NONE ctermbg=237 ctermfg=NONE

" we could use a full vertical line character to split windows:
" set fillchars+=vert:│
" hi VertSplit cterm=NONE ctermbg=NONE guibg=NONE
" but that makes them too similar to tmux windows, so instead
" we use a white empty space, just like the status line:
set fillchars+=vert:\  " need this comment for that trailing space
highlight VertSplit cterm=NONE ctermbg=59 ctermfg=252

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

" for zig files, run zigmft on save
let g:zig_fmt_autosave = 1

" show hidden files in NERDTree (toggle with I)
let NERDTreeShowHidden=1
