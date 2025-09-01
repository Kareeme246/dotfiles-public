local options = {
  ensure_installed = {
    "lua-language-server",         -- LSP
    -- [[ JS/TS ]]
    "typescript-language-server",  -- LSP
    "tailwindcss-language-server", -- LSP
    "eslint-lsp",                  -- Static Analysis
    -- "prettierd",                   --  Formatter
    -- [[ C/Cpp ]]
    "clangd",                      -- LSP
    "clang-format",                -- Formatter
    "codelldb",                    -- Debugger
    -- [[ Python ]] -- Can switch to python-lsp-server for all this together
    "python-lsp-server",
    -- "pyright",                     -- LSP
    -- "mypy",                        -- Static Analysis
    -- "ruff",                        -- Static Analysis
    -- "black",                       -- Formatter
    -- [[ Go ]] -- Can always use vim-go as well which is really good
    -- "gopls",                       -- LSP
    -- "gofumpt",                     -- Formatter
    -- "delve"                        -- Debugger
    -- [[ Markdown ]]
    "marksman",
    -- [[ Bash ]]
    "bash-language-server", -- LSP
    -- [[ C# ]]
    -- "csharp-language-server",      -- LSP
    -- [[ Rust ]]
    "rust-analyzer", -- LSP"
  },

  PATH = "skip",

  ui = {
    icons = {
      package_pending = " ",
      package_installed = "󰄳 ",
      package_uninstalled = " 󰚌",
    },

    keymaps = {
      toggle_server_expand = "<CR>",
      install_server = "i",
      update_server = "u",
      check_server_version = "c",
      update_all_servers = "U",
      check_outdated_servers = "C",
      uninstall_server = "X",
      cancel_installation = "<C-c>",
    },
  },

  max_concurrent_installers = 10,
}

require("mason").setup(options)

-- custom nvchad cmd to install all mason binaries listed
vim.api.nvim_create_user_command("MasonInstallAll", function()
  if options.ensure_installed and #options.ensure_installed > 0 then
    vim.cmd("MasonInstall " .. table.concat(options.ensure_installed, " "))
  end
end, {})
vim.g.mason_binaries_list = options.ensure_installed
