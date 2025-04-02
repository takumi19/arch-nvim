return {
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    build = ":MasonUpdate",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "clangd", "pyright" }
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPost", "BufNewFile", "BufWritePre" },
    dependencies = {
      "mason.nvim",
      { "williamboman/mason-lspconfig.nvim", config = function() end },
    },
    config = function()
      require("lspconfig").lua_ls.setup({})
      require("lspconfig").clangd.setup({
        cmd = {
          "clangd",
          "--background-index",
          "--clang-tidy",
          "--header-insertion=never",
          "--completion-style=detailed",
          "--function-arg-placeholders",
          "--fallback-style=llvm",
        }
      })
      require("lspconfig").pyright.setup {
        settings = {
          pyright = {
            -- autoImportCompletion = true,
          },
          python = {
            analysis = {
              autoSearchPaths = true,
              diagnosticMode = 'openFilesOnly',
              useLibraryCodeForTypes = true,
              typeCheckingMode = 'off'
            }
          }
        }
      }
      vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover" })
      -- vim.keymap.set('n', 'gd', vim.lsp.buf.definition, { desc = "Go to definition" })
      vim.keymap.set('n', 'gr', "<cmd>Telescope lsp_references<cr>", { desc = "References" })
      vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
      vim.keymap.set("n", "<leader>cd", vim.diagnostic.open_float, { desc = "Line Diagnostics" })
      vim.keymap.set("n", "<leader>cr", vim.lsp.buf.rename, { desc = "Rename variable" })
      vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = "Next diagnostic" })
      vim.keymap.set({ 'n', 'v' }, '<leader>ca', vim.lsp.buf.code_action, { desc = "Code actions" })
      vim.keymap.set("n", "<leader>ch", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch source/header" })
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "single" })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help,
        { double = "single" })
    end
  }
}
