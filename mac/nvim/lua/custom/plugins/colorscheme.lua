-- return {
--   "bluz71/vim-moonfly-colors",
--   name = "moonfly",
--   lazy = false,
--   priority = 1000,
--   config = function()
--     vim.cmd("colorscheme moonfly")
--     -- For transparency
--     vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
--     vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
--   end
-- }
-- return {
--   "rebelot/kanagawa.nvim",
--   lazy = false,
--   priority = 1000,
--
--   config = function()
--     vim.cmd("colorscheme kanagawa-wave")
--     -- vim.cmd("colorscheme kanagawa-dragon")
--     -- vim.cmd("colorscheme kanagawa-lotus")
--     -- For transparency
--     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
--     vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
--   end
--
-- }
-- return {
--   "EdenEast/nightfox.nvim",
--   lazy = false,
--   priority = 1000,
--
--   config = function()
-- vim.cmd("colorscheme Dayfox")
--     -- vim.cmd("colorscheme Dawnfox")
--     -- vim.cmd("colorscheme Nordfox")
--     -- vim.cmd("colorscheme Terafox")
--     -- vim.cmd("colorscheme Nightfox")
-- vim.cmd("colorscheme Duskfox")
--     -- vim.cmd("colorscheme Carbonfox")
--     -- For transparency
--     -- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--     -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "ColorColumn", { bg = "none" })
--     vim.api.nvim_set_hl(0, "WhichKeyFloat", { bg = "none" })
--     vim.api.nvim_set_hl(0, "VertSplit", { bg = "none" })
--   end
--
-- }

return {
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    -- vim.cmd("colorscheme catppuccin-latte")
    vim.cmd("colorscheme catppuccin-frappe")
    -- vim.cmd("colorscheme catppuccin-macchiato")
    -- vim.cmd("colorscheme catppuccin-mocha")
  end
}
