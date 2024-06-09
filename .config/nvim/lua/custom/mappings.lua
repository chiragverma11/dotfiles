---@type MappingsTable
local M = {}

M.general = {
  n = {
    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      "Format with conform",
    },

    -- LazyGit loader
    ["<leader>gg"] = {
      ":LazyGit<CR>",
      "Open LazyGit",
    },

    -- tranparency toggle
    ["<leader>tt"] = {
      function()
        require("base46").toggle_transparency()
      end,
      "Toggle transparency",
    },

    -- Move Lines
    ["<A-j>"] = {
      ":m .+1<CR>==",
    },

    ["<A-k>"] = {
      ":m .-2<CR>==",
    },

    -- Close
    ["<leader>q"] = {
      ":wq<CR>",
    },
    ["<leader>Q"] = {
      ":qa!<CR>",
    },

    -- Clear Search Highlights
    ["<leader>nh"] = {
      ":noh<CR>",
      "Clear Search Highlights",
    },

    -- Increment/Decrement
    ["<leader>+"] = {
      "<C-a>",
      "Increment number",
    },
    ["<leader>-"] = {
      "<C-x>",
      "Decrement number",
    },

    -- window management
    ["<leader>sv"] = {
      "<C-w>v",
      "Split window vertically",
    },
    ["<leader>sh"] = {
      "<C-w>s",
      "Split window horizontally",
    },
    ["<leader>se"] = {
      "<C-w>=",
      "Make split windows equal width & height",
    },
    ["<leader>sx"] = {
      "<cmd>close<CR>",
      "Close current split window",
    },

    -- Vim Tmux Navigator
    ["<C-h>"] = {
      "<cmd> TmuxNavigateLeft<CR>",
      "Window left",
    },
    ["<C-j>"] = {
      "<cmd> TmuxNavigateDown<CR>",
      "Window down",
    },
    ["<C-k>"] = {
      "<cmd> TmuxNavigateUp<CR>",
      "Window up",
    },
    ["<C-l>"] = {
      "<cmd> TmuxNavigateRight<CR>",
      "Window right",
    },
  },

  v = {
    [">"] = { ">gv", "indent" },

    -- Move Lines
    ["<A-j>"] = {
      ":m '>+1<CR>gv=gv",
    },

    ["<A-k>"] = {
      ":m '<-2<CR>gv=gv",
    },
  },

  i = {
    ["<A-j>"] = {
      "<Esc>:m .+1<CR>==gi",
    },

    ["<A-k>"] = {
      "<Esc>:m .-2<CR>==gi",
    },
  },
}

-- more keybinds!

M.lspconfig = {
  plugin = true,

  n = {
    ["<leader>co"] = {
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { "source.organizeImports.ts" },
            diagnostics = {},
          },
        }
      end,
      "Organize Imports",
    },

    ["<leader>cR"] = {
      function()
        vim.lsp.buf.code_action {
          apply = true,
          context = {
            only = { "source.removeUnused.ts" },
            diagnostics = {},
          },
        }
      end,
      "Remove Unused Imports",
    },
  },
}

M.trouble = {
  n = {
    ["<leader>tx"] = {
      "<cmd>Trouble diagnostics toggle<cr>",
      "Diagnostics (Trouble)",
    },
    ["<leader>tb"] = {
      "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
      "Buffer Diagnostics (Trouble)",
    },
    ["<leader>td"] = {
      "<cmd>Trouble symbols toggle focus=false<cr>",
      "Symbols (Trouble)",
    },
    ["<leader>tl"] = {
      "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
      "LSP Definitions / references / ... (Trouble)",
    },
    ["<leader>tL"] = {
      "<cmd>Trouble loclist toggle<cr>",
      "Location List (Trouble)",
    },
    ["<leader>tq"] = {
      "<cmd>Trouble qflist toggle<cr>",
      "Quickfix List (Trouble)",
    },
  },
}

M.treesj = {
  n = {
    ["<leader>mt"] = {
      function()
        require("treesj").toggle()
      end,
      "Toggle Split Join",
    },
  },
}

M.tabufline = {
  plugin = true,
  n = {
    ["<leader>X"] = {
      function()
        require("nvchad.tabufline").closeAllBufs()
      end,
      "Close All Buffers",
    },
  },
}

M.vimMaximizer = {
  n = {
    ["<leader>sm"] = {
      "<cmd>MaximizerToggle<CR>",
      "Maximize/minimize a split",
    },
  },
}

M.nvimSpectre = {
  n = {
    ["<leader>sr"] = {
      function()
        require("spectre").open()
      end,
      "Replace in Files (Spectre)",
    },
  },
}

-- M.betterTsErrors = {
--   n={
-- ["<leader>dd"]= {
--      ""
--     }
--   }
-- }

return M
