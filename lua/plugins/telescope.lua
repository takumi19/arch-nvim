return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    lazy = false,
    dependencies = { 
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
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
