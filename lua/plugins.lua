vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    -- Themes
    use 'jamescherti/vim-tomorrow-night-deepblue'

    -- File Explorer
    use 'nvim-tree/nvim-web-devicons'
    use {  
        'nvim-tree/nvim-tree.lua',
    }

    -- LSP
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/nvim-cmp'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'onsails/lspkind.nvim'
    use {'L3MON4D3/LuaSnip', tag="v1.2.1", run ="make install_jsregexp"}
    use 'saadparwaiz1/cmp_luasnip'
    use 'ranjithshegde/ccls.nvim'

    -- Tree Sitter
    use {'nvim-treesitter/nvim-treesitter'}

    -- LuaLine
    use 'nvim-lualine/lualine.nvim'

    -- Surround
    use {'kylechui/nvim-surround', tag="*"}

    -- Comment
    -- use 'terrortylor/nvim-comment'
    use 'tpope/vim-commentary'


    -- Auto Pair
    -- use 'windwp/nvim-autopairs'
    use 'jiangmiao/auto-pairs'

    -- Telescope / Fuzzy Finder
    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.1',
        requires = {{'nvim-lua/plenary.nvim'}}
    }



end)
