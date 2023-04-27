local fn = vim.fn
local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
	packer_bootstrap = fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
	vim.cmd [[packadd packer.nvim]]
end

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Colorscheme
	use 'chriskempson/base16-vim'

	-- Vim enhancements
	use 'tpope/vim-surround'
	use 'godlygeek/tabular'
	use 'easymotion/vim-easymotion'
	use 'alvan/vim-closetag'
	use 'editorconfig/editorconfig-vim'
	use {
		'ThePrimeagen/harpoon',
		requires = {'nvim-lua/plenary.nvim'},
	}

	use 'NoahTheDuke/vim-just'

	use 'vimwiki/vimwiki'

	use 'lervag/vimtex'

	-- Fuzzy finder
	use {
		'nvim-telescope/telescope.nvim',
		requires = { {'nvim-lua/plenary.nvim'},
					 {'nvim-telescope/telescope-fzf-native.nvim', run = 'make'}
				   }
	}
end)
