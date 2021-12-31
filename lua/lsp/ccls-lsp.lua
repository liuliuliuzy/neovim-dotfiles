
-- build & install ccls according to https://github.com/MaskRay/ccls/wiki/Build
nvim_lsp.ccls.setup {
    -- on_attach = my_on_attach,
    -- capabilities = capabilities,
    -- flags = {
    --     debounce_text_changes = 150,
    -- },
    init_options = {
        cache = {
            directory = ".ccls-cache",
        },
    }
}
