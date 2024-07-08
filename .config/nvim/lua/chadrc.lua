-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "github_dark",

  hl_add = {
    DiagnosticUnderlineError = { sp = "#ef5350", undercurl = true },
    DiagnosticUnderlineWarn = { sp = "#f4d03f", undercurl = true },
  },

  hl_override = {
    FoldColumn = { bg = "NONE" },
  },
}

return M
