local options = {
  terminals = {
    shell = vim.o.shell,
    list = {},
    type_opts = {
      float = {
        relative = 'editor',
        row = 0.175,
        col = 0.20,
        width = 0.60,
        height = 0.65,
        border = "single",
      },
      horizontal = { location = "rightbelow", split_ratio = .45, },
      vertical = { location = "rightbelow", split_ratio = .5 },
    }
  },
  behavior = {
    autoclose_on_quit = {
      enabled = false,
      confirm = true,
    },
    close_on_exit = true,
    auto_insert = true,
  },
}

require("nvterm").setup(options)


vim.keymap.set("n", "<A-i>", function()
  require("nvterm.terminal").toggle "float"
end)
vim.keymap.set("n", "<A-v>", function()
  require("nvterm.terminal").toggle "horizontal"
end)
-- vim.keymap.set("n", "<A-v>", function()
--   require("nvterm.terminal").toggle "vertical"
-- end)

vim.keymap.set("t", "<A-i>", function()
  require("nvterm.terminal").toggle "float"
end)
vim.keymap.set("t", "<A-v>", function()
  require("nvterm.terminal").toggle "horizontal"
end)
-- vim.keymap.set("t", "<A-v>", function()
--   require("nvterm.terminal").toggle "vertical"
-- end)
