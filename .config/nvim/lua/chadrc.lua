-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "tokyonight",
  transparency = true,

  hl_add = {
    DiagnosticUnderlineError = { sp = "red", undercurl = true },
    DiagnosticUnderlineWarn = { sp = "yellow", undercurl = true },

    -- rainbow delimiters
    RainbowRed = { fg = "red" },
    RainbowYellow = { fg = "sun" },
    RainbowBlue = { fg = "blue" },
    RainbowOrange = { fg = "orange" },
    RainbowGreen = { fg = "vibrant_green" },
    RainbowViolet = { fg = "dark_purple" },
    RainbowCyan = { fg = "cyan" },
  },

  hl_override = {
    FoldColumn = { bg = "NONE" },
  },
}

M.ui = {
  tabufline = {
    order = { "buffers", "tabs", "btns", "treeOffset" },
  },

  statusline = {
    theme = "minimal",
  },
}

return M
