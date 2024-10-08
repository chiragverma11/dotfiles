---@type NvPluginSpec[]
return {
  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    ft = { "typescript", "typescriptreact", "typescript.tsx" },
    opts = {
      keymaps = {
        toggle = "<leader>ld", -- Toggling keymap
        go_to_definition = "<leader>lx", -- Go to problematic type from popup window
      },
    },
  },
}
