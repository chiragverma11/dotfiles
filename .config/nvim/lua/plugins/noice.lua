---@type NvPluginSpec[]
return {
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      "rcarriga/nvim-notify",
    },
    opts = {
      noice = {
        lsp = {
          override = {
            ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
            ["vim.lsp.util.stylize_markdown"] = true,
            ["cmp.entry.get_documentation"] = true,
          },
          hover = {
            enabled = true,
            silent = true,
          },
          signature = {
            enabled = false,
          },
        },
        routes = {
          {
            filter = {
              event = "msg_show",
              any = {
                { find = "%d+L, %d+B" },
                { find = "; after #%d+" },
                { find = "; before #%d+" },
              },
            },
            view = "mini",
          },
          {
            -- enable showmode filter for macros messages
            -- https://github.com/folke/noice.nvim/wiki/A-Guide-to-Messages#showmode
            view = "notify",
            filter = { event = "msg_showmode" },
          },
        },
        presets = {
          command_palette = true, -- position the cmdline and popupmenu together
          bottom_search = true, -- use a classic bottom cmdline for search
          long_message_to_split = true, -- long messages will be sent to a split
          inc_rename = true, -- enables an input dialog for inc-rename.nvim
          lsp_doc_border = true, -- add a border to hover docs and signature help
        },
      },
      notify = {
        background_colour = "#000000",
        timeout = 3000,
      },
    },
    config = function(_, opts)
      require("noice").setup(opts.noice)
      require("notify").setup(opts.notify)
    end,
  },
}
