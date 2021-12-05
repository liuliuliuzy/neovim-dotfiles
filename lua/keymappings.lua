-----------------------
-- basci key mappings
-----------------------

-- set local alias
local map = vim.api.nvim_set_keymap
local opt = {noremap = true, silent = true}

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

-- bufferline
map('n', '<C-h>', ':BufferLineCyclePrev<CR>', opt)
map('n', '<C-l>', ':BufferLineCycleNext<CR>', opt)


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

-- for lsp
pluginKeys.lsp_on_attach = function(client, buffer)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end 
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end
    --- Mappings.
    local opts = { noremap=true, silent=true }
    buf_set_keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'gh', '<cmd>lua vim.lsp.buf.hover()<CR>', opts)
    -- buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<F2>', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', 'ge' , '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', 'gpe', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<leader>f', '<cmd>lua vim.lsp.buf.formatting()<CR>', opts)
    buf_set_keymap('n', '<leader>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
end

return pluginKeys               -- return here means export?


-- lsp keymappings

