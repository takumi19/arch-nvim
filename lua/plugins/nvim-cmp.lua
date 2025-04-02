return {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
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
    local cmp_kinds = {
      Text = ' ',
      Method = ' ',
      Function = ' ',
      Constructor = ' ',
      Field = ' ',
      Variable = ' ',
      Class = ' ',
      Interface = ' ',
      Module = ' ',
      Property = ' ',
      Unit = ' ',
      Value = ' ',
      Enum = ' ',
      Keyword = ' ',
      Snippet = ' ',
      Color = ' ',
      File = ' ',
      Reference = ' ',
      Folder = ' ',
      EnumMember = ' ',
      Constant = ' ',
      Struct = ' ',
      Event = ' ',
      Operator = ' ',
      TypeParameter = ' ',
    }
    cmp.setup({
      snippet = {
        expand = function(args)
          vim.snippet.expand(args.body) -- For native neovim snippets (Neovim v0.10+)
        end,
      },
      window = {
        completion = cmp.config.window.bordered {
          border = 'single',
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
        },
        documentation = cmp.config.window.bordered {
          border = 'single',
          winhighlight = 'Normal:NormalFloat,FloatBorder:FloatBorder,CursorLine:Visual,Search:None',
        },
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
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-q>"] = cmp.mapping.abort(),
        ['<Tab>'] = cmp.mapping(function(fallback)
          if vim.snippet.active({ direction = 1 }) then
            vim.schedule(function()
              vim.snippet.jump(1)
            end)
          else
            fallback()
          end
        end, { 'i', 's' }),
        ['<S-Tab>'] = cmp.mapping(function(fallback)
          if vim.snippet.active({ direction = -1 }) then
            vim.schedule(function()
              vim.snippet.jump(-1)
            end)
          else
            fallback()
          end
        end, { 'i', 's' }),
      },
      formatting = {
        fields = { 'kind', 'abbr' },
        expandable_indicator = true,
        format = function(_, vim_item)
          vim_item.kind = cmp_kinds[vim_item.kind] or ''
          vim_item.menu = ''
          return vim_item
        end,
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
  end
}
