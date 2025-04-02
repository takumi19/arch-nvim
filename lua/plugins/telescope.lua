return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    cmd = "Telescope",
    lazy = true,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
      'nvim-telescope/telescope-ui-select.nvim'
    },
    opts = {
      defaults = {
        mappings = {
          n = {
            ['<A-p>'] = require 'telescope.actions.layout'.toggle_preview,
          },
          i = {
            ['<A-p>'] = require 'telescope.actions.layout'.toggle_preview,
          },
        },
        -- sorting_strategy = 'ascending',
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {
            }
          },
          fzf = {
            fuzzy = true,
            override_generic_sorter = true,
            override_file_sorter = true,
            case_mode = 'smart_case',
          }
        },
        vimgrep_arguments = {
          'rg',
          '--color=never',
          '--no-heading',
          '--with-filename',
          '--line-number',
          '--column',
          '--smart-case',
          '--hidden',
        },

      }, -- defaults
      pickers = {
        help_tags = {
          prompt_prefix = '   ',
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
            scroll_speed = 4,
            width = { padding = 0 },
            height = { padding = 0 },
            preview_width = 0.6,
          },
        },
        buffers = {
          path_display = { 'filename_first' },
          previewer = false,
          layout_strategy = 'vertical',
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
            width = 0.5,
            height = 0.7,
            preview_cutoff = 1,
            mirror = false,
          },
        },
        oldfiles = {
          path_display = { 'filename_first' },
          previewer = false,
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
            width = 0.9,
          },
        },
        git_files = {
          path_display = { 'filename_first' },
          previewer = false,
          sorting_strategy = 'ascending',
          no_ignore = true,
          layout_strategy = 'vertical',
          layout_config = {
            prompt_position = 'top',
            width = 0.5,
            height = 0.7,
            preview_cutoff = 1,
            mirror = false,
          },
          find_command = {
            'fd',
            '--type',
            'f',
            '--color=never',
            '--follow',
          },
        },
        find_files = {
          path_display = { 'filename_first' },
          previewer = false,
          layout_strategy = 'vertical',
          sorting_strategy = 'ascending',
          layout_config = {
            prompt_position = 'top',
            width = 0.5,
            height = 0.7,
            preview_cutoff = 1,
            mirror = false,
          },
        },
        live_grep = {
          theme = 'ivy',
        },
        grep_string = {
          theme = 'ivy',
        }
      },
    },
    config = function(_, opts)
      require('telescope').setup(opts)
      require('telescope').load_extension('fzf')
      -- require("telescope").load_extension("ui-select")
    end,
    keys = {
      { '<leader><leader>', function() require('telescope.builtin').find_files() end,                                   { desc = 'Find git tracked files in cwd' } },
      { '<leader>ff',       function() require('telescope.builtin').find_files { no_ignore = true } end,                { desc = 'Find files in cwd' } },
      { '<leader>fc',       function() require('telescope.builtin').find_files { cwd = vim.fn.stdpath("config") } end,  { desc = 'Find config' } },
      { '<leader>fh',       function() require('telescope.builtin').find_files { no_ignore = true, hidden = true } end, { desc = 'Find git tracked files in cwd' } },
      { '<leader>fg',       function() require('telescope.builtin').git_files() end,                                    { desc = 'Find git tracked files in cwd' } },
      { '<leader>sg',       function() require('telescope.builtin').live_grep() end,                                    { desc = 'Grep files in cwd' } },
      { '<leader>sh',       function() require('telescope.builtin').help_tags() end,                                    { desc = 'Search help' } },
      { '<leader>sH',       function() require('telescope.builtin').highlights() end,                                   { desc = 'Search highlights' } },
      { '<leader>sk',       function() require('telescope.builtin').keymaps() end,                                      { desc = 'Search keymaps' } },
      { '<leader>fb',       function() require('telescope.builtin').buffers() end,                                      { desc = 'Find buffers' } },
      { '<leader>fr',       function() require('telescope.builtin').oldfiles() end,                                     { desc = 'Find recent files' } },
      { '<leader>sc',       function() require('telescope.builtin').commands() end,                                     { desc = 'Search commands' } },
      { '<leader>uc',       function() require('telescope.builtin').colorscheme() end,                                  { desc = 'Pick colorscheme' } },
      { '<leader>ss',       function() require('telescope.builtin').lsp_document_symbols() end,                         { desc = 'LSP document symbols' } },
      { '<leader>sS',       function() require('telescope.builtin').lsp_workspace_symbols() end,                        { desc = 'LSP workspace symbols' } },
      { '<leader>sr',       function() require('telescope.builtin').resume() end,                                       { desc = 'Resume last search' } },
      { '<leader>sw',       function() require('telescope.builtin').grep_string() end,                                  { desc = 'Search word under cursor' } },
      { '<leader>:',        function() require('telescope.builtin').command_history() end,                              { desc = 'Command history' } },
      { '<leader>sb',       function() require('telescope.builtin').current_buffer_fuzzy_find() end,                    { desc = 'Buffer search' } },
      { '<leader>sM',       function() require('telescope.builtin').man_pages() end,                                    { desc = 'Search man pages' } },
      { '<leader>sm',       function() require('telescope.builtin').marks() end,                                        { desc = 'Search marks' } },
      { 'gr',               '<cmd>Telescope lsp_references show_line=false<cr>',                                        { desc = 'Lsp references' } },
      { 'gd',               function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end,          { desc = "Goto Definition" } },
      { "gy",               function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end,     { desc = "Goto T[y]pe Definition" } },
    }
  },
  -- {
  --   "nvim-telescope/telescope-ui-select.nvim",
  --   lazy = true,
  --   config = function()
  --     require("telescope").setup {
  --       extensions = {
  --         ["ui-select"] = {
  --           require("telescope.themes").get_dropdown {
  --           }
  --         }
  --       }
  --     }
  --     require("telescope").load_extension("ui-select")
  --   end
  -- }
}
