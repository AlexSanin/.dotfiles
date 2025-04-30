return {
  'VonHeikemen/lsp-zero.nvim',
  dependencies = {
    { 'williamboman/mason.nvim',          config = true },
    { 'williamboman/mason-lspconfig.nvim' },
    { 'neovim/nvim-lspconfig' },
  },
  config = function()
    local lsp_zero = require('lsp-zero')

    -- Set up LSP Zero with on_attach function
    lsp_zero.on_attach(function(client, bufnr)
      -- Default keymaps for LSP
      lsp_zero.default_keymaps({ buffer = bufnr })
    end)

    -- Mason setup
    require('mason').setup({})

    -- Mason LSP config setup with specific servers ensured to be installed
    require('mason-lspconfig').setup({
      ensure_installed = {
        "tailwindcss",
        "lua_ls",
        "html",
        "cssls",
        "ts_ls",
        "eslint",
        "rust_analyzer",
        "sqlls",
        "ruby_lsp",
        "rubocop",
        "pyright",
        "ruff",
        "yamlls",
        "biome",
      },
      handlers = {
        lsp_zero.default_setup,
      },
    })
    -- Automatically install and set up ensure_installed servers
    require('mason-lspconfig').setup_handlers({
      -- Default handler for all installed servers
      function(server_name)
        -- Set up capabilities for autocompletion (nvim-cmp integration)
        local capabilities = require('cmp_nvim_lsp').default_capabilities()
        local settings = {}
        if server_name == "yamlls" then
          settings = {
            yaml = {
              schemaStore = {
                enable = true,
                url = "https://www.schemastore.org/api/json/catalog.json",
              },
              schemas = {
                kubernetes = "*.yaml",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.0/schema.json"] =
                "/*swagger.yaml",
                ["https://raw.githubusercontent.com/OAI/OpenAPI-Specification/main/schemas/v3.1/schema.json"] =
                "/*swagger.yaml",
                ["https://json.schemastore.org/swagger-2.0.json"] = "/*swagger.yaml",
                ["https://json.schemastore.org/github-workflow"] = ".github/workflows/*",
                ["https://json.schemastore.org/github-action"] = ".github/action.{yml,yaml}",
                ["https://json.schemastore.org/ansible-stable-2.9"] = "roles/tasks/*.{yml,yaml}",
                ["https://json.schemastore.org/prettierrc"] = ".prettierrc.{yml,yaml}",
                ["https://json.schemastore.org/kustomization"] = "kustomization.{yml,yaml}",
                ["https://json.schemastore.org/ansible-playbook"] = "*play*.{yml,yaml}",
                ["https://json.schemastore.org/chart"] = "Chart.{yml,yaml}",
                ["https://json.schemastore.org/dependabot-v2"] = ".github/dependabot.{yml,yaml}",
                ["https://json.schemastore.org/gitlab-ci"] = "*gitlab-ci*.{yml,yaml}",
                ["https://raw.githubusercontent.com/compose-spec/compose-spec/master/schema/compose-spec.json"] =
                "*docker-compose*.{yml,yaml}",
                ["https://raw.githubusercontent.com/argoproj/argo-workflows/master/api/jsonschema/schema.json"] =
                "*flow*.{yml,yaml}",
              },
              format = {
                enable = true,
              },
              validate = true,
              completion = true,
              hover = true,
            },
          }
        end

        -- Use the lsp-zero default setup if no other customization is needed
        require('lspconfig')[server_name].setup({
          on_attach = lsp_zero.on_attach,
          capabilities = capabilities, -- Autocompletion capabilities
          settings = settings,
        })
      end,
    })

    -- Diagnostic configuration
    vim.diagnostic.config({
      virtual_text = true,
      signs = true,
      float = {
        border = "rounded",
        source = "always",
        header = "",
        prefix = "",
      },
    })
  end
}
