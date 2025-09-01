CustomOilBar = function()
  local path = vim.fn.expand "%"
  path = path:gsub("oil://", "")

  return "  " .. vim.fn.fnamemodify(path, ":.")
end

local oil = require("oil")

oil.setup({
  keymaps = {
    ["<C-h>"] = false,
    ["<C-l>"] = false,
    ["<C-k>"] = false,
    ["<C-j>"] = false,
  },
  win_options = {
    winbar = "%{v:lua.CustomOilBar()}",
  },
  view_options = {
    show_hidden = true,
  },
})

-- Open parent directory in current window
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
