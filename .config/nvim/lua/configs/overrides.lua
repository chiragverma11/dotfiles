local M = {}

M.treesitter = {
  ensure_installed = {
    "vim",
    "lua",
    "html",
    "css",
    "scss",
    "javascript",
    "typescript",
    "tsx",
    "markdown",
    "markdown_inline",
    "prisma",
    "json",
    "jsonc",
    "jsdoc",
    "yaml",
    "graphql",
    "dockerfile",
    "gitignore",
    "vimdoc",
    "bash",
    "regex",
  },
  indent = {
    enable = true,
    disable = {},
  },
  highlight = {
    enable = true,
    use_languagetree = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "gnn",
      node_incremental = "grn",
      scope_incremental = false,
      node_decremental = "grm",
    },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "prettier",
    "prettierd",
    "tailwindcss-language-server",
    "eslint-lsp",
    "json-lsp",
    "prisma-language-server",

    -- shell stuff
    "shfmt",

    -- emmet stuff
    "emmet-language-server",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

-- nvim-colorizer
M.nvim_colorizer = {
  fileTypes = {
    "!cmp_menu",
  },
  user_default_options = {
    tailwind = true,
  },
}

M.gitsigns = {
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "󰍵" },
    topdelete = { text = "‾" },
    changedelete = { text = "~" },
    untracked = { text = "┃" },
  },

  -- Left aligned signs
  -- signs = {
  --   add = { text = "▍" },
  --   change = { text = "▍" },
  --   delete = { text = "󰍵" },
  --   topdelete = { text = "‾" },
  --   changedelete = { text = "~" },
  --   untracked = { text = "▍" },
  -- },

  -- Signs options -> ┃ ▍‾ ▔
}

M.nvim_tree = {
  view = {
    width = 35,
    side = "right",
    number = true,
    relativenumber = true,
  },
}

M.rainbow_delimiters = {
  highlight = {
    "RainbowRed",
    "RainbowYellow",
    "RainbowBlue",
    "RainbowOrange",
    "RainbowGreen",
    "RainbowViolet",
    "RainbowCyan",
  },
}

return M
