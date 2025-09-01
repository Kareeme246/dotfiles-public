-- [[ Setting options ]]
-- See `:help vim.o` or `:help vim.o`

-- Set leader key to space
vim.g.mapleader = " "
-- Default is '\'
vim.g.maplocalleader = ' '

-- [[ Basics]]
-- Enable mouse mode
vim.opt.mouse = 'a'
-- Numbers
vim.opt.number = true
vim.opt.numberwidth = 4
vim.opt.relativenumber = false
-- Default (System) Clipboard
vim.opt.linebreak = true
vim.opt.clipboard = 'unnamedplus'
-- NOTE: You should make sure your terminal supports this
-- Enable 24-bit RGB color support
vim.opt.termguicolors = true
-- vim.opt.guicursor = "a:blinkon0"
vim.opt.guicursor = "n-v-c-sm:block,i-ci-ve:ver35,r-cr-o:hor20"
-- Spellcheck
vim.opt.spell = false
vim.opt.spelllang = { "en_us" }
-- Indenting
-- vim.opt.conceallevel = 1 -- Need to figure out how to turn off for json files
vim.opt.shiftwidth = 2
vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.breakindent = true
-- Backups
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
-- Quality of Life
vim.opt.cursorline = false -- Highlight current cursor line
vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.scrolloff = 10
vim.opt.signcolumn = "no"
vim.opt.colorcolumn = "100"
-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
vim.opt.whichwrap:append "<>[]hl"
-- [[ End Basics]]

-- [[ Preferences ]]
vim.opt.completeopt = 'menuone,noselect'
vim.opt.foldtext = 'v:lua.vim.treesitter.foldtext()'
vim.opt.updatetime = 250 -- interval for writing swap file to disk, also used by gitsigns
vim.opt.timeoutlen = 300
-- Case-insensitive searching UNLESS \C or capital in search
vim.opt.ignorecase = true
vim.opt.smartcase = true
-- Statusline
vim.opt.laststatus = 3
vim.opt.showmode = false -- Don't need because we have a statusline?
vim.opt.fillchars = { eob = " " }
-- disable nvim intro
vim.opt.shortmess:append "sI"


-- [[ Highlight on yank ]]
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})
