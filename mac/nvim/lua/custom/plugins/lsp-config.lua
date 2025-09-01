return {
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.lsp-config"
    end
  },
  {
    "williamboman/mason.nvim",
    cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUpdate" },
    config = function()
      require "custom.configs.mason"
    end
  },
  -- {
  --   "zbirenbaum/copilot.lua",
  --   -- event = "InsertEnter",
  --   -- ft = "tex",
  --   config = function()
  --     require("copilot").setup({
  --       suggestion = {
  --         enabled = true,
  --         auto_trigger = false, -- Use next or prev commands to trigger
  --         debounce = 75,
  --         keymap = {
  --           accept = "<C-y>",
  --           accept_word = false,
  --           accept_line = false,
  --           next = "<M-]>",
  --           prev = "<M-[>",
  --           dismiss = "<C-->",
  --         },
  --       },
  --     })
  --   end
  -- }
}
