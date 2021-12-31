-- configure language servers
vim.lsp.set_log_level("debug")
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())
capabilities.textDocument.completion.completionItem.snippetSupport = true

local nvim_lsp = require('lspconfig')
-- local protocol = require('vim.lsp.protocol')

-- define my on_attach funciton
local my_on_attach = function(client, bufnr)
    local function buf_set_keymap(...) vim.api.nvim_buf_set_keymap(bufnr, ...) end
    local function buf_set_option(...) vim.api.nvim_buf_set_option(bufnr, ...) end

    --Enable completion triggered by <c-x><c-o>
    buf_set_option('omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- Mappings.
    local opts = { noremap=true, silent=true }

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    buf_set_keymap('n', 'gD', '<Cmd>lua vim.lsp.buf.declaration()<CR>', opts)
    buf_set_keymap('n', 'gd', '<Cmd>lua vim.lsp.buf.definition()<CR>', opts)
    buf_set_keymap('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>', opts)
    buf_set_keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<CR>', opts)
    --buf_set_keymap('i', '<C-k>', '<cmd>lua vim.lsp.buf.signature_help()<CR>', opts)
    buf_set_keymap('n', '<space>wa', '<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wr', '<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>', opts)
    buf_set_keymap('n', '<space>wl', '<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>', opts)
    buf_set_keymap('n', '<space>D', '<cmd>lua vim.lsp.buf.type_definition()<CR>', opts)
    buf_set_keymap('n', '<space>rn', '<cmd>lua vim.lsp.buf.rename()<CR>', opts)
    buf_set_keymap('n', '<space>ca', '<cmd>lua vim.lsp.buf.code_action()<CR>', opts)
    buf_set_keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<CR>', opts)
    buf_set_keymap('n', '<space>e', '<cmd>lua vim.lsp.diagnostic.show_line_diagnostics()<CR>', opts)
    --buf_set_keymap('n', '<C-j>', '<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>', opts)
    buf_set_keymap('n', '<S-C-j>', '<cmd>lua vim.lsp.diagnostic.goto_next()<CR>', opts)
    buf_set_keymap('n', '<space>q', '<cmd>lua vim.lsp.diagnostic.set_loclist()<CR>', opts)
    buf_set_keymap("n", "<space>f", "<cmd>lua vim.lsp.buf.formatting()<CR>", opts)

    -- auto format when save
    if client.resolved_capabilities.document_formatting then
        vim.api.nvim_command [[augroup Format]]
        vim.api.nvim_command [[autocmd! * <buffer>]]
        vim.api.nvim_command [[autocmd BufWritePre <buffer> lua vim.lsp.buf.formatting_seq_sync()]]
        vim.api.nvim_command [[augroup END]]
    end

end

-- python
nvim_lsp['pyright'].setup {
    on_attach = my_on_attach,
    -- filetypes = {"py"},
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    }
}

-- c/c++
nvim_lsp.ccls.setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
    flags = {
        debounce_text_changes = 150,
    },
    init_options = {
        cache = {
            directory = "/home/leo/.cache/ccls"
        }
    }
}

-- gopls
-- according to https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim
nvim_lsp.gopls.setup {
    on_attach = my_on_attach,
    capabilities = capabilities,
    cmd = {"gopls", "serve"},
    settings = {
        gopls = {
            analyses = {
                unusedparams = true,
            },
            staticcheck = true,
        },
    },
}

-- rust
-- use rust-tools: https://github.com/simrat39/rust-tools.nvim
-- see lua/plugin-configs/rust-tools.lua

-- auto sort imported packages for golang, see: https://github.com/golang/tools/blob/master/gopls/doc/vim.md#neovim-imports
-- function goimports(timeout_ms)
--     local context = { only = { "source.organizeImports" } }
--     vim.validate { context = { context, "t", true } }
--
--     local params = vim.lsp.util.make_range_params()
--     params.context = context
--
--     -- See the implementation of the textDocument/codeAction callback
--     -- (lua/vim/lsp/handler.lua) for how to do this properly.
--     local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
--     if not result or next(result) == nil then return end
--     local actions = result[1].result
--     if not actions then return end
--     local action = actions[1]
--
--     -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
--     -- is a CodeAction, it can have either an edit, a command or both. Edits
--     -- should be executed first.
--     if action.edit or type(action.command) == "table" then
--         if action.edit then
--             vim.lsp.util.apply_workspace_edit(action.edit)
--         end
--         if type(action.command) == "table" then
--             vim.lsp.buf.execute_command(action.command)
--         end
--     else
--         vim.lsp.buf.execute_command(action)
--     end
-- end
--
-- vim.api.nvim_command [[autocmd BufWritePre *.go lua goimports(1000)]]

-- configure lspkind
local cmp = require('cmp')
local lspkind = require('lspkind')
cmp.setup {
    formatting = {
        format = lspkind.cmp_format(),
    },
}

