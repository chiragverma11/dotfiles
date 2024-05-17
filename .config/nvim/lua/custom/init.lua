local opt = vim.opt
local g = vim.g

-------------------------------------- globals -----------------------------------------
g.vscode_snippets_path = vim.fn.stdpath "config" .. "/lua/custom/snippets"

-------------------------------------- options ------------------------------------------
opt.relativenumber = true

-------------------------------------- commands ------------------------------------------
local new_cmd = vim.api.nvim_create_user_command

-- Commands to enable/disable autoformat-on-save
new_cmd("FormatDisable", function(args)
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

new_cmd("FormatEnable", function()
  vim.b.disable_autoformat = false
  vim.g.disable_autoformat = false
end, {
  desc = "Re-enable autoformat-on-save",
})

-- local autocmd = vim.api.nvim_create_autocmd

-- Auto resize panes when resizing nvim window
-- autocmd("VimResized", {
--   pattern = "*",
--   command = "tabdo wincmd =",
-- })
