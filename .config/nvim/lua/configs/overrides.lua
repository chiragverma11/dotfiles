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
  playground = {
    enable = true,
    disable = {},
    updatetime = 25, -- Debounced time for highlighting nodes in the playground from source code
    persist_queries = false, -- Whether the query persists across vim sessions
    keybindings = {
      toggle_query_editor = "o",
      toggle_hl_groups = "i",
      toggle_injected_languages = "t",
      toggle_anonymous_nodes = "a",
      toggle_language_display = "I",
      focus_language = "f",
      unfocus_language = "F",
      update = "R",
      goto_node = "<cr>",
      show_help = "?",
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
