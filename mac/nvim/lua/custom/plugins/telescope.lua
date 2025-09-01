return {
  lazy = false,
  "nvim-telescope/telescope.nvim",
  dependencies = {
    { "nvim-lua/plenary.nvim" },
    { "nvim-telescope/telescope-fzf-native.nvim",   build = "make" },
    { "nvim-telescope/telescope-smart-history.nvim" },
    { "ya2s/nvim-nonicons",                         opts = {} },
    { 'kyazdani42/nvim-web-devicons' }
    -- { "kkharji/sqlite.lua" }
  },
  cmd = "Telescope",
  config = function()
    require "custom.configs.telescope"
  end
}
