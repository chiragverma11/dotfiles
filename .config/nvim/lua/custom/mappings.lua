---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },

    --  format with conform
    ["<leader>fm"] = {
      function()
        require("conform").format()
      end,
      "formatting",
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

return M
