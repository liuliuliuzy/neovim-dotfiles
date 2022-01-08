-----------------------
-- basci key mappings
-----------------------

-- set local alias
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

-- remap esc
-- map('i', '<Alt>', '<Esc', opt)

-- vscode like
map('n', '<C-s>', ':w<CR>', opt)   -- ctrl + s to save

-- continous shift tab
map('v', '<', '<gv', opt)
map('v', '>', '>gv', opt)

-- slipt window
map('n', 'sv', ':vsp<CR>', opt) -- 垂直分屏
map('n', 'sh', ':sp<CR>', opt)  -- 水平分屏
map('n', 'sc', '<C-w>c', opt)   -- 关闭当前分屏
map('n', 'so', '<C-w>o', opt)   -- 关闭其它分屏
-- resize window
map("n", "s>", ":vertical resize +10<CR>", opt)
map("n", "s<", ":vertical resize -10<CR>", opt)
map("n", "s=", "<C-w>=", opt)
map("n", "sj", ":resize +10<CR>",opt)
map("n", "sk", ":resize -10<CR>",opt)

-- change window
map('n', '<A-h>', '<C-w>h', opt)
map('n', '<A-j>', '<C-w>j', opt)
map('n', '<A-k>', '<C-w>k', opt)
map('n', '<A-l>', '<C-w>l', opt)

-- plugins key mappings
-- nvim-tree
map('n', '<A-w>', ':NvimTreeToggle<CR>', opt)

-- lspsaga
map('n', 'gh', ':Lspsaga lsp_finder<CR>', opt)
map('n', 'gp', ':Lspsaga preview_definition<CR>', opt)
map('n', 'gr', ':Lspsaga rename<CR>', opt)

-- bufferline
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)

-- telescope
map('n', '<C-f>', ':Telescope find_files<CR>', opt)
map('n', '<C-g>', ':Telescope live_grep<CR>', opt)
-- default: <C-c> close telescope

-- key mappings for plugins
pluginKeys = {}


-- for comment plugin
pluginKeys.comment = {
    -- normal mode
    toggler = {
        line = '<leader>c',     -- space + c
        block = '<leader>bc',
    },
    -- visual mode
    opleader = {
        line = '<C-_>',        -- ctrl + /
        block = 'bc',
    },
}

return pluginKeys               -- return here means export?

