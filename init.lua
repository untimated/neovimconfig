require('plugins');
require('plugins-setup');
require('keymap');
require('lsp');
require('autocompletion');

-- vim.opt.number = true
vim.opt.mouse = vim.opt.mouse + 'a'
vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.clipboard = "unnamedplus"
vim.opt.wrap = false

vim.cmd "colorscheme tomorrow-night-deepblue"
vim.cmd "highlight Normal guibg=NONE ctermbg=NONE"
