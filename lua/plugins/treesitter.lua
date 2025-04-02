return {
    'nvim-treesitter/nvim-treesitter',
    event = { 'BufReadPost', 'BufNewFile' },
    build = ':TSUpdate',
    lazy = vim.fn.argc(-1) == 0,
    init = function(plugin)
        -- PERF: add nvim-treesitter queries to the rtp and it's custom query predicates early
        -- This is needed because a bunch of plugins no longer `require("nvim-treesitter")`, which
        -- no longer trigger the **nvim-treesitter** module to be loaded in time.
        -- Luckily, the only things that those plugins need are the custom queries, which we make available
        -- during startup.
        require("lazy.core.loader").add_to_rtp(plugin)
        require("nvim-treesitter.query_predicates")
    end,
    ---@type TSConfig
    ---@diagnostic disable-next-line: missing-fields
    opts = {
        ensure_installed = {
            "bash",
            "c",
            "cpp",
            "diff",
            "html",
            "javascript",
            "lua",
            "luadoc",
            "markdown",
            "markdown_inline",
            "python",
            "regex",
            "toml",
            "tsx",
            "typescript",
            "vim",
            "vimdoc",
            "xml",
            "yaml",
        },
        sync_install = false,
        auto_install = false,
        ignore_install = {},
        highlight = {
            enable = true,
            additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
    },
    config = function(_, opts)
        require('nvim-treesitter.configs').setup(opts)
    end,
}
