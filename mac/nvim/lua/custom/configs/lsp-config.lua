local M = {}

M.capabilities = vim.lsp.protocol.make_client_capabilities()

M.capabilities.textDocument.completion.completionItem = {
  documentationFormat = { "markdown", "plaintext" },
  snippetSupport = true,
  preselectSupport = true,
  insertReplaceSupport = true,
  labelDetailsSupport = true,
  deprecatedSupport = true,
  commitCharactersSupport = true,
  tagSupport = { valueSet = { 1 } },
  resolveSupport = {
    properties = {
      "documentation",
      "detail",
      "additionalTextEdits",
    },
  },
}

-- export on_attach & capabilities for custom lspconfigs
M.on_attach = function(client, bufnr)
  -- Load mappings
  vim.keymap.set("n", "gD", function()
    vim.lsp.buf.declaration()
  end)
  vim.keymap.set("n", "gd", function()
    vim.lsp.buf.definition()
  end)
  vim.keymap.set("n", "K", function()
    vim.lsp.buf.hover()
  end)
  vim.keymap.set("n", "gi", function()
    vim.lsp.buf.implementation()
  end)
  vim.keymap.set("n", "<leader>ls", function()
    vim.lsp.buf.signature_help()
  end)
  vim.keymap.set("n", "<leader>D", function()
    vim.lsp.buf.type_definition()
  end)
  vim.keymap.set("n", "<Char-0xAD>", function()
    vim.lsp.buf.code_action()
  end)
  vim.keymap.set("n", "<D-.>", function()
    vim.lsp.buf.code_action()
  end)
  vim.keymap.set("n", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end)
  vim.keymap.set("n", "gr", function()
    vim.lsp.buf.references()
  end)
  vim.keymap.set("n", "<leader>lf", function()
    vim.diagnostic.open_float { border = "rounded" }
  end)
  vim.keymap.set("n", "[d", function()
    vim.diagnostic.goto_prev { float = { border = "rounded" } }
  end)
  vim.keymap.set("n", "]d", function()
    vim.diagnostic.goto_next { float = { border = "rounded" } }
  end)
  vim.keymap.set("n", "<leader>q", function()
    vim.diagnostic.setloclist()
  end)
  vim.keymap.set("n", "<leader>wa", function()
    vim.lsp.buf.add_workspace_folder()
  end)
  vim.keymap.set("n", "<leader>wr", function()
    vim.lsp.buf.remove_workspace_folder()
  end)
  vim.keymap.set("n", "<leader>wl", function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end)
  vim.keymap.set("v", "<leader>ca", function()
    vim.lsp.buf.code_action()
  end)

  if client.server_capabilities.inlayHintProvider then
    -- vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    vim.keymap.set("n", "<leader>ih", function()
      vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled())
    end)
  end
end

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local servers = {
  "pylsp",
  "marksman",
  "tailwindcss",
  "astro",
  "cssls",
  "eslint",
  "bashls",
  "dockerls"
}

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = M.on_attach,
    capabilities = M.capabilities
  })
end


-- Example for me to reference in the future
lspconfig.lua_ls.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,

  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" },
      },
      workspace = {
        library = {
          [vim.fn.expand "$VIMRUNTIME/lua"] = true,
          [vim.fn.expand "$VIMRUNTIME/lua/vim/lsp"] = true,
        },
        maxPreload = 100000,
        preloadFileSize = 10000,
      },
    },
  },
})

lspconfig.gopls.setup({
  on_attach = M.on_attach,
  capabilities = M.capabilities,
  cmd = { "gopls" },
  filetypes = { "go", "gomod", "gowork", "gotmpl" },
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      }
    }
  }
})

-- These two are from deno docs so the servers don't interfere with each other
-- https://docs.deno.com/runtime/getting_started/setup_your_environment/
lspconfig.denols.setup {
  on_attach = M.on_attach,
  root_dir = lspconfig.util.root_pattern("deno.json", "deno.jsonc"),
}

lspconfig.ts_ls.setup {
  on_attach = M.on_attach,
  root_dir = lspconfig.util.root_pattern("package.json"),
  single_file_support = false
}



return M
