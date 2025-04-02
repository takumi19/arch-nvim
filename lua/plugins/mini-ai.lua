return {
  "echasnovski/mini.ai",
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects'
  },
  event = "VeryLazy",
  opts = function()
    local ai = require("mini.ai")
    return {
      n_lines = 500,
      custom_textobjects = {
        g = function()
          local from = { line = 1, col = 1 }
          local to = {
            line = vim.fn.line('$'),
            col = math.max(vim.fn.getline('$'):len(), 1)
          }
          return { from = from, to = to }
        end,
        a = ai.gen_spec.argument({ brackets = { '%b()' } }),
        o = ai.gen_spec.treesitter({ -- code block
          a = { "@block.outer", "@conditional.outer", "@loop.outer" },
          i = { "@block.inner", "@conditional.inner", "@loop.inner" },
        }),
        f = ai.gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }), -- function
        c = ai.gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }),       -- class
        t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },           -- tags
        e = {                                                                         -- Word with case
          { "%u[%l%d]+%f[^%l%d]", "%f[%S][%l%d]+%f[^%l%d]", "%f[%P][%l%d]+%f[^%l%d]", "^[%l%d]+%f[^%l%d]" },
          "^().*()$",
        },
        -- i = LazyVim.mini.ai_indent, -- indent
      },
    }
  end,
  config = function(_, opts)
    require("mini.ai").setup(opts)
    -- LazyVim.on_load("which-key.nvim", function()
    --   vim.schedule(function()
    --     LazyVim.mini.ai_whichkey(opts)
    --   end)
    -- end)
  end,
}
