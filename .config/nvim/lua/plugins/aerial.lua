---@type NvPluginSpec[]
return {
  {
    "stevearc/aerial.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    cmd = {
      "AerialToggle",
      "AerialPrev",
      "AerialNext",
    },
    keys = {
      { "<leader>ae", "<cmd>AerialToggle!left<CR>", desc = "Aerial", mode = { "n" } },
      { "{", "<cmd>AerialPrev<CR>", desc = "Aerial Prev", mode = { "n" } },
      { "}", "<cmd>AerialNext<CR>", desc = "Aerial Next", mode = { "n" } },
    },
    config = function(_, opts)
      require("aerial").setup { opts }
    end,
  },
}
