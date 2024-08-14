local overrides = require "configs.overrides"

---@type NvPluginSpec[]
return {
  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "]g", ":Gitsigns next_hunk<CR>", desc = "Gitsigns Next hunk" },
      { "[g", ":Gitsigns prev_hunk<CR>", desc = "Gitsigns Previous hunk" },
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
  },
}
