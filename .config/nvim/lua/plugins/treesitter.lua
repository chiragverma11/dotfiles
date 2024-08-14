local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },
}
