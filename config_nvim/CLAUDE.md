# NvChad Configuration for React/Rails Development

This NvChad configuration has been optimized for React-based frameworks (React, Next.js, Remix) and Rails development with seamless Claude Code integration.

## Key Features

### Language Server Protocol (LSP)
- **TypeScript/JavaScript**: Enhanced `ts_ls` with inlay hints for better code intelligence
- **Ruby/Rails**: Solargraph with full Rails support
- **Tailwind CSS**: Auto-completion for utility classes with support for clsx, cva, and cn functions
- **ESLint**: Auto-fix on save for JavaScript/TypeScript files
- **Additional servers**: HTML, CSS, Emmet, JSON, YAML, Markdown

### Formatting & Linting
- **Prettier**: Fast formatting with prettierd for web files
- **ESLint**: Diagnostics and auto-fixing for JavaScript/TypeScript
- **Rubocop**: Ruby/Rails code formatting and linting
- **ERB**: Template formatting support
- **Auto-format on save**: Enabled for all supported file types

### React Development
- **JSX/TSX Support**: Full syntax highlighting and auto-tag closing
- **Component Navigation**: Smart file finding that ignores build directories
- **Package Management**: Interactive package.json management (leader+n prefix)
- **Debugging**: Node.js debugging with DAP support

### Rails Development
- **vim-rails**: Navigate between models, views, and controllers
- **Rails Commands**: Quick access to console, server, migrations (leader+r prefix)
- **Ruby Helpers**: Auto-end insertion, bundler support
- **Slim Templates**: Syntax support for Slim template language

### Navigation & Search
- **Telescope**: Enhanced file finding with hidden files support
- **Project Management**: Auto-detect and switch between projects
- **Git Integration**: Gitsigns with inline blame, Neogit for complex operations
- **Diagnostics**: Trouble.nvim for better error navigation

### Testing
- **vim-test**: Run tests with leader+t prefix
- **Supports**: Jest, Mocha, RSpec, Minitest, and more

### Key Mappings
- **File Search**: `<leader>ff` (files), `<leader>fg` (grep), `<leader>fp` (projects)
- **Git**: `<leader>gs` (status), `<leader>gb` (branches), `<leader>gc` (commits)
- **Testing**: `<leader>tn` (nearest), `<leader>tf` (file), `<leader>ts` (suite)
- **Rails**: `<leader>rc` (console), `<leader>rs` (server), `<leader>rm` (migrate)
- **Debugging**: `<leader>db` (breakpoint), `<leader>dc` (continue), `<leader>du` (UI)
- **LSP**: `gd` (definition), `gr` (references), `K` (hover), `<leader>ca` (code action)
- **Diagnostics**: `<leader>xx` (toggle), `[d`/`]d` (navigate)

### Claude Code Integration Tips
1. **File Navigation**: Use Telescope commands for quick file access
2. **Code Intelligence**: LSP provides accurate go-to-definition and references
3. **Auto-completion**: Works seamlessly with Claude's suggestions
4. **Formatting**: Automatic formatting ensures consistent code style
5. **Git Workflow**: Integrated git commands for smooth version control

## Installation Notes

After updating the configuration, restart Neovim and run:
```bash
:MasonInstallAll
```

This will install all the configured language servers and tools.

## Useful Commands

- `:Telescope find_files` - Find files in project
- `:Telescope live_grep` - Search text in project
- `:Telescope projects` - Switch between projects
- `:Trouble` - View all diagnostics
- `:TestNearest` - Run test under cursor
- `:Rails console` - Open Rails console
- `:lua vim.lsp.buf.hover()` - Show hover documentation
- `:lua vim.lsp.buf.code_action()` - Show available code actions