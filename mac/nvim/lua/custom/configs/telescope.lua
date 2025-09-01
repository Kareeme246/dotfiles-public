local icons = require("nvim-nonicons")

local options = {
  defaults = {
    vimgrep_arguments = {
      "rg",
      "-L",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
    },
    prompt_prefix = "  " .. icons.get("telescope") .. "  ",
    selection_caret = " ❯ ",
    entry_prefix = "   ",
    initial_mode = "insert",
    selection_strategy = "reset",
    sorting_strategy = "ascending",
    layout_strategy = "horizontal",
    layout_config = {
      horizontal = {
        prompt_position = "top",
        preview_width = 0.55,
        results_width = 0.8,
      },
      vertical = {
        mirror = false,
      },
      width = 0.87,
      height = 0.80,
      preview_cutoff = 120,
    },
    file_sorter = require("telescope.sorters").get_fuzzy_file,
    file_ignore_patterns = { "node_modules" },
    generic_sorter = require("telescope.sorters").get_generic_fuzzy_sorter,
    path_display = { "truncate" },
    winblend = 0,
    border = {},
    borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
    color_devicons = true,
    set_env = { ["COLORTERM"] = "truecolor" }, -- default = nil,
    file_previewer = require("telescope.previewers").vim_buffer_cat.new,
    grep_previewer = require("telescope.previewers").vim_buffer_vimgrep.new,
    qflist_previewer = require("telescope.previewers").vim_buffer_qflist.new,
    -- Developer configurations: Not meant for general override
    buffer_previewer_maker = require("telescope.previewers").buffer_previewer_maker,
    mappings = {
      n = { ["q"] = require("telescope.actions").close },
      i = {
        ['<C-u>'] = false,
        ['<C-d>'] = false,
      }
    },
  },

  extensions_list = {},
}

-- Set keybindings

vim.keymap.set("n", "<Char-0xAF>", "<cmd> Telescope find_files <CR>")
vim.keymap.set("n", "<D-p>", "<cmd> Telescope find_files <CR>")
vim.keymap.set("n", "<leader>fa", "<cmd> Telescope find_files follow=true no_ignore=true hidden=true <CR>")
-- vim.keymap.set("n", "<leader>fb", "<cmd> Telescope buffers <CR>")
vim.keymap.set("n", "<leader>sh", "<cmd> Telescope help_tags <CR>")
-- vim.keymap.set("n", "<leader>fz", "<cmd> Telescope current_buffer_fuzzy_find <CR>")
vim.keymap.set("n", "<leader>fw", "<cmd> Telescope live_grep <CR>")
vim.keymap.set("n", "<leader>fo", "<cmd> Telescope oldfiles <CR>")
-- vim.keymap.set("n", "<leader>cm", "<cmd> Telescope git_commits <CR>")
vim.keymap.set("n", "<leader>gt", "<cmd> Telescope git_status <CR>")
vim.keymap.set("n", "<leader>ma", "<cmd> Telescope marks <CR>")

vim.keymap.set("n", "<leader>en", "<cmd> Telescope find_files cwd=~/.config/nvim/ <CR>")

local telescope = require "telescope"
telescope.setup(options)

-- load extensions
for _, ext in ipairs(options.extensions_list) do
  telescope.load_extension(ext)
end
