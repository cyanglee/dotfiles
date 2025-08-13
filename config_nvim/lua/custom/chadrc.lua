---@type ChadrcConfig
local M = {}

-- Path to overriding theme and highlights files
local highlights = require "custom.highlights"

M.ui = {
  -- theme = "onedark",
  theme = "oceanic-next",
  theme_toggle = { "oceanic-next", "one_light" },

  hl_override = highlights.override,
  hl_add = highlights.add,
}

M.plugins = "custom.plugins"

-- check core.mappings for table structure
M.mappings = require "custom.mappings"

M.options = {
  -- other options here
  guifont = "JetbrainsMono Nerd Font:h14",  -- Replace YourFontName with your desired font name and h14 with the desired size
  -- other options here
}

return M
