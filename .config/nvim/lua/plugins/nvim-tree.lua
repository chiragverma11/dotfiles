local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvim_tree,
  },
}
