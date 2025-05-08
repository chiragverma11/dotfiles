---@type NvPluginSpec[]
return {
  {
    "nvim-java/nvim-java",
    ft = { "java" },
    dependencies = {
      "nvim-java/lua-async-await",
      "nvim-java/nvim-java-refactor",
      "nvim-java/nvim-java-core",
      "nvim-java/nvim-java-test",
      "nvim-java/nvim-java-dap",
      "MunifTanjim/nui.nvim",
      "mfussenegger/nvim-dap",
      "neovim/nvim-lspconfig",
      {
        "mason-org/mason.nvim",
        opts = {
          registries = {
            "github:nvim-java/mason-registry",
            "github:mason-org/mason-registry",
          },
        },
      },
    },
    keys = {
      {
        "<leader>jb",
        function()
          require("java").build.build_workspace()
        end,
        desc = "Java Build Workspace",
      },
      {
        "<leader>jr",
        function()
          require("java").runner.built_in.run_app { "hi" }
        end,
        desc = "Java Run Main",
      },
      {
        "<leader>js",
        function()
          require("java").runner.built_in.stop_app {}
        end,
        desc = "Java Stop Main",
      },
      {
        "<leader>jl",
        function()
          require("java").runner.built_in.toggle_logs()
        end,
        desc = "Java Toggle Logs",
      },
      {
        "<leader>js",
        function()
          require("java").runner.built_in.stop_app { test = true }
        end,
        desc = "Java Stop Test",
      },
      -- test & debug
      {
        "<leader>jt",
        function()
          require("java").test.run_current_class()
        end,
        desc = "Java Test Current Class",
      },
      {
        "<leader>jd",
        function()
          require("java").test.debug_current_class()
        end,
        desc = "Java Debug Current Class",
      },
      {
        "<leader>jm",
        function()
          require("java").test.debug_current_method()
        end,
        desc = "Java Debug Current File",
      },
      {
        "<leader>jM",
        function()
          require("java").test.run_current_method()
        end,
        desc = "Java Test Current Method",
      },
      {
        "<leader>jL",
        function()
          require("java").test.view_last_report()
        end,
        desc = "Java Test All",
      },
    },
    opts = {
      -- jdk = {
      --   auto_install = false,
      -- },
      spring_boot_tools = {
        enable = false,
      },
      notifications = {
        dap = false,
      },
    },
    config = function(_, opts)
      require("java").setup(opts)
      require("lspconfig").jdtls.setup {
        on_attach = require("nvchad.configs.lspconfig").on_attach,
        capabilities = require("nvchad.configs.lspconfig").capabilities,
        filetypes = { "java" },
        settings = {
          java = {
            configuration = {
              runtimes = {
                {
                  name = "OpenJDK-22",
                  path = os.getenv "JAVA_HOME" or "/home/chirag/.jdks/openjdk-22.0.1",
                  default = true,
                },
              },
            },
          },
        },
      }
    end,
  },
}
