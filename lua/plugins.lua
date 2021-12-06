return require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    -- use nvim-tree: https://github.com/kyazdani42/nvim-tree.lua
    use {
        'kyazdani42/nvim-tree.lua',
        requires = {
            'kyazdani42/nvim-web-devicons' -- icons
        },
    }

    -- bufferline.nvim
    use {'akinsho/bufferline.nvim', requires = 'kyazdani42/nvim-web-devicons'}

    -- which key
    use 'folke/which-key.nvim'

    -- nvim cmp & language server protocols
    use 'neovim/nvim-lspconfig'
    use 'hrsh7th/cmp-nvim-lsp'
    use 'hrsh7th/cmp-buffer'
    use 'hrsh7th/cmp-path'
    use 'hrsh7th/cmp-cmdline'
    use 'hrsh7th/nvim-cmp'
    -- for vsnip users. (In fact I don't know the meaning of this line...)
    use 'hrsh7th/cmp-vsnip'
    use 'hrsh7th/vim-vsnip'

    -- lspkind-nvim to beautify nvim-cmp
    use 'onsails/lspkind-nvim'
    
    -- use lspsaga
    use {'tami5/lspsaga.nvim', branch='nvim51'}
    -- lsp-colors
    use 'folke/lsp-colors.nvim'

    -- nvim-autopairs
    use 'windwp/nvim-autopairs'

    -- comment
    use 'numToStr/Comment.nvim'

    -- status line: lualine
    use {
        'nvim-lualine/lualine.nvim',
        requires = {'kyazdani42/nvim-web-devicons'}
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        requires = {{'nvim-lua/plenary.nvim'}}
    }

    -- nvim-treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        run = ':TSUpdate'
    }

    -- themes
    use 'folke/tokyonight.nvim'
    
end)


