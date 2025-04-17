---@type NvPluginSpec[]
return {
  {
    "yioneko/nvim-cmp",
    branch = "perf",

    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2, max_item_count = 6 },
        { name = "buffer", keyword_length = 3, max_item_count = 6, group_index = 2 },
        { name = "path", keyword_length = 1 },
        { name = "nvim_lua", keyword_length = 1, group_index = 2 },
      },
      completion = {
        keyword_length = 1,
      },
      mapping = {
        ["<c-a>"] = require("cmp").mapping.abort(),
      },
    },

    dependencies = {
      {
        "hrsh7th/cmp-cmdline",
        event = { "CmdLineEnter" },
        opts = { history = true, updateevents = "CmdlineEnter,CmdlineChanged" },
        config = function()
          local cmp = require "cmp"

          cmp.setup.cmdline({ "/", "?" }, {
            mapping = cmp.mapping.preset.cmdline(),
            sources = {
              { name = "buffer" },
            },
          })

          -- `:` cmdline setup.
          cmp.setup.cmdline(":", {
            mapping = cmp.mapping.preset.cmdline {
              ["<CR>"] = {
                c = function(default)
                  if cmp.visible() then
                    return cmp.confirm { select = true }
                  end

                  default()
                end,
              },
            },
            sources = cmp.config.sources({
              { name = "path" },
            }, {
              {
                name = "cmdline",
                option = {
                  ignore_cmds = { "Man", "!" },
                },
              },
            }),
          })
        end,
      },
    },
  },
}
