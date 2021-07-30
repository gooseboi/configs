filetype plugin indent on " Load plugin and indent settings based on filetype
set autoindent " copy indent from previous line
set timeoutlen=300 " http://stackoverflow.com/questions/2158516/delay-before-o-opens-a-new-line
set encoding=utf-8 " Use UTF-8 encoding
set scrolloff=3 " Keep 3 lines above and below the cursor when scrolling
set sidescrolloff=7 " Keep 7 lines to both sides when scrolling
set noshowmode
set hidden " Allow unsaved buffers to be hidden
set nowrap " No line wrapping
set nojoinspaces
set colorcolumn=80
set printfont=:h10
set printencoding=utf-8
set printoptions=paper:letter

" restore last line position when opening file
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Sane splits
set splitright splitbelow

" Permanent undo
set undodir=~/.vimdid
set undofile

" Decent wildmenu
set wildmenu
set wildmode=list:longest
set wildignore=.hg,.svn,*~,*.png,*.jpg,*.gif,*.settings,Thumbs.db,*.min.js,*.swp,publish/*,intermediate/*,*.o,*.hi,Zend,vendor

" Wrapping options
set formatoptions=tc " wrap text and comments using textwidth
set formatoptions+=r " continue comments when pressing ENTER in I mode
set formatoptions+=q " enable formatting of comments with gq
set formatoptions+=n " detect lists for formatting
set formatoptions+=b " auto-wrap in insert mode, and do not wrap old long lines

" Very magic by default
nnoremap ? ?\v
nnoremap / /\v
cnoremap %s/ %sm/

" Tab settings
set shiftwidth=4
set softtabstop=4
set tabstop=4
set noexpandtab

" Proper search
set incsearch
set ignorecase smartcase
set gdefault
