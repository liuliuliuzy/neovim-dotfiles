-- https://gitub.com/hrsh7th/nvim-cmph

-- copy from wiki
-- https://github.com/hrsh7th/nvim-cmp/wiki/Example-mappings#vim-vsnip
local has_words_before = function()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

local feedkey = function(key, mode)
  vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes(key, true, true, true), mode, true)
end
------------------


local cmp = require'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      -- For `vsnip` users.
      vim.fn["vsnip#anonymous"](args.body) 

      -- For `luasnip` users.
      -- require('luasnip').lsp_expand(args.body) 
      --
      -- For `ultisnips` users.
      -- vim.fn["UltiSnips#Anon"](args.body) 
      --
      -- For `snippy` users.
      -- require'snippy'.expand_snippet(args.body) 
    end,
  },
  mapping = {
    ['<C-d>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
    ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
    ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
    ['<C-y>'] = cmp.config.disable, -- If you want to remove the default `<C-y>` mapping, You can specify `cmp.config.disable` value.
    ['<C-e>'] = cmp.mapping({
      i = cmp.mapping.abort(),
      c = cmp.mapping.close(),
    }),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },

    -- wiki start
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif vim.fn["vsnip#available"](1) == 1 then
        feedkey("<Plug>(vsnip-expand-or-jump)", "")
      elseif has_words_before() then
        cmp.complete()
      else
        fallback() -- The fallback function sends a already mapped key. In this case, it's probably `<Tab>`.
      end
    end, { "i", "s" }),
    ["<S-Tab>"] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item()
      elseif vim.fn["vsnip#jumpable"](-1) == 1 then
        feedkey("<Plug>(vsnip-jump-prev)", "")
      end
    end, { "i", "s" }),
    ---wiki end
  },
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },

    -- For vsnip users.
    { name = 'vsnip' }, 

    -- { name = 'luasnip' }, -- For luasnip users.
    -- { name = 'ultisnips' }, -- For ultisnips users.
    -- { name = 'snippy' }, -- For snippy users.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/`.
cmp.setup.cmdline('/', {
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':'.
cmp.setup.cmdline(':', {
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

------------------ colors
-- gray
-- vim.cmd[[highlight! CmpItemAbbrDeprecated guibg=NONE gui=strikethrough guifg=#808080]]
-- -- blue
-- vim.cmd[[highlight! CmpItemAbbrMatch guibg=NONE guifg=#569CD6]]
-- vim.cmd[[highlight! CmpItemAbbrMatchFuzzy guibg=NONE guifg=#569CD6]]
-- -- light blue
-- vim.cmd[[highlight! CmpItemKindVariable guibg=NONE guifg=#9CDCFE]]
-- vim.cmd[[highlight! CmpItemKindInterface guibg=NONE guifg=#9CDCFE]]
-- vim.cmd[[highlight! CmpItemKindText guibg=NONE guifg=#9CDCFE]]
-- -- pink
-- vim.cmd[[highlight! CmpItemKindFunction guibg=NONE guifg=#C586C0]]
-- vim.cmd[[highlight! CmpItemKindMethod guibg=NONE guifg=#C586C0]]
-- -- front
-- vim.cmd[[highlight! CmpItemKindKeyword guibg=NONE guifg=#D4D4D4]]
-- vim.cmd[[highlight! CmpItemKindProperty guibg=NONE guifg=#D4D4D4]]
-- vim.cmd[[highlight! CmpItemKindUnit guibg=NONE guifg=#D4D4D4]]


-- If you want insert `(` after select function or method item
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on( 'confirm_done', cmp_autopairs.on_confirm_done({  map_char = { tex = '' } }))
