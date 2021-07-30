" Quick-save
nmap <leader>w :w<CR>
nmap <leader>q :q<CR>

" Change and delete do not change clipboard
nnoremap x "_x
nnoremap X "_X
nnoremap c "_c

" Search results centered please
nnoremap <silent> n nzz
nnoremap <silent> N Nzz
nnoremap <silent> * *zz
nnoremap <silent> # #zz
nnoremap <silent> g* g*zz

" ; as :
nnoremap ; :

" Stop searching
vnoremap <C-h> :nohlsearch<cr>
nnoremap <C-h> :nohlsearch<cr>

" Jump to start and end of line using the home row keys
map H ^
map L $

" Bindings to manage splits
nmap <leader>ca <c-w>v<CR>
nmap <leader>cq <c-w>q<CR>
nmap <leader>cc :w \| %bd \| e#<CR>

" Neat X clipboard integration
" <leader>p will paste clipboard into buffer
" <leader>c will copy entire buffer into clipboard
noremap <leader>p :read !xsel --clipboard --output<cr>
noremap <leader>c :w !xsel -ib<cr><cr>

" No arrow keys --- force yourself to use the home row
nnoremap <up> <nop>
nnoremap <down> <nop>
inoremap <up> <nop>
inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>

" Left and right switch buffers
nnoremap <left> :bp<CR>
nnoremap <right> :bn<CR>

" Move by line
nnoremap j gj
nnoremap k gk

" Bindings for quick movement
nnoremap J 10j
nnoremap K 10k

" Move line mappings
nnoremap <c-j> :m .+1<CR>==
nnoremap <c-k> :m .-2<CR>==

" Keymap for replacing up to next _ or -
noremap <leader>m ct_

" I can type :help on my own, thanks.
map <F1> <Esc>
imap <F1> <Esc>

