local nonicons_extention = require("nvim-nonicons.extentions.nvim-tree")
require("neo-tree").setup({
  -- close_if_last_window = true, -- Close Neo-tree if it is the last window left in the tab
  icons = {
    glyphs = nonicons_extention.glyphs,
  },
  enable_git_status = false,
  enable_diagnostics = false,
  filesystem = {
    filtered_items = {
      visible = true, -- This is what you want: If you set this to `true`, all "hide" just mean "dimmed out"
      hide_dotfiles = false,
      hide_gitignored = false,
    },
  },
  window = {
    position = "right",
    width = 30,
    mappings = {
      ["<bs>"] = "navigate_up",
      ["."] = "set_root",
      ["H"] = "toggle_hidden",
    },
    follow_current_file = {
      enabled = false,         -- This will find and focus the file in the active buffer every time
      --               -- the current file is changed while the tree is open.
      leave_dirs_open = false, -- `false` closes auto expanded dirs, such as with `:Neotree reveal`
    },
    -- hijack_netrw_behavior = "disabled", -- netrw left alone, neo-tree does not handle opening dirs
    -- ^ not doing anything
  }
})
