let mapleader = ","
" nnoremap <space> <nop>

" =============================================================================
" # PLUGINS
" =============================================================================

" Download plugin manager if not present
if ! filereadable(system('echo -n ~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Load vundle
set nocompatible
filetype off
set rtp+=~/dev/others/base16/templates/vim/

call plug#begin('~/.config/nvim/plugged')
" VIM enhancements
Plug 'ciaranm/securemodelines'
Plug 'editorconfig/editorconfig-vim'
Plug 'tpope/vim-surround'
Plug 'alvan/vim-closetag'
Plug 'lukesmithxyz/vimling'
" Vimwiki
Plug 'vimwiki/vimwiki'
" GUI enhancements
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'machakann/vim-highlightedyank'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.local/fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Semantic language support
"Plug 'neovim/nvim-lspconfig'
"Plug 'nvim-lua/lsp_extensions.nvim'
"Plug 'nvim-lua/completion-nvim'
" Syntactic language support
Plug 'cespare/vim-toml'
Plug 'stephpy/vim-yaml'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
" Colour scheme
Plug 'chriskempson/base16-vim'
call plug#end()

if has('nvim')
    set guicursor=n-v-c:block-Cursor/lCursor-blinkon0,i-ci:ver25-Cursor/lCursor,r-cr:hor20-Cursor/lCursor
    set inccommand=nosplit
end

" Latex
let g:latex_indent_enabled = 1
let g:latex_fold_envs = 0
let g:latex_fold_sections = []

source ~/.config/nvim/editor.vim
source ~/.config/nvim/bindings.vim
source ~/.config/nvim/gui.vim
source ~/.config/nvim/colours.vim
