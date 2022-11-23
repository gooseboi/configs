local set_keymap = vim.api.nvim_set_keymap

-- Set leader
set_keymap('', '<Space>', '<Nop>', {noremap = true, silent = true,})
vim.g.mapleader = ","
vim.g.maplocalleader = ","

-- Change and delete do not change clipboard
set_keymap('n', 'x', '\"_x', {noremap = true, silent = true,})
set_keymap('n', 'X', '\"_X', {noremap = true, silent = true,})
set_keymap('n', 'c', '\"_c', {noremap = true, silent = true,})

-- Search results centered in the window
set_keymap('n', 'n', 'nzz', {noremap = true, silent = true,})
set_keymap('n', 'N', 'Nzz', {noremap = true, silent = true,})
set_keymap('n', '*', '*zz', {noremap = true, silent = true,})
set_keymap('n', '#', '#zz', {noremap = true, silent = true,})
set_keymap('n', 'g*', 'g*zz', {noremap = true, silent = true,})

-- Use ; as :
set_keymap('n', ';', ':', {noremap = true, silent = true,})

-- Stop highlighting search
set_keymap('v', '<C-h>', '<cmd>nohlsearch<CR>', {noremap = true, silent = true,})
set_keymap('n', '<C-h>', '<cmd>nohlsearch<CR>', {noremap = true, silent = true,})

-- Jump to start and end of line using the home row keys
set_keymap('', 'H', '^', {})
set_keymap('', 'L', '$', {})

-- Managing splits
set_keymap('n', '<leader>ca', '<C-w>v<CR>', {})
set_keymap('n', '<leader>cs', '<C-w>s<CR>', {})
set_keymap('n', '<leader>cq', '<C-w>q<CR>', {})
set_keymap('n', '<leader>h',  '<C-w>h<CR>', {})
set_keymap('n', '<leader>l',  '<C-w>l<CR>', {})
set_keymap('n', '<leader>j',  '<C-w>j<CR>', {})
set_keymap('n', '<leader>k',  '<C-w>k<CR>', {})
set_keymap('n', '<leader>cc', '<cmd>w \\| %bd \\| e#<CR>', {})

-- System clipboard integration
set_keymap('', '<leader>p', '\"+p<CR>', {noremap = true})
set_keymap('', '<leader>c', '\"+y<CR>', {noremap = true})

-- No arrow keys, force yourself to use the home row
set_keymap('n', '<up>',    '<nop>', {noremap = true})
set_keymap('n', '<down>',  '<nop>', {noremap = true})
set_keymap('i', '<up>',    '<nop>', {noremap = true})
set_keymap('i', '<down>',  '<nop>', {noremap = true})
set_keymap('i', '<left>',  '<nop>', {noremap = true})
set_keymap('i', '<right>', '<nop>', {noremap = true})


-- Left and right arrow keys switch buffers
set_keymap('n', '<left>',  '<cmd>bp<CR>', {noremap = true})
set_keymap('n', '<right>', '<cmd>bn<CR>', {noremap = true})

-- Switch between current buffer and last used buffer
set_keymap('n', '<leader><leader>', '<C-^>', {noremap = true})

-- Move by visual line, not by actual line
set_keymap('n', 'j', 'gj', {noremap = true})
set_keymap('n', 'k', 'gk', {noremap = true})

-- Bindings for quick movement
set_keymap('n', 'J', '10j', {noremap = true})
set_keymap('n', 'K', '10k', {noremap = true})

-- Swap lines
set_keymap('n', '<C-j>', '<cmd>m .+1<CR>==', {noremap = true})
set_keymap('n', '<C-k>', '<cmd>m .-2<CR>==', {noremap = true})

-- Replace up to next _
set_keymap('n', '<leader>m', 'ct_', {noremap = true})

-- Very magic by default
set_keymap('n', '?', '?\\v', {noremap = true})
set_keymap('n', '/', '/\\v', {noremap = true})
set_keymap('c', '%s/', '%sm/', {noremap = true})

-- I can type :help on my own, thanks
set_keymap('', '<F1>', '<Esc>', {})
set_keymap('i', '<F1>', '<Esc>', {})

-- Easymotion
set_keymap('', '<leader>f', '<Plug>(easymotion-overwin-w)', {})
