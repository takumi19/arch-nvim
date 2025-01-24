return {
  {
    'nvim-telescope/telescope.nvim',
    version = false,
    -- cmd = "Telescope",
    lazy = false,
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons',
      { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' }
    },
    config = function()
      local actions_layout = require 'telescope.actions.layout'
      local themes = require 'telescope.themes'

      require('telescope').setup {
        defauts = {
          path_display = { 'filename_first' },
          mappings = {
            n = {
              ['<C-y>'] = actions_layout.toggle_preview,
            },
            i = {
              -- ['<Tab>'] = actions.move_selection_worse,
              -- ['<S-Tab>'] = actions.move_selection_better,
              ['<C-y>'] = actions_layout.toggle_preview,
            },
          },
          sorting_strategy = 'ascending',
          -- layout_strategy = nil,
          -- layout_config = nil,
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
            borderchars = {
              '─',
              '│',
              '─',
              '│',
              '┌',
              '┐',
              '┘',
              '└',
            },
            -- layout_strategy = 'vertical',
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
            previewer = false,
            layout_strategy = 'vertical',
            sorting_strategy = 'ascending',
            layout_config = {
              width = 0.7,
              prompt_position = 'top',
            },
          },
          oldfiles = {
            previewer = false,
            sorting_strategy = 'ascending',
            layout_config = {
              prompt_position = 'top',
              width = 0.9,
            },
          },
          git_files = {
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
            previewer = false,
            -- no_ignore = true,
            layout_strategy = 'vertical',
            sorting_strategy = 'ascending',
            layout_config = {
              prompt_position = 'top',
              width = 0.5,
              height = 0.7,
              preview_cutoff = 1,
              mirror = false,
            },
            -- find_command = {
            --   'fd',
            --   '--type',
            --   'f',
            --   '--no-ignore-vcs',
            --   '--color=never',
            --   -- '--hidden',
            --   '--follow',
            -- },
          },
          live_grep = {
            theme = 'ivy',
          },
          grep_string = {
            theme = 'ivy',
          }
        },
      }
      -- vim.tbl_deep_extend("force", theme_opts, opts)
      require('telescope').load_extension('fzf')
      require("telescope").load_extension("ui-select")
      local pickers = require('telescope.builtin')
      local map = vim.keymap.set
      map('n', '<leader><leader>', pickers.find_files, { desc = 'Find git tracked files in cwd' })
      map('n', '<leader>ff', function()
        pickers.find_files {
          no_ignore = true
        }
      end, { desc = 'Find files in cwd' })
      map('n', '<leader>fc', function()
        pickers.find_files {
          cwd = vim.fn.stdpath("config")
        }
      end, { desc = 'Find config' })
      map('n', '<leader>fh', function()
        pickers.find_files {
          no_ignore = true,
          hidden = true
        }
      end, { desc = 'Find git tracked files in cwd' })
      map('n', '<leader>fg', pickers.git_files, { desc = 'Find git tracked files in cwd' })
      map('n', '<leader>sg', pickers.live_grep, { desc = 'Grep files in cwd' })
      map('n', '<leader>sh', pickers.help_tags, { desc = 'Search help' })
      map('n', '<leader>sH', pickers.highlights, { desc = 'Search highlights' })
      map('n', '<leader>sk', pickers.keymaps, { desc = 'Search keymaps' })
      map('n', '<leader>fb', pickers.buffers, { desc = 'Find buffers' })
      map('n', '<leader>fr', pickers.oldfiles, { desc = 'Find recent files' })
      map('n', '<leader>sc', pickers.commands, { desc = 'Search commands' })
      map('n', '<leader>uc', pickers.colorscheme, { desc = 'Pick colorscheme' })
      map('n', '<leader>ss', pickers.lsp_document_symbols, { desc = 'LSP document symbols' })
      map('n', '<leader>sS', pickers.lsp_workspace_symbols, { desc = 'LSP workspace symbols' })
      map('n', '<leader>sr', pickers.resume, { desc = 'Resume last search' })
      map('n', '<leader>sw', pickers.grep_string, { desc = 'Search word under cursor' })
      map('n', '<leader>:', pickers.command_history, { desc = 'Command history' })
      map('n', '<leader>sb', pickers.current_buffer_fuzzy_find, { desc = 'Buffer search' })
      map('n', '<leader>sM', pickers.man_pages, { desc = 'Search man pages' })
      map('n', '<leader>sm', pickers.marks, { desc = 'Search marks' })
      map('n', 'gr', '<cmd>Telescope lsp_references show_line=false<cr>', { desc = 'Lsp references' })
      map('n', 'gd', function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end,
        { desc = "Goto Definition" })
      map('n', "gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end,
        { desc = "Goto T[y]pe Definition" })
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    -- lazy = true,
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
