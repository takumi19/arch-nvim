return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    opts = function()
      local pickers = require('telescope.builtin')
      local map = vim.keymap.set
      map('n', '<leader><leader>', pickers.find_files, { desc = 'Find files in cwd' } )
      map('n', '<leader>ff', pickers.find_files, { desc = 'Find files in cwd' } )
      map('n', '<leader>sg', pickers.live_grep, { desc = 'Grep files in cwd' } )
      map('n', '<leader>sh', pickers.help_tags, { desc = 'Search help' } )
      map('n', '<leader>sk', pickers.keymaps, { desc = 'Search keymaps' } )
      map('n', '<leader>fb', pickers.buffers, { desc = 'Find buffers' } )
      map('n', '<leader>fr', pickers.oldfiles, { desc = 'Find recent files' } )
      map('n', '<leader>sc', pickers.commands, { desc = 'Search commands' } )
      map('n', '<leader>uc', pickers.colorscheme, { desc = 'Pick colorscheme' } )
      map('n', '<leader>ss', pickers.lsp_document_symbols, { desc = 'LSP document symbols' } )
      map('n', '<leader>sS', pickers.lsp_workspace_symbols, { desc = 'LSP workspace symbols' } )
      map('n', '<leader>sr', pickers.resume, { desc = 'Resume last search' } )
      map('n', '<leader>sw', pickers.grep_string, { desc = 'Search word under cursor' } )
      map('n', '<leader>:', pickers.command_history, { desc = 'Command history' } )
      map('n', '<leader>sb', pickers.current_buffer_fuzzy_find, { desc = 'Buffer search' } )
      map('n', 'gr', '<cmd>Telescope lsp_references show_line=false<cr>', { desc = 'Lsp references' } )
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",

    config = function()
      require("telescope").setup {
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          }
        }
      }
      require("telescope").load_extension("ui-select")
    end
  }
}
