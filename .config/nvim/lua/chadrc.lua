-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "github_dark",

  hl_add = {
    DiagnosticUnderlineError = { sp = "red", undercurl = true },
    DiagnosticUnderlineWarn = { sp = "yellow", undercurl = true },
  },

  hl_override = {
    FoldColumn = { bg = "NONE" },
  },

  tabufline = {
    order = { "buffers", "tabs", "btns", "treeOffset" },
  },
}

return M
