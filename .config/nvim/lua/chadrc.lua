-- This file needs to have same structure as nvconfig.lua
-- https://github.com/NvChad/ui/blob/v2.5/lua/nvconfig.lua

---@type ChadrcConfig
local M = {}

M.base46 = {
  theme = "doomchad",
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
    order = { "buffers", "tabs", "treeOffset" },
  },

  cmp = {
    format_colors = {
      tailwind = true,
    },
  },

  telescope = {
    style = "bordered",
  },

  statusline = {
    theme = "minimal",
    order = { "mode", "file", "git", "%=", "lsp_msg", "%=", "diagnostics", "lsp", "cwd", "cursor" },
    modules = {
      cursor = "%#St_Pos_sep#█%#St_Pos_bg# %#St_Pos_txt# %l/%c"
        .. "%#St_pos_txt#%p%%"
        .. "%#St_sep_r#█ %#ST_EmptySpace#",
    },
  },
}

M.nvdash = {
  load_on_startup = true,
}

return M
