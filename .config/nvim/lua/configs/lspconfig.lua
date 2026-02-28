local on_attach = require("nvchad.configs.lspconfig").on_attach
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"

---@alias RustDiagnosticSource "rust-analyzer" | "bacon-ls"
---@type RustDiagnosticSource
vim.g.rust_diagnostics = "bacon-ls"

local diagnostics = vim.g.rust_diagnostics

local servers = {
  html = {},
  cssls = {},
  ts_ls = {},
  tailwindcss = {
    settings = {
      tailwindCSS = {
        classFunctions = {
          "tw",
          "cva",
          "clsx",
        },
      },
    },
  },
  eslint = { disabled = true }, -- using eslind_d instead of eslint
  prismals = {},
  marksman = {},
  dockerls = {},
  docker_compose_language_service = {},
  jsonls = {
    -- lazy-load schemastore when needed
    before_init = function(_, new_config)
      new_config.settings.json.schemas = new_config.settings.json.schemas or {}
      ---@diagnostic disable-next-line: undefined-field
      vim.list_extend(new_config.settings.json.schemas, require("schemastore").json.schemas())
    end,
    settings = {
      json = {
        format = {
          enable = true,
        },
        validate = { enable = true },
      },
    },
  },
  yamlls = {
    -- Have to add this for yamlls to understand that we support line folding
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    -- lazy-load schemastore when needed
    before_init = function(_, new_config)
      new_config.settings.yaml.schemas =
        ---@diagnostic disable-next-line: undefined-field
        vim.tbl_deep_extend("force", new_config.settings.yaml.schemas or {}, require("schemastore").yaml.schemas())
    end,
    settings = {
      redhat = { telemetry = { enabled = false } },
      yaml = {
        keyOrdering = false,
        format = {
          enable = true,
        },
        validate = true,
        schemaStore = {
          -- Must disable built-in schemaStore support to use
          -- schemas from SchemaStore.nvim plugin
          enable = false,
          -- Avoid TypeError: Cannot read properties of undefined (reading 'length')
          url = "",
        },
      },
    },
  },
  glsl_analyzer = {},
  bacon_ls = { disabled = diagnostics == "rust-analyzer" },
}

for server, config in pairs(servers) do
  local server_disabled = (config.disabled ~= nil and config.disabled) or false

  if not server_disabled then
    vim.lsp.config(server, vim.tbl_deep_extend("force", { on_attach = on_attach, capabilities = capabilities }, config))
    vim.lsp.enable(server)
  end
end
