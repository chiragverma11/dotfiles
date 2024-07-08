require "nvchad.mappings"

local map = vim.keymap.set

-- General
map({ "n", "v" }, "<C-s>", ":w<CR>", { desc = "General " .. "Save File", silent = true })

map("i", "<C-s>", "<Esc>:w<CR>a", { desc = "General " .. "Save File", silent = true })

map("n", "<leader>fm", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "General " .. "Format with conform" })

map("n", "<leader>tt", function()
  require("base46").toggle_transparency()
end, { desc = "General " .. "Toggle transparency" })

map("v", "<", "<gv", { desc = "General " .. "Dedent", silent = true })
map("v", ">", ">gv", { desc = "General " .. "Indent", silent = true })

-- Move Lines
map("n", "<A-j>", ":m .+1<CR>==", { desc = "Move line down", silent = true })
map("n", "<A-k>", ":m .-2<CR>==", { desc = "Move line up", silent = true })
map("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down", noremap = true, silent = true })
map("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up", noremap = true, silent = true })
map("i", "<A-j>", "<Esc>:m .+1<CR>==gi", { desc = "Move line down", silent = true })
map("i", "<A-k>", "<Esc>:m .-2<CR>==gi", { desc = "Move line up", silent = true })

-- Close
map("n", "<leader>q", ":wq<CR>", { desc = "General " .. "Close" })
map("n", "<leader>Q", ":qa!<CR>", { desc = "General " .. "Close" })

-- Clear Search Highlights
map("n", "<leader>nh", ":nohl<CR>", { desc = "General " .. "Clear search highlights", silent = true })

-- Tab Management
map("n", "<leader>to", ":tabnew<CR>", { desc = "Tab " .. "New Tab" })
map("n", "<leader>tx", ":tabclose<CR>", { desc = "Tab " .. "Close Tab" })
map("n", "<leader>tn", ":tabn<CR>", { desc = "Tab " .. "Next Tab" })
map("n", "<leader>tp", ":tabp<CR>", { desc = "Tab " .. "Previous Tab" })

-- Git
map("n", "<leader>gg", ":LazyGit<CR>", { desc = "Git " .. "Open Lazygit" })

-- Split Management
map("n", "<leader>sv", "<C-w>v", { desc = "Split " .. "Split Window Vertically" })
map("n", "<leader>sH", "<C-w>s", { desc = "Split " .. "Split Window Horizontally" })
map("n", "<leader>se", "<C-w>=", { desc = "Split " .. "Make split windows equal in width & height" })
map("n", "<leader>sx", ":close<CR>", { desc = "Split " .. "Close Window" })

-- Vim Tmux Navigator
map("n", "<C-h>", "<cmd> TmuxNavigateLeft<CR>", { desc = "Vim_Tmux_Navigator " .. "Window left" })
map("n", "<C-j>", "<cmd> TmuxNavigateDown<CR>", { desc = "Vim_Tmux_Navigator " .. "Window down" })
map("n", "<C-k>", "<cmd> TmuxNavigateUp<CR>", { desc = "Vim_Tmux_Navigator " .. "Window up" })
map("n", "<C-l>", "<cmd> TmuxNavigateRight<CR>", { desc = "Vim_Tmux_Navigator " .. "Window right" })

-- LspConfig
map("n", "<leader>lf", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "LSP " .. "Show line diagnostics", noremap = true, silent = true })

map("n", "<leader>co", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { "source.organizeImports.ts" },
      diagnostics = {},
    },
  }
end, { desc = "LSP " .. "Organize Imports" })

map("n", "<leader>cR", function()
  vim.lsp.buf.code_action {
    apply = true,
    context = {
      only = { "source.removeUnused.ts" },
      diagnostics = {},
    },
  }
end, { desc = "LSP " .. "Remove Unused Imports" })

-- Trouble Plugin
map("n", "<leader>td", ":Trouble diagnostics toggle<CR>", { desc = "Trouble " .. "Diagnostics" })
map("n", "<leader>tb", ":Trouble diagnostics toggle filter.buf=0<CR>", { desc = "Trouble " .. "Buffer Diagnostics" })
map("n", "<leader>ts", ":Trouble symbols toggle focus=false<CR>", { desc = "Trouble " .. "Symbols" })
map(
  "n",
  "<leader>tl",
  ":Trouble lsp toggle focus=false win.position=right<CR>",
  { desc = "Trouble " .. "LSP Definitions / references / ..." }
)
map("n", "<leader>tL", ":Trouble loclist toggle<CR>", { desc = "Trouble " .. "Location List" })
map("n", "<leader>tq", ":Trouble qflist toggle<CR>", { desc = "Trouble " .. "Quickfix List" })

-- TreeSJ
map("n", "<leader>mt", function()
  require("treesj").toggle()
end, { desc = "TreeSJ " .. "Toggle Split Join" })

-- Tabufline
map("n", "<leader>X", function()
  require("nvchad.tabufline").closeAllBufs()
end, { desc = "Tabufline " .. "Close All Buffers" })

-- VimMaximizer
map("n", "<leader>sm", ":MaximizerToggle<CR>", { desc = "VimMaximizer " .. "Maximize/minimize a split" })

-- NvimSpectre
map("n", "<leader>sr", function()
  require("spectre").open()
end, { desc = "NvimSpectre " .. "Replace in Files" })

-- NvimNotify
map("n", "<leader>dn", function()
  require("notify").dismiss()
end, { desc = "NvimNotify " .. "Dismiss all notifications" })

map("i", "<C-d>", function()
  require("notify").dismiss()
end, { desc = "NvimNotify " .. "Dismiss all notifications" })
