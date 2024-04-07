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
  autotag = {
    enable = true,
    enable_rename = true,
    enable_close = true,
    enable_close_on_slash = true,
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
    -- "deno",
    "prettier",
    "prettierd",
    "tailwindcss-language-server",
    "eslint-lsp",
    "json-lsp",
    "prisma-language-server",

    -- c/cpp stuff
    -- "clangd",
    -- "clang-format",

    -- shell stuff
    "shfmt",
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

M.blankline = {
  show_current_context_start = false,
}

return M
