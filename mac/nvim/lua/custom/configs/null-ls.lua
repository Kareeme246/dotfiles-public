-- [[ For auto format on save]]
local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
-- [[ For auto format on save]]

local null_ls = require("null-ls")


local opts = {
  sources = {
    -- Commented out because it kept triggering on markdown file save
    -- null_ls.builtins.formatting.prettierd,
    null_ls.builtins.formatting.biome, -- Trying this out instead of prettier
    -- null_ls.builtins.formatting.clang_format,
    -- null_ls.builtins.formatting.black,
    -- null_ls.builtins.diagnostics.mypy,
    -- null_ls.builtins.diagnostics.ruff,
    null_ls.builtins.formatting.gofumpt,
    null_ls.builtins.formatting.goimports
  },
  -- For auto format on save add this
  on_attach = function(client, bufnr)
    if client.supports_method("textDocument/formatting") then
      vim.api.nvim_clear_autocmds({
        group = augroup,
        buffer = bufnr
      })
      vim.api.nvim_create_autocmd("BufWritePre", {
        group = augroup,
        buffer = bufnr,
        callback = function()
          -- Temporarily removing this because it bothers me a lot
          -- vim.lsp.buf.format({ bufnr = bufnr })
        end
      })
    end
  end,
}

return opts
