-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- Real keymap changes
-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- vim.keymap.set("n", "<C-n>", "<cmd> Explore <CR>", { desc = "Open netrw" })
-- ["<C-n>"] = { "<cmd> Neotree filesystem reveal right toggle <CR>", "Toggle neotree" } -- Removed neotree
vim.keymap.set("n", "<C-n>", "<cmd> Neotree filesystem reveal right toggle <CR>")
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>")
vim.keymap.set("n", "<C-a>", "ggVG")
vim.keymap.set("n", "<leader>b", "<cmd> enew <CR>")
vim.keymap.set("n", "<leader>x", "<cmd> bdelete <CR>")
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "[R]e[n]ame" })
vim.keymap.set("n", "<leader>fm", function()
  vim.lsp.buf.format { async = true }
end)
vim.keymap.set("i", "<C-b>", "<ESC>^i", { desc = "Beginning of line" })
vim.keymap.set("i", "<C-e>", "<End>", { desc = "End of line" })

-- navigate within insert mode
-- Setting here to stop <C-k> mapping for snippets being overridden
vim.keymap.set("i", "<C-h>", "<Left>")
vim.keymap.set("i", "<C-l>", "<Right>")

-- vim.keymap.set("n", "<leader><C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<leader><C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Open floating diagnostic message" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostics list" })

vim.keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv")
vim.keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>d", "\"_d")

vim.keymap.set("x", "<leader>p", "\"_dP")
vim.keymap.set("t", "<C-x>", vim.api.nvim_replace_termcodes("<C-\\><C-N>", true, true, true))

vim.keymap.set("n", "K", vim.lsp.buf.hover, { desc = "Hover Documentation" })
vim.keymap.set("n", "<M-k>", vim.lsp.buf.signature_help, { desc = "Signature Documentation" })
vim.keymap.set("n", "<leader>fp", "<cmd> %s/\r$ <CR>", { desc = "[F]ix [P]aste" })
vim.keymap.set("n", "<leader>en", "<cmd> Telescope find_files cwd=~/.config/nvim/ <CR>", { desc = "[E]dit [N]eovim" })
vim.keymap.set("n", "<leader>nn", "<cmd> NoNeckPain <CR>", { desc = "[N]o [N]eck" })
vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Toggle Undotree" })

-- Convenience stuff
vim.keymap.set("n", "<Esc>", ":noh <CR>")
vim.keymap.set("n", "J", "mzJ'z")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<leader>y", "\"+y")

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
