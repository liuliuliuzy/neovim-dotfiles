-- set diagnostic signs

-- local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end

-- vim.fn.sign_define(
--     'DiagnosticSignError',
--     { text = ' ', texthl = 'LspDiagnosticsDefaultError' }
-- )
--
-- vim.fn.sign_define(
--     'DiagnosticSignWarn',
--     { text = ' ', texthl = 'LspDiagnosticsDefaultWarning' }
-- )
--
-- vim.fn.sign_define(
--     'DiagnosticSignHint',
--     { text = ' ', texthl = 'LspDiagnosticsDefaultHint' }
-- )
--
-- vim.fn.sign_define(
--     'DiagnosticSignInfo',
--     { text = ' ', texthl = 'LspDiagnosticsDefaultInformation' }
-- )


vim.fn.sign_define(
  'DiagnosticSignError',
  { text = '', texthl = 'LspDiagnosticsDefaultError' }
)

vim.fn.sign_define(
  'DiagnosticSignWarn',
  { text = '', texthl = 'LspDiagnosticsDefaultWarning' }
)

vim.fn.sign_define(
  'DiagnosticSignInfo',
  { text = '', texthl = 'LspDiagnosticsDefaultInformation' }
)

vim.fn.sign_define(
  'DiagnosticSignHint',
  { text = '', texthl = 'LspDiagnosticsDefaultHint' }
)

