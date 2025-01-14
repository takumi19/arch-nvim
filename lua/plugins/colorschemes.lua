return {
  {
    "sainnhe/gruvbox-material",
    lazy = false,
    priority = 1000,
    config = function()
      vim.g.gruvbox_material_better_performance = 1
      vim.g.gruvbox_material_enable_italic = true
      vim.g.gruvbox_material_foreground = 'mix'
      vim.g.gruvbox_material_background = 'hard'
      vim.g.gruvbox_material_float_style = 'dim'
      vim.g.gruvbox_material_ui_contrast = 'high' -- The contrast of line numbers, indent lines, etc.
      vim.g.gruvbox_material_enable_bold = 1
      vim.g.gruvbox_material_diagnostic_virtual_text = 'colored'
      vim.g.gruvbox_material_transparent_background = 1

      local configuration = vim.fn['gruvbox_material#get_configuration']()
      local palette = vim.fn['gruvbox_material#get_palette'](
        configuration.background,
        configuration.foreground,
        configuration.colors_override
      )

      local highlights_groups = {
        FoldColumn = { bg = 'none', fg = palette.grey0[1] },
        SignColumn = { bg = 'none' },
        EndOfBuffer = { bg = 'none', fg = palette.grey0[1] },
        Normal = { bg = 'none', fg = palette.fg0[1] },
        NormalFloat = { bg = 'none', fg = palette.fg0[1] },
        FloatBorder = { bg = 'none' },
        FloatTitle = { bg = 'none', fg = palette.orange[1] },
        TelescopeTitle = { bg = 'none', fg = palette.fg0[1] },
        TelescopeBorder = { bg = 'none', fg = palette.fg0[1] },
        TelescopeNormal = { fg = 'none' },
        TelescopePromptNormal = { bg = 'none', fg = palette.fg0[1] },
        TelescopeResultsNormal = { bg = 'none', fg = palette.fg0[1] },
        TelescopeResultsDiffUntracked = { bg = 'none', fg = palette.orange[1] },
        TelescopeSelection = { bg = palette.bg5[1], fg = palette.fg0[1] },
        TelescopePreviewDirectory = { fg = palette.red[1] },
        TelescopePromptCounter = { bg = 'none', fg = palette.fg0[1] },
        TelescopeMatching = { bold = false, bg = 'none', fg = palette.green[1] },
        Visual = { bg = palette.bg_visual_red[1] },
        ColorColumn = { bg = palette.bg_visual_blue[1] },
        CursorLine = { bg = palette.bg3[1], blend = 25 },
        -- CursorLineNr = { bold = true, fg = "#e2cca9" },
        GitSignsAdd = { bg = 'none', fg = palette.green[1] },
        GitSignsChange = { bg = 'none', fg = palette.yellow[1] },
        GitSignsDelete = { bg = 'none', fg = palette.red[1] },
        DiffAdd = { bg = 'none', fg = palette.green[1] },
        DiffChange = { bg = 'none', fg = palette.yellow[1] },
        DiffDelete = { bg = 'none', fg = palette.red[1] },
        DiffText = { bg = 'none', fg = palette.blue[1] },
        LspInfoBorder = { bg = 'none', fg = palette.fg0[1] },
        MatchParen = { bg = palette.grey2[1], fg = palette.bg0[1] },
        DiagnosticSignWarn = { bg = 'none', fg = palette.yellow[1] },
        ErrorMsg = { fg = palette.red[1] },
      }

      for group, styles in pairs(highlights_groups) do
        vim.api.nvim_set_hl(0, group, styles)
      end
    end
  },
  {
    "zenbones-theme/zenbones.nvim",
    -- Optionally install Lush. Allows for more configuration or extending the colorscheme
    -- If you don't want to install lush, make sure to set g:zenbones_compat = 1
    -- In Vim, compat mode is turned on as Lush only works in Neovim.
    dependencies = "rktjmp/lush.nvim",
    lazy = true,
    -- you can set set configuration options here
    -- config = function()
      --     vim.g.zenbones_darken_comments = 45
      --     vim.cmd.colorscheme('zenbones')
      -- end
    },
  -- {
  --   'gmr458/cold.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   build = ':ColdCompile',
  --   config = function()
  --       require('cold').setup {
  --           transparent_background = true,
  --           cursorline = false,
  --           float_borderless = true,
  --       }
  --       vim.cmd.colorscheme 'cold'
  --   end,
  -- },
  -- {
  --   "neanias/everforest-nvim",
  --   version = false,
  --   lazy = false,
  --   priority = 1000, -- make sure to load this before all the other start plugins
  --   config = function()
  --     require("everforest").setup({
  --       transparent_background_level = 1
  --     })
  --   end,
  -- },
  -- {
  --   "ellisonleao/gruvbox.nvim",
  --   lazy = true,
  --   -- priority = 1000,
  --   opts = {
  --     transparent_mode = true,
  --   },
  -- },
  -- {
  --   "catppuccin/nvim",
  --   lazy = true,
  --   -- priority = 1000,
  --   name = "catppuccin",
  --   -- or just use opts table
  --   opts = {
  --     flavour = "frappe",
  --   },
  -- },
  -- {
  --   "joshdick/onedark.vim",
  --   lazy = true,
  --   -- priority = 1000,
  --   name = "onedark",
  -- },
  -- {
  --   "rose-pine/neovim",
  --   name = "rose-pine",
  --   lazy = true,
  --   -- priority = 1000,
  --   disable_background = true,
  --   styles = {
  --     transparency = true,
  --   },
  -- },
}
