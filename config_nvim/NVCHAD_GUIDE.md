# NvChad Beginner's Guide for Daily Development

This guide covers the essential features and commands for using NvChad effectively in your daily React/Rails development workflow.

## Table of Contents
1. [Basic Navigation](#basic-navigation)
2. [File Management](#file-management)
3. [Finding and Searching](#finding-and-searching)
4. [Git Commands](#git-commands)
5. [Rails Navigation](#rails-navigation)
6. [Code Intelligence (LSP)](#code-intelligence-lsp)
7. [Testing](#testing)
8. [Debugging](#debugging)
9. [Essential Tips](#essential-tips)

## Basic Navigation

### NvimTree (File Explorer)
- **Toggle NvimTree**: `<C-n>` (Ctrl+n)
- **Navigate**: Use `j`/`k` to move up/down
- **Open file**: `<Enter>` or `o`
- **Open in split**: `s` (horizontal), `v` (vertical)
- **Create new file**: `a`
- **Delete file**: `d`
- **Rename file**: `r`
- **Copy file**: `c`
- **Paste file**: `p`
- **Refresh tree**: `R`
- **Show hidden files**: `H`
- **Close node**: `h`
- **Open node**: `l`

### Buffer Navigation
- **Next buffer**: `<Tab>`
- **Previous buffer**: `<S-Tab>` (Shift+Tab)
- **Close buffer**: `<leader>x`
- **List buffers**: `<leader>fb` (find buffers)

### Window Management
- **Split horizontally**: `<C-w>s`
- **Split vertically**: `<C-w>v`
- **Navigate windows**: `<C-h>`, `<C-j>`, `<C-k>`, `<C-l>`
- **Close window**: `<C-w>q`
- **Resize window**: `<C-w>+`, `<C-w>-`, `<C-w><`, `<C-w>>`

## File Management

### Finding Files (Telescope)
The leader key is `<Space>` by default.

- **Find files**: `<leader>ff` - Search all files in project
- **Find in git files**: `<leader>fg` - Only git-tracked files
- **Recent files**: `<leader>fo` - Recently opened files
- **Find buffers**: `<leader>fb` - Currently open buffers
- **Find in current buffer**: `<leader>fz` - Search within current file

### Searching Text
- **Live grep**: `<leader>fw` - Search text across all files
- **Grep word under cursor**: `<leader>fw` (with cursor on word)
- **Resume last search**: `<leader>fr`

### Project Management
- **Switch projects**: `<leader>fp` - Shows list of recent projects
- **Quick project files**: Once in a project, use `<leader>ff` to find files

## Git Commands

### Gitsigns (Inline Git Info)
- **Next hunk**: `]c`
- **Previous hunk**: `[c`
- **Stage hunk**: `<leader>hs`
- **Undo stage hunk**: `<leader>hu`
- **Reset hunk**: `<leader>hr`
- **Preview hunk**: `<leader>hp`
- **Blame line**: `<leader>hb`
- **Toggle blame**: `<leader>tb`
- **Diff this**: `<leader>hd`

### Neogit (Git UI)
- **Open Neogit**: `<leader>gs` - Full git status interface
- **View branches**: `<leader>gb`
- **View commits**: `<leader>gc`

In Neogit interface:
- `s` - Stage file/hunk
- `u` - Unstage file/hunk
- `c` - Commit menu (then `c` again to commit)
- `P` - Push menu
- `F` - Pull menu
- `?` - Help

## Rails Navigation

### vim-rails Commands
- **Alternate file**: `<leader>ra` - Switch between model/controller/view
- **Related file**: `<leader>rr` - Go to related file
- **Model**: `<leader>rm` - Go to model
- **View**: `<leader>rv` - Go to view
- **Controller**: `<leader>rc` - Go to controller
- **Helper**: `<leader>rh` - Go to helper

### Rails Commands
- **Rails console**: `:Rails console` or `<leader>rc`
- **Rails server**: `:Rails server` or `<leader>rs`
- **Rails migration**: `:Rails db:migrate` or `<leader>rm`
- **Generate**: `:Rails generate [type] [name]`

### Quick Rails Navigation
- In a controller action, use `gf` on a render/redirect path to jump to that view
- Use `:A` to go to alternate file (test/implementation)
- Use `:R` to go to related file

## Code Intelligence (LSP)

### Navigation
- **Go to definition**: `gd`
- **Go to type definition**: `gy`
- **Go to implementation**: `gi`
- **Find references**: `gr`
- **Go back**: `<C-o>`
- **Go forward**: `<C-i>`

### Code Actions
- **Hover documentation**: `K`
- **Signature help**: `<leader>sh`
- **Code actions**: `<leader>ca` - Auto-imports, fixes, refactors
- **Rename symbol**: `<leader>rn`
- **Format document**: `<leader>fm`

### Diagnostics
- **Show all diagnostics**: `<leader>xx`
- **Next diagnostic**: `]d`
- **Previous diagnostic**: `[d`
- **Show diagnostic details**: `<leader>e`
- **Document diagnostics**: `<leader>xd`
- **Workspace diagnostics**: `<leader>xw`

## Testing

### Running Tests
- **Test nearest**: `<leader>tn` - Run test under cursor
- **Test file**: `<leader>tf` - Run all tests in current file
- **Test suite**: `<leader>ts` - Run all tests
- **Test last**: `<leader>tl` - Re-run last test
- **Test visit**: `<leader>tv` - Go to test file

### Test Frameworks Supported
- JavaScript: Jest, Mocha, Vitest
- Ruby: RSpec, Minitest
- And more via vim-test

## Debugging

### DAP (Debug Adapter Protocol)
- **Toggle breakpoint**: `<leader>db`
- **Continue**: `<leader>dc`
- **Step over**: `<leader>do`
- **Step into**: `<leader>di`
- **Step out**: `<leader>dO`
- **Toggle UI**: `<leader>du`
- **Terminate**: `<leader>dt`

### Debug Node.js/TypeScript
1. Set breakpoint: `<leader>db`
2. Start debugging: `<leader>dc`
3. Use debug UI to inspect variables

## Essential Tips

### Auto-completion
- **Trigger completion**: `<C-Space>` or start typing
- **Navigate suggestions**: `<Tab>`/`<S-Tab>` or `<C-n>`/`<C-p>`
- **Accept suggestion**: `<Enter>`
- **Cancel**: `<Esc>`

### Quick Edits
- **Comment line**: `gcc`
- **Comment selection**: `gc` (in visual mode)
- **Auto-format**: Happens on save, or `<leader>fm`
- **Multiple cursors**: `<C-n>` (select word), repeat for more

### Command Mode Tips
- **Command history**: `:` then `<C-p>`/`<C-n>`
- **Search history**: `/` then `<C-p>`/`<C-n>`
- **Quick save**: `:w` or `<C-s>`
- **Save and quit**: `:wq` or `ZZ`
- **Quit without saving**: `:q!` or `ZQ`

### Terminal
- **Open terminal**: `:terminal` or `:term`
- **Terminal normal mode**: `<C-\><C-n>`
- **Close terminal**: `exit` or `:q`

### Package Management (Node.js)
- **Install packages**: `<leader>ni` - Interactive npm install
- **Update packages**: `<leader>nu`
- **Remove packages**: `<leader>nr`

### Useful Combinations
1. **Quick file switch**: `<leader>ff` + type filename + `<Enter>`
2. **Find and replace**: `<leader>fw` + search + `<C-q>` + edit in quickfix
3. **Jump to error**: `<leader>xx` + navigate + `<Enter>`
4. **Quick git commit**: `<leader>gs` + `s` (stage) + `cc` (commit)

### Performance Tips
- Use `<leader>ff` instead of NvimTree for finding files
- Use `gd` for quick definition jumps
- Use marks (`ma`, `'a`) for quick navigation
- Use `<C-o>` and `<C-i>` to jump through history

## Common Workflows

### React Component Development
1. Find component: `<leader>ff` + component name
2. Jump to imports: `gg`
3. Add import: `<leader>ca` on unimported component
4. Format: Auto-saves with Prettier
5. Test: `<leader>tn` on test

### Rails CRUD Operations
1. Generate: `:Rails generate scaffold Post title:string`
2. Migrate: `<leader>rm`
3. Jump between MVC: `<leader>ra`
4. Test: `<leader>tf` in spec file
5. Console testing: `:Rails console`

### Git Workflow
1. Check status: `<leader>gs`
2. Stage changes: `s` on files in Neogit
3. Commit: `cc` + write message + `<C-c><C-c>`
4. Push: `Pu` (push upstream)
5. View history: `<leader>gc`

Remember: The leader key is `<Space>`. Most commands start with `<leader>` followed by a mnemonic key combination!