local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },
}
