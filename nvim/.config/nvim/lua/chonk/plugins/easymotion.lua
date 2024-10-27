return {
	"easymotion/vim-easymotion",
	config = function()
		local kset = vim.keymap.set
		kset('n', '<C-f>', '<Plug>(easymotion-overwin-w)', { noremap = true, silent = true })
		kset('', '<leader>unused', '<Plug>(easymotion-prefix)')
		kset('', '<leader><leader>', '<C-^>') -- Easymotion resets this
	end
}
