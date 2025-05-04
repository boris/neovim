local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

local servers = {
  "dockerls",
  "jsonnet_ls",
  "pyre",
  "yamlls",
}

for _, server in ipairs(servers) do
  lspconfig[server].setup({
    capabilities = capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  })
end

