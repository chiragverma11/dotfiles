local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "nvim-tree/nvim-web-devicons",
    opts = overrides.devicons,
  },
}
