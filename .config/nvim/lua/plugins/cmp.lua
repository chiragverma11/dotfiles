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

  -- Blink integration
  -- @see https://github.com/NvChad/NvChad/discussions/3244
  { import = "nvchad.blink.lazyspec" },

  {
    "saghen/blink.cmp",
    dependencies = { "alexandre-abrioux/blink-cmp-npm.nvim" },
    opts = {
      enabled = function()
        local disabled_filetypes = { "NvimTree", "DressingInput", "snacks_input", "snacks_picker_input" } -- Add extra fileypes you do not want blink enabled.
        return not vim.tbl_contains(disabled_filetypes, vim.bo.filetype)
      end,
      completion = {
        ghost_text = { enabled = false },
        -- menu = {
        --   auto_show = true,
        -- },
      },
      cmdline = {
        completion = {
          menu = {
            auto_show = true,
          },
          list = {
            selection = {
              preselect = true,
              auto_insert = true,
            },
          },
        },
      },
      sources = {
        default = { "lsp", "snippets", "buffer", "path", "npm" },
        providers = {
          cmdline = {
            min_keyword_length = function(ctx)
              -- when typing a command, only show when the keyword is 3 characters or longer
              if ctx.mode == "cmdline" and string.find(ctx.line, " ") == nil then
                return 3
              end
              return 0
            end,
          },

          npm = {
            name = "npm",
            module = "blink-cmp-npm",
            async = true,
          },
        },
      },
    },
  },
}
