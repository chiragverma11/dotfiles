local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "mason-org/mason.nvim",
    opts = overrides.mason,
  },
}
