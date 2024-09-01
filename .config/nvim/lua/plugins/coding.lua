---@type NvPluginSpec[]
return {
  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "numToStr/Comment.nvim" },
    opts = {
      enable_autocmd = false,
    },
    config = function(_, opts)
      require("ts_context_commentstring").setup(opts)
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup {
        mappings = {
          t = {
            j = {
              k = false,
            },
          },
        },
      }
    end,
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    lazy = false,
    opts = {
      opts = {
        enable_close_on_slash = true,
      },
    },
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts)
    end,
  },

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    config = function()
      require("treesj").setup {
        use_default_keymaps = false,
      }
    end,
  },
}
