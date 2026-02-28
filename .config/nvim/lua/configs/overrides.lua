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
    "java",
    "rust",
    "ron",
    "glsl",
    "astro",
    "svelte",
  },
  indent = {
    enable = true,
    disable = {},
  },
  highlight = {
    enable = true,
    use_languagetree = true,
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
    "eslint_d",
    "yaml-language-server",

    -- shell stuff
    "shfmt",

    -- emmet stuff
    "emmet-language-server",

    -- java stuff
    "java-test",
    "java-debug-adapter",

    -- rust stuff
    "rust-analyzer",
    "bacon",
    "bacon-ls",
    "codelldb",

    -- markdown stuff
    "marksman",
    "markdown-toc",

    -- docker stuff
    "hadolint",
    "docker-compose-language-service",
    "dockerfile-language-server",

    -- glsl/opengl
    "glsl_analyzer",

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
  renderer = {
    highlight_git = true,
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

M.devicons = {
  override = require "nvchad.icons.devicons",
  override_by_extension = {
    -- glsl
    -- icon color #9c0808 or #5487a5
    ["glsl"] = { icon = "", color = "#5487a5", name = "Glsl" },
    ["frag"] = { icon = "", color = "#5487a5", name = "Glsl" },
    ["vert"] = { icon = "", color = "#5487a5", name = "Glsl" },
    ["fs"] = { icon = "", color = "#5487a5", name = "Glsl" },
    ["vs"] = { icon = "", color = "#5487a5", name = "Glsl" },
  },
}

return M
