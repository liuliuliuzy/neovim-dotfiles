" zyleo neovim configurations
" ---------------------------------
" basic settins
lua require('basic')
lua require('keymappings')

" use Packer to install and manage plugins
lua require('plugins')

" plugins configurations
lua require('plugin-configs/nvim-tree')
lua require('plugin-configs/bufferline')
lua require('plugin-configs/comment')
lua require('plugin-configs/nvim-autopairs')
lua require('plugin-configs/lualine')
lua require('plugin-configs/lspcolors')
lua require('plugin-configs/telescope')
lua require('plugin-configs/treesitter')

" language server
lua require('lsp/nvim-cmp')
lua require('lsp/diagnostic_signs')
lua require('lsp/language_servers')


" 复制到windows剪贴板
" https://stackoverflow.com/questions/44480829/how-to-copy-to-clipboard-in-vim-of-bash-on-windows
autocmd TextYankPost * if v:event.operator ==# 'y' | call system('/mnt/c/Windows/System32/clip.exe', @0) | endif
