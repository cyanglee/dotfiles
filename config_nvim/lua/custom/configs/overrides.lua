local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "c",
    "markdown",
    "markdown_inline",
    "ruby",
    "scss",
    "json",
    "jsonc",
    "yaml",
    "toml",
    "graphql",
    "prisma",
    "dockerfile",
    "gitignore",
    "bash",
    "regex",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "tailwindcss-language-server",
    "eslint-lsp",
    "prettier",
    "prettierd",

    -- ruby/rails stuff
    "solargraph",
    "rubocop",
    "erb-lint",
    "erb-formatter",

    -- c/cpp stuff
    "clangd",
    "clang-format",
    
    -- additional tools
    "json-lsp",
    "yaml-language-server",
    "markdownlint",
    "marksman",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- M.copilot = {
--   -- Possible configurable fields can be found on:
--   -- https://github.com/zbirenbaum/copilot.lua#setup-and-configuration
--   suggestion = {
--     enable = enable,
--   },
--   panel = {
--     enable = enable,
--   },
-- }

return M
