local overrides = require "configs.overrides"

-- there are multiple plugins for color highlighting and color picker, these are some of those
-- @see https://github.com/catgoose/nvim-colorizer.lua
-- @see https://github.com/eero-lehtinen/oklch-color-picker.nvim
-- @see https://github.com/norcalli/nvim-colorizer.lua
-- @see https://github.com/ziontee113/color-picker.nvim
-- @see https://github.com/max397574/colortils.nvim
---@type NvPluginSpec[]

-- New pattern to be added
-- local css_hsl_variable_pattern = "()--(%w+):%s*(%d+)%s+(%d+%)%s+(%d+%)%s*;?()"

return {
  {
    "max397574/colortils.nvim",
    enabled = false,
    cmd = "Colortils",
    config = function()
      require("colortils").setup()
    end,
  },
  {
    "ziontee113/color-picker.nvim",
    enabled = false,
    cmd = {
      "PickColor",
      "PickColorInsert",
    },
    keys = {
      { "<leader>cp", "<cmd>PickColor<cr>", desc = "Pick Color" },
      { "<leader>ci", "<cmd>PickColorInsert<cr>", desc = "Pick Color Insert" },
    },
    config = function()
      require "color-picker"
    end,
  },
  {
    "eero-lehtinen/oklch-color-picker.nvim",
    -- enabled = false,
    event = "VeryLazy",
    opts = {
      highlight = {
        style = "virtual_left",
        virtual_text = "󱓻 ",
      },
      patterns = {
        numbers_in_brackets = false,

        -- -- New CSS Variable HSL Pattern
        -- css_variable_hsl = {
        --   priority = 5, -- Higher priority to ensure it's processed first
        --   format = "hsl", -- Specify the format for the picker
        --   ft = { "css", "scss", "postcss" }, -- Apply to CSS-related filetypes
        --   custom_parse = function(match)
        --     -- Extract HSL values from the matched text
        --     local h, s, l = match:match "(%d+)%s+(%d+%%)%s+(%d+%%)"
        --     if h then
        --       return {
        --         h = tonumber(h),
        --         s = tonumber(s:sub(1, -2)), -- Remove % and convert to number
        --         l = tonumber(l:sub(1, -2)),
        --       }
        --     end
        --   end,
        --   -- Pattern to match CSS variables with HSL values
        --   "()--[%w-]+:%s*()%d+%s+%d+%%%s+%d+%%%f[%W]()",
        -- },

        -- Add the new css_hsl_variable pattern here
        -- css_hsl_variable = {
        --   priority = -1, -- Adjust priority as needed, e.g., same as css_hsl
        --   -- format = 'raw_hsl', -- You can specify format if needed, or let it auto-detect
        --   css_hsl_variable_pattern,
        -- },
      },
    },
    keys = {
      -- One handed keymap recommended, you will be using the mouse
      { "<leader>v", "<cmd>ColorPickOklch<cr>", desc = "Color pick under cursor" },
    },
  },

  {
    "catgoose/nvim-colorizer.lua",
    enabled = false,
    opts = overrides.nvim_colorizer,
  },
}
