-- Key Mapping
-- ''  -> :map
-- 'n' -> :nmap
-- 'v' -> :vmap
-- Key mapping Configuration

local conf = {
	expr = true,
	noremap = true,
	silent = false
}
local standard = {
	noremap = true,
	silent = true
}

-- NVIM Tree
vim.api.nvim_set_keymap('n', '<Leader>n', ':NvimTreeFocus<CR>', standard)
vim.api.nvim_set_keymap('n', '<C-t>', ':NvimTreeToggle<CR>', standard)

-- Cycle Tabs
vim.api.nvim_set_keymap('n', '<PageUp>', ':bnext<CR>', standard)
vim.api.nvim_set_keymap('n', '<PageDown>', ':bprevious<CR>', standard)
vim.api.nvim_set_keymap('n', '<C-c>', ':bp|bd#<CR>', standard)

-- Telescope
local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})

--LSP
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, standard)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, {noremap=true, silent=true})

-- Others
vim.api.nvim_set_keymap('n','<S-n>', ':set invnumber<CR>', standard)
