-- [[ Call when entering .md file ]]
-- local md_group = vim.api.nvim_create_augroup('MarkdownAutoCmds', { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   group = md_group,
--   pattern = { "markdown", "markdown.mdx", "pandoc" },
--   callback = function()
--     vim.opt_local.wrap = true -- Moved to ftplugin
--     vim.opt_local.linebreak = true
--     vim.opt_local.spell = true
--     -- Check if NoNeckPain is already active before executing it
--     if not vim.g.no_neck_pain_active then
--       vim.cmd("NoNeckPain")
--       vim.g.no_neck_pain_active = true
--     end
--   end,
-- })

-- -- [[ Call when entering .tex file ]]
-- local tex_group = vim.api.nvim_create_augroup('LaTeXAutoCmds', { clear = true })
-- vim.api.nvim_create_autocmd("FileType", {
--   group = tex_group,
--   pattern = { "latex", ".tex" },
--   callback = function()
--     vim.opt_local.wrap = true
--     vim.opt_local.linebreak = true
--     vim.opt_local.spell = false
--     vim.opt.conceallevel = 1
--   end,
-- })

vim.api.nvim_create_user_command(
  'Fixpaste',
  '%s/\r$//',
  { nargs = 0 }
)

vim.api.nvim_create_user_command(
  'EditConfig',
  'Telescope find_files cwd=~/.config/nvim/',
  { nargs = 0 }
)

-- vim.api.nvim_create_user_command(
--   'Lightmode',
--   [[lua vim.opt.background = "light"; vim.cmd("colorscheme oxocarbon")]],
--   { nargs = 0 }
-- )
--
-- vim.api.nvim_create_user_command(
--   'Darkmode',
--   [[lua
--       vim.opt.background = "dark"
--       vim.cmd("colorscheme oxocarbon")
--       vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
--       vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
--     ]],
--   { nargs = 0 }
-- )

-- [[ Removes virtual text to right of code ]]
local function setup_lsp_diags()
  vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics,
    {
      virtual_text = false,
      signs = true,
      update_in_insert = false,
      underline = true,
    }
  )
end

-- Register the function as a command in Neovim
vim.api.nvim_create_user_command(
  'SuppressLSPDialogs', -- Command name
  setup_lsp_diags,      -- Command action
  {}                    -- Command options
)
