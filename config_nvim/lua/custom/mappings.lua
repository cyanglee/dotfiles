---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    
    -- Better window navigation
    ["<C-h>"] = { "<C-w>h", "Navigate to left window" },
    ["<C-l>"] = { "<C-w>l", "Navigate to right window" },
    ["<C-j>"] = { "<C-w>j", "Navigate to bottom window" },
    ["<C-k>"] = { "<C-w>k", "Navigate to top window" },
    
    -- File navigation
    ["<leader>ff"] = { "<cmd>Telescope find_files<cr>", "Find files" },
    ["<leader>fg"] = { "<cmd>Telescope live_grep<cr>", "Live grep" },
    ["<leader>fb"] = { "<cmd>Telescope buffers<cr>", "Find buffers" },
    ["<leader>fh"] = { "<cmd>Telescope help_tags<cr>", "Help tags" },
    ["<leader>fo"] = { "<cmd>Telescope oldfiles<cr>", "Recent files" },
    ["<leader>fp"] = { "<cmd>Telescope projects<cr>", "Find projects" },
    
    -- Git
    ["<leader>gs"] = { "<cmd>Telescope git_status<cr>", "Git status" },
    ["<leader>gb"] = { "<cmd>Telescope git_branches<cr>", "Git branches" },
    ["<leader>gc"] = { "<cmd>Telescope git_commits<cr>", "Git commits" },
    
    -- Diagnostics
    ["<leader>xx"] = { "<cmd>TroubleToggle<cr>", "Toggle diagnostics" },
    ["<leader>xw"] = { "<cmd>Trouble workspace_diagnostics<cr>", "Workspace diagnostics" },
    ["<leader>xd"] = { "<cmd>Trouble document_diagnostics<cr>", "Document diagnostics" },
    ["<leader>xl"] = { "<cmd>Trouble loclist<cr>", "Location list" },
    ["<leader>xq"] = { "<cmd>Trouble quickfix<cr>", "Quickfix list" },
    
    -- Testing
    ["<leader>tn"] = { "<cmd>TestNearest<cr>", "Test nearest" },
    ["<leader>tf"] = { "<cmd>TestFile<cr>", "Test file" },
    ["<leader>ts"] = { "<cmd>TestSuite<cr>", "Test suite" },
    ["<leader>tl"] = { "<cmd>TestLast<cr>", "Test last" },
    ["<leader>tv"] = { "<cmd>TestVisit<cr>", "Test visit" },
    
    -- Rails specific
    ["<leader>rc"] = { "<cmd>Rails console<cr>", "Rails console" },
    ["<leader>rs"] = { "<cmd>Rails server<cr>", "Rails server" },
    ["<leader>rg"] = { "<cmd>Rails generate<cr>", "Rails generate" },
    ["<leader>rm"] = { "<cmd>Rails db:migrate<cr>", "Rails migrate" },
    ["<leader>rr"] = { "<cmd>Rails routes<cr>", "Rails routes" },
    
    -- Package info (for package.json)
    ["<leader>ns"] = { "<cmd>lua require('package-info').show()<cr>", "Show package info" },
    ["<leader>nc"] = { "<cmd>lua require('package-info').hide()<cr>", "Hide package info" },
    ["<leader>nu"] = { "<cmd>lua require('package-info').update()<cr>", "Update package" },
    ["<leader>nd"] = { "<cmd>lua require('package-info').delete()<cr>", "Delete package" },
    ["<leader>ni"] = { "<cmd>lua require('package-info').install()<cr>", "Install package" },
    ["<leader>np"] = { "<cmd>lua require('package-info').change_version()<cr>", "Change package version" },
  },
  
  v = {
    -- Better indentation
    ["<"] = { "<gv", "Indent left" },
    [">"] = { ">gv", "Indent right" },
    
    -- Move selected lines
    ["J"] = { ":m '>+1<CR>gv=gv", "Move selection down" },
    ["K"] = { ":m '<-2<CR>gv=gv", "Move selection up" },
  },
  
  i = {
    -- Navigation in insert mode
    ["<C-h>"] = { "<Left>", "Move left" },
    ["<C-l>"] = { "<Right>", "Move right" },
    ["<C-j>"] = { "<Down>", "Move down" },
    ["<C-k>"] = { "<Up>", "Move up" },
  },
}

M.lspconfig = {
  n = {
    -- LSP navigation
    ["gD"] = { vim.lsp.buf.declaration, "Go to declaration" },
    ["gd"] = { vim.lsp.buf.definition, "Go to definition" },
    ["gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
    ["gr"] = { vim.lsp.buf.references, "Show references" },
    ["K"] = { vim.lsp.buf.hover, "Hover documentation" },
    ["<leader>ls"] = { vim.lsp.buf.signature_help, "Signature help" },
    ["<leader>D"] = { vim.lsp.buf.type_definition, "Type definition" },
    ["<leader>ra"] = { vim.lsp.buf.rename, "Rename" },
    ["<leader>ca"] = { vim.lsp.buf.code_action, "Code action" },
    ["<leader>f"] = { vim.lsp.buf.format, "Format document" },
    
    -- Diagnostics navigation
    ["[d"] = { vim.diagnostic.goto_prev, "Previous diagnostic" },
    ["]d"] = { vim.diagnostic.goto_next, "Next diagnostic" },
    ["<leader>q"] = { vim.diagnostic.setloclist, "Set loclist" },
  },
}

M.dap = {
  n = {
    -- Debugging
    ["<leader>db"] = { "<cmd>lua require('dap').toggle_breakpoint()<cr>", "Toggle breakpoint" },
    ["<leader>dB"] = { "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", "Conditional breakpoint" },
    ["<leader>dc"] = { "<cmd>lua require('dap').continue()<cr>", "Continue" },
    ["<leader>do"] = { "<cmd>lua require('dap').step_over()<cr>", "Step over" },
    ["<leader>di"] = { "<cmd>lua require('dap').step_into()<cr>", "Step into" },
    ["<leader>dO"] = { "<cmd>lua require('dap').step_out()<cr>", "Step out" },
    ["<leader>dr"] = { "<cmd>lua require('dap').repl.open()<cr>", "Open REPL" },
    ["<leader>dl"] = { "<cmd>lua require('dap').run_last()<cr>", "Run last" },
    ["<leader>du"] = { "<cmd>lua require('dapui').toggle()<cr>", "Toggle UI" },
    ["<leader>dt"] = { "<cmd>lua require('dap').terminate()<cr>", "Terminate" },
  },
}

return M
