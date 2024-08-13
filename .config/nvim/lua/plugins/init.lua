local overrides = require "configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvim_tree,
  },

  {
    "NvChad/nvim-colorizer.lua",
    opts = overrides.nvim_colorizer,
  },

  {
    "lewis6991/gitsigns.nvim",
    keys = {
      { "]g", ":Gitsigns next_hunk<CR>", desc = "Gitsigns Next hunk" },
      { "[g", ":Gitsigns prev_hunk<CR>", desc = "Gitsigns Previous hunk" },
    },
    opts = overrides.gitsigns,
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    version = "*",
    event = "User FilePost",
    main = "ibl",
    config = function()
      local hooks = require "ibl.hooks"

      require("ibl").setup {
        indent = { char = "▏" },
        scope = {
          highlight = overrides.rainbow_delimiters.highlight,
          show_exact_scope = false,
          show_end = false,
          include = {
            node_type = {
              lua = { "return_statement", "table_constructor" },
            },
          },
        },
      }

      hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
    end,
  },

  {
    "numToStr/Comment.nvim",
    event = "BufReadPost",
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    config = function()
      require("Comment").setup {
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      }
    end,
  },

  -- Install a plugin

  {
    "hiphish/rainbow-delimiters.nvim",
    lazy = false,
    config = function()
      local rainbow_delimiters = require "rainbow-delimiters"

      ---@type rainbow_delimiters.config
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          commonlisp = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          lua = "rainbow-blocks",
          javascript = "rainbow-parens",
          typescript = "rainbow-parens",
          tsx = "rainbow-parens",
        },
        priority = {
          [""] = 110,
          lua = 210,
        },
        highlight = overrides.rainbow_delimiters.highlight,
        blacklist = { "c", "cpp" },
      }
    end,
  },

  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  {
    "stevearc/conform.nvim",
    --  for users those who want auto-save conform + lazyloading!
    event = "BufWritePre",
    config = function()
      require "configs.conform"
    end,
  },

  {
    "hrsh7th/nvim-cmp",

    opts = {
      sources = {
        { name = "nvim_lsp" },
        { name = "luasnip", keyword_length = 2, max_item_count = 6 },
        { name = "buffer", keyword_length = 3, max_item_count = 6, group_index = 2 },
        { name = "path", keyword_length = 1 },
        { name = "nvim_lua", keyword_length = 1 },
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

  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        config = true,
      },
    },
    opts = function(_, opts)
      local format_kinds = opts.formatting.format
      opts.formatting.format = function(entry, item)
        format_kinds(entry, item)
        return require("tailwindcss-colorizer-cmp").formatter(entry, item)
      end
    end,
  },

  {
    "rmagatti/auto-session",
    lazy = false,
    config = function()
      require("auto-session").setup {
        log_level = "error",
        auto_session_suppress_dirs = { "~/", "~/Projects", "~/Downloads", "/" },
      }
    end,
  },

  {
    "kdheepak/lazygit.nvim",
    cmd = {
      "LazyGit",
      "LazyGitConfig",
      "LazyGitCurrentFile",
      "LazyGitFilter",
      "LazyGitFilterCurrentFile",
    },
    -- optional for floating window border decoration
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
  },

  {
    "Exafunction/codeium.vim",
    event = "BufEnter",
  },

  {
    "folke/trouble.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    cmd = "Trouble",
    opts = {},
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability; omit to use `main` branch for the latest features
    event = { "BufReadPre", "BufNewFile" },
    config = function()
      require("nvim-surround").setup {}
    end,
  },

  {
    "windwp/nvim-ts-autotag",
    -- event = { "BufReadPre", "BufNewFile" },
    lazy = false,
    opts = {
      opts = {
        enable_close_on_slash = true,
      },
    },
    config = function(_, opts)
      require("nvim-ts-autotag").setup(opts)
    end,
  },

  {
    "folke/zen-mode.nvim",
    cmd = {
      "Zenmode",
    },
  },

  {
    "Wansmer/treesj",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
    cmd = { "TSJToggle", "TSJSplit", "TSJJoin" },
    config = function()
      require("treesj").setup {
        use_default_keymaps = false,
      }
    end,
  },

  {
    "stevearc/dressing.nvim",
    event = "VeryLazy",
  },

  {
    "szw/vim-maximizer",
    cmd = { "MaximizerToggle" },
  },

  {
    "christoomey/vim-tmux-navigator",
    lazy = false,
  },

  {
    "kevinhwang91/nvim-bqf",
    event = "VeryLazy",
    opts = {},
  },

  {
    "utilyre/barbecue.nvim",
    event = "BufEnter",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {},
    config = function(_, opts)
      require("barbecue").setup(opts)
    end,
  },

  {
    "OlegGulevskyy/better-ts-errors.nvim",
    dependencies = { "MunifTanjim/nui.nvim" },
    event = "VeryLazy",
    opts = {
      keymaps = {
        toggle = "<leader>dd", -- Toggling keymap
        go_to_definition = "<leader>dx", -- Go to problematic type from popup window
      },
    },
    config = function(_, opts)
      require("better-ts-errors").setup(opts)
    end,
  },

  {
    "sindrets/diffview.nvim",
    event = "VeryLazy",
  },

  {
    "folke/flash.nvim",
    event = "VeryLazy",
    ---@type Flash.Config
    opts = {},
    keys = {
      {
        "s",
        mode = { "n", "x", "o" },
        function()
          require("flash").jump()
        end,
        desc = "Flash",
      },
      {
        "S",
        mode = { "n", "x", "o" },
        function()
          require("flash").treesitter()
        end,
        desc = "Flash Treesitter",
      },
      {
        "r",
        mode = "o",
        function()
          require("flash").remote()
        end,
        desc = "Remote Flash",
      },
      {
        "R",
        mode = { "o", "x" },
        function()
          require("flash").treesitter_search()
        end,
        desc = "Treesitter Search",
      },
      {
        "<c-s>",
        mode = { "c" },
        function()
          require("flash").toggle()
        end,
        desc = "Toggle Flash Search",
      },
    },

    -- Similar Plugins -> Bekaboo/dropbar.nvim
  },

  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = { "numToStr/Comment.nvim" },
    opts = {
      enable_autocmd = false,
    },
    config = function(_, opts)
      require("ts_context_commentstring").setup(opts)
    end,
  },

  {
    "nvim-pack/nvim-spectre",
    cmd = "Spectre",
    opts = { open_cmd = "noswapfile vnew" },
  },

  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = "VeryLazy",
    opts = {},
  },

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
            silent = false,
          },
          signature = {
            enabled = true,
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

  {
    "smoka7/multicursors.nvim",
    event = "VeryLazy",
    dependencies = {
      "smoka7/hydra.nvim",
    },
    opts = {},
    cmd = { "MCstart", "MCvisual", "MCclear", "MCpattern", "MCvisualPattern", "MCunderCursor" },
    keys = {
      {
        mode = { "v", "n" },
        "<Leader>m",
        "<cmd>MCstart<cr>",
        desc = "Create a selection for selected text or word under the cursor",
      },
    },
  },

  {
    "luukvbaal/statuscol.nvim",
    event = "BufReadPost",
    config = function()
      local builtin = require "statuscol.builtin"
      require("statuscol").setup {
        relculright = true,
        segments = {
          { text = { "%s" }, click = "v:lua.ScSa" },
          { text = { builtin.lnumfunc, " " }, click = "v:lua.ScLa" },
          { text = { builtin.foldfunc, " " }, click = "v:lua.ScFa" },
        },
      }
    end,
  },

  {
    "kevinhwang91/nvim-ufo",
    event = "BufReadPost",
    dependencies = {
      "kevinhwang91/promise-async",
    },
    config = function(_, opts)
      vim.o.foldcolumn = "1"
      vim.o.foldlevel = 99
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
      local handler = function(virtText, lnum, endLnum, width, truncate)
        local newVirtText = {}
        local totalLines = vim.api.nvim_buf_line_count(0)
        local foldedLines = endLnum - lnum
        local suffix = (" 󰁂 %d %d%%"):format(foldedLines, foldedLines / totalLines * 100)
        local sufWidth = vim.fn.strdisplaywidth(suffix)
        local targetWidth = width - sufWidth
        local curWidth = 0
        for _, chunk in ipairs(virtText) do
          local chunkText = chunk[1]
          local chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if targetWidth > curWidth + chunkWidth then
            table.insert(newVirtText, chunk)
          else
            chunkText = truncate(chunkText, targetWidth - curWidth)
            local hlGroup = chunk[2]
            table.insert(newVirtText, { chunkText, hlGroup })
            chunkWidth = vim.fn.strdisplaywidth(chunkText)
            -- str width returned from truncate() may less than 2nd argument, need padding
            if curWidth + chunkWidth < targetWidth then
              suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
            end
            break
          end
          curWidth = curWidth + chunkWidth
        end
        table.insert(newVirtText, { suffix, "MoreMsg" })
        return newVirtText
      end

      opts["fold_virt_text_handler"] = handler
      require("ufo").setup(opts)
    end,

    -- Similar Plugins -> smoka7/hop.nvim
  },
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    keys = {
      {
        "<leader>mp",
        ft = "markdown",
        ":MarkdownPreviewToggle<CR>",
        desc = "Markdown Preview",
      },
    },
    config = function()
      vim.cmd [[do FileType]]
    end,
  },
}

return plugins
