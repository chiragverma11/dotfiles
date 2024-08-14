---@type NvPluginSpec[]
return {
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = { "typescript", "typescriptreact", "typescript.tsx" },
    opts = {
      keymaps = {
        toggle = "<leader>dd", -- Toggling keymap
        go_to_definition = "<leader>dx", -- Go to problematic type from popup window
      },
    },
  },
}
