local base = require("custom.configs.lsp-config")
local on_attach = base.on_attach
local capabilities = base.capabilities

vim.g.rustaceanvim = {
  server = {
    on_attach = on_attach,
    capabilities = capabilities,
  }
}
