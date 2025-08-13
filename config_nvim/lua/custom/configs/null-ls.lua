local null_ls = require "null-ls"

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettierd.with {
    filetypes = {
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "vue",
      "css",
      "scss",
      "less",
      "html",
      "json",
      "jsonc",
      "yaml",
      "markdown",
      "markdown.mdx",
      "graphql",
      "handlebars",
    },
  },


  -- Ruby/Rails formatting (using standard gem if available, fallback to rubocop via LSP)
  -- Note: Removed rubocop none-ls integration due to gem conflicts

  -- ERB formatting
  b.formatting.erb_format,

  -- Lua
  b.formatting.stylua,

  -- cpp
  b.formatting.clang_format,

  -- Markdown
  b.formatting.markdownlint,
  b.diagnostics.markdownlint,

  -- JSON
  b.formatting.jq,

  -- YAML
  b.diagnostics.yamllint,
}

null_ls.setup {
  debug = false,
  sources = sources,
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      -- Format on save
      vim.api.nvim_create_autocmd("BufWritePre", {
        buffer = bufnr,
        callback = function()
          vim.lsp.buf.format({ bufnr = bufnr })
        end,
      })
    end
  end,
}
