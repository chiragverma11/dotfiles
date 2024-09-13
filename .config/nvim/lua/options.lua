require "nvchad.options"

local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/snippets"

-------------------------------------- options ------------------------------------------
opt.relativenumber = true
opt.breakindent = true
opt.linebreak = true

-------------------------------------- commands ------------------------------------------
local autocmd = vim.api.nvim_create_user_command

-- Commands to enable/disable autoformat-on-save
autocmd("FormatDisable", function(args)
  if args.bang then
    -- FormatDisable! will disable formatting just for this buffer
    vim.b.disable_autoformat = true
  else
    vim.g.disable_autoformat = true
  end
end, {
  desc = "Disable autoformat-on-save",
  bang = true,
})

autocmd("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

-- to sort diagnostics(virtual_text/floating) based on severity
vim.diagnostic.config { severity_sort = true }
