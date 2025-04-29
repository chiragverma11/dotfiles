local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "]g", ":Gitsigns next_hunk<CR>", desc = "Gitsigns Next hunk" },
      { "[g", ":Gitsigns prev_hunk<CR>", desc = "Gitsigns Previous hunk" },
      { "<leader>ph", ":Gitsigns preview_hunk<CR>", desc = "Gitsigns preview hunk" },
    },
    opts = overrides.gitsigns,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "sindrets/diffview.nvim",
    cmd = {
      "DiffviewOpen",
      "DiffviewClose",
      "DiffviewToggleFiles",
      "DiffviewFocusFiles",
      "DiffviewRefresh",
      "DiffviewFileHistory",
      "DiffviewLog",
    },
    keys = {
      { "<leader>gdv", "<cmd>DiffviewFileHistory %<cr>", desc = "View git history for current file" },
      { "<leader>gdh", "<cmd>DiffviewFileHistory<cr>", desc = "View git history for repo" },
      { "<leader>gdo", "<cmd>DiffviewOpen<cr>", desc = "View modified files" },
      { "<leader>gdc", "<cmd>DiffviewClose<cr>", desc = "Close Diffview" },
    },
    opts = {
      keymaps = {
        view = { ["q"] = "<Cmd>DiffviewClose<CR>" },
        file_panel = { ["q"] = "<Cmd>DiffviewClose<CR>" },
        file_history_panel = { ["q"] = "<Cmd>DiffviewClose<CR>" },
      },
    },
  },
}
