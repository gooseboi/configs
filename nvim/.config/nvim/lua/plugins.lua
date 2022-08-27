local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
	-- Let packer manage itself
	use 'wbthomason/packer.nvim'

	-- Colour scheme
	use 'chriskempson/base16-vim'

	-- VIM enhancements
	use 'ciaranm/securemodelines'
	use 'editorconfig/editorconfig-vim'
	use 'tpope/vim-surround'
	use 'godlygeek/tabular'
	use 'alvan/vim-closetag'

	-- Vimwiki
	use 'vimwiki/vimwiki'

	-- GUI enhancements
	use 'vim-airline/vim-airline'
	use 'vim-airline/vim-airline-themes'
	use 'machakann/vim-highlightedyank'
	use { 'rrethy/vim-hexokinase', run = 'make hexokinase' }

	-- Fuzzy finder
	use 'airblade/vim-rooter'
	use { "nvim-telescope/telescope.nvim", requires = {'nvim-lua/plenary.nvim'} }
	use {"nvim-telescope/telescope-fzf-native.nvim", run = 'make'}

	-- Syntactic language support
	use 'cespare/vim-toml'
	use 'stephpy/vim-yaml'
	use 'plasticboy/vim-markdown'
	use 'rust-lang/rust.vim'
	use 'rhysd/vim-clang-format'

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if packer_bootstrap then
		require('packer').sync()
	end
end)
