if true then return {} end
return {
  {
    'ibhagwan/fzf-lua',
    cmd = 'FzfLua',
    config = function()
      local preview_pager = table.concat({
        'delta',
        '--syntax-theme',
        '--line-numbers',
        '--hunk-header-style=\'omit\'',
        '--file-style=\'omit\'',
      }, ' ')

      local actions = require 'fzf-lua.actions'

      require('fzf-lua').setup {
        winopts = {
          border = 'single',
          row = 0.40,
          col = 0.49,
          backdrop = 100,
          preview = {
            vertical = 'down:75%',
            horizontal = 'right:60%',
            layout = 'vertical',
          },
          on_create = function()
            vim.keymap.set(
              't',
              '<tab>',
              '<down>',
              { silent = true, buffer = true }
            )
            vim.keymap.set(
              't',
              '<S-tab>',
              '<up>',
              { silent = true, buffer = true }
            )
          end,
        },
        keymap = {
          builtin = {
            ['<C-y>'] = 'toggle-preview',
            ['<C-d>'] = 'preview-page-down',
            ['<C-u>'] = 'preview-page-up',
          },
          fzf = {
            ['tab'] = 'toggle-down',
            ['shift-tab'] = 'toggle-up',
            ['ctrl-d'] = 'preview-page-down',
            ['ctrl-u'] = 'preview-page-up',
            ['ctrl-q'] = 'select-all+accept',
          },
        },
        actions = {
          files = {
            ['enter'] = actions.file_edit_or_qf,
            ['alt-q'] = actions.file_sel_to_qf,
            ['ctrl-x'] = actions.file_split,
            ['ctrl-v'] = actions.file_vsplit,
          },
        },
        fzf_opts = {
          ['--pointer'] = '▌',
          ['--highlight-line'] = true,
          ['--color'] = 'gutter:-1',
          ['--scrollbar'] = '█',
          ['--info'] = 'hidden',
          ['--no-bold'] = '',
        },
        files = {
          git_icons = false,
          cwd_prompt = false,
          formatter = 'path.filename_first',
          no_header = true,
        },
        buffers = {
          no_header = true,
        },
        git = {
          status = {
            preview_pager = preview_pager,
            no_header = true,
          },
        },
        grep = {
          no_header = true,
          git_icons = false,
        },
        lsp = {
          no_header = true,
          symbols = {
            symbol_icons = {
              File = ' ',
              Module = ' ',
              Namespace = ' ',
              Package = ' ',
              Class = ' ',
              Method = ' ',
              Property = ' ',
              Field = ' ',
              Constructor = ' ',
              Enum = ' ',
              Interface = ' ',
              Function = ' ',
              Variable = ' ',
              Constant = ' ',
              String = ' ',
              Number = ' ',
              Boolean = ' ',
              Array = ' ',
              Object = ' ',
              Key = ' ',
              Null = 'null ',
              EnumMember = ' ',
              Struct = ' ',
              Event = ' ',
              Operator = ' ',
              TypeParameter = ' ',
            },
          },
          code_actions = {
            previewer = 'codeaction_native',
            preview_pager = preview_pager,
          },
        },
      }
    end,
    keys = {
      { '<leader><leader>', '<cmd>FzfLua files<cr>',                                    { desc = 'Find git tracked files in cwd' } },
      -- { '<leader>ff',       '<cmd>FzfLua files no_ignore=true<cr>',                { desc = 'Find files in cwd' } },
      { '<leader>fc',       '<cmd>FzfLua files cwd = vim.fn.stdpath("config") <cr>',    { desc = 'Find config' } },
      { '<leader>fg',       '<cmd>FzfLua git_files<cr>',                                { desc = 'Find git tracked files in cwd' } },
      { '<leader>sg',       '<cmd>FzfLua live_grep<cr>',                                { desc = 'Grep files in cwd' } },
      { '<leader>sh',       '<cmd>FzfLua help_tags<cr>',                                { desc = 'Search help' } },
      { '<leader>sH',       "<cmd>FzfLua highlights<cr>",                               { desc = 'Search highlights' } },
      { '<leader>sk',       "<cmd>FzfLua keymaps<cr>",                                  { desc = 'Search keymaps' } },
      { '<leader>fb',       '<cmd>FzfLua buffers sort_mru=true sort_lastused=true<cr>', { desc = 'Find buffers' } },
      { '<leader>fr',       '<cmd>FzfLua oldfiles<cr>',                                 { desc = 'Find recent files' } },
      { '<leader>sc',       '<cmd>FzfLua commands<cr>',                                 { desc = 'Search commands' } },
      { '<leader>uc',       '<cmd>FzfLua colorscheme<cr>',                              { desc = 'Pick colorscheme' } },
      { '<leader>ss',       '<cmd>FzfLua lsp_document_symbols<cr>',                     { desc = 'LSP document symbols' } },
      { '<leader>sS',       '<cmd>FzfLua lsp_workspace_symbols<cr>',                    { desc = 'LSP workspace symbols' } },
      { '<leader>sr',       '<cmd>FzfLua resume<cr>',                                   { desc = 'Resume last search' } },
      { '<leader>sw',       '<cmd>FzfLua grep_string<cr>',                              { desc = 'Search word under cursor' } },
      { '<leader>:',        '<cmd>FzfLua command_history<cr>',                          { desc = 'Command history' } },
      { '<leader>sb',       '<cmd>FzfLua current_buffer_fuzzy_find<cr>',                { desc = 'Buffer search' } },
      { '<leader>sM',       '<cmd>FzfLua man_pages<cr>',                                { desc = 'Search man pages' } },
      { '<leader>sm',       '<cmd>FzfLua marks<cr>',                                    { desc = 'Search marks' } },
    }
  },
  {
    -- FIXME: This is not working
    "neovim/nvim-lspconfig",
    opts = function()
      local Keys = require("lazyvim.plugins.lsp.keymaps").get()
      -- stylua: ignore
      vim.list_extend(Keys, {
        { "gd", "<cmd>FzfLua lsp_definitions     jump_to_single_result=true ignore_current_line=true<cr>", desc = "Goto Definition",       has = "definition" },
        { "gr", "<cmd>FzfLua lsp_references      jump_to_single_result=true ignore_current_line=true<cr>", desc = "References",            nowait = true },
        { "gI", "<cmd>FzfLua lsp_implementations jump_to_single_result=true ignore_current_line=true<cr>", desc = "Goto Implementation" },
        { "gy", "<cmd>FzfLua lsp_typedefs        jump_to_single_result=true ignore_current_line=true<cr>", desc = "Goto T[y]pe Definition" },
      })
    end,
  },
}
