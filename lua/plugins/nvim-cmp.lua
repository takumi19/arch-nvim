return {
  "hrsh7th/nvim-cmp",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
  },
  config = function(_, opts)
    local cmp = require 'cmp'
    cmp.setup({
      snippet = {
        expand = function(args)
          require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
          -- require('snippy').expand_snippet(args.body) -- For `snippy` users.
          -- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      -- preselect = cmp.PreselectMode.Item,
      mapping = {
        ["<CR>"] = cmp.mapping(
          cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Insert,
          }),
          { "i", "c" }
        ),
        ["<C-n>"] = cmp.mapping.select_next_item({
          behavior = cmp.ConfirmBehavior.Insert,
        }),
        ["<C-p>"] = cmp.mapping.select_prev_item({
          behavior = cmp.ConfirmBehavior.Insert,
        }),
        -- ["<C-b>"] = cmp.mapping.scroll_docs(-5),
        -- ["<C-f>"] = cmp.mapping.scroll_docs(5),
        ["<C-q>"] = cmp.mapping.abort(),
      },
      sources = cmp.config.sources({
        {
          name = "nvim_lsp",
          group_index = 2,    -- The suggestions are sorted by this (AFAIK)
        },
        { name = 'luasnip' }, -- For luasnip users.
      }, {
        {
          name = "path",
          keyword_length = 4, -- Number of chars needed to trigger cmp
          group_index = 4,
        },
        {
          name = "buffer",
          keyword_length = 3,
          group_index = 5,
        },
      })
    })
    local capabilities = require('cmp_nvim_lsp').default_capabilities()
    -- Replace <YOUR_LSP_SERVER> with each lsp server you've enabled.
    require('lspconfig')['lua_ls'].setup {
      capabilities = capabilities
    }
    require('lspconfig')['clangd'].setup {
      capabilities = capabilities
    }
    vim.diagnostic.config({
      signs = false
    })
  end
}
