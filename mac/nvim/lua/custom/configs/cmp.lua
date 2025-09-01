local function border(hl_name)
  return {
    { "╭", hl_name },
    { "─", hl_name },
    { "╮", hl_name },
    { "│", hl_name },
    { "╯", hl_name },
    { "─", hl_name },
    { "╰", hl_name },
    { "│", hl_name },
  }
end

local lk = require("lspkind")
lk.init({})

local cmp = require "cmp"
local ls = require "luasnip"

cmp.setup {
  sources = {
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "luasnip" },
    { name = "crates" },
    { name = "path" },
    { name = "buffer",  keyword_length = 5 },
  },

  completion = {
    completeopt = "menu, menuone",
  },

  mapping = {
    -- ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    -- ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ["<C-p>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
    ["<C-n>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
    -- ["<C-t>"] = cmp.mapping.complete({ reason = cmp.ContextReason.Auto }), -- Show completions before typing
    ["<C-space>"] = cmp.mapping.complete({ reason = cmp.ContextReason }), -- Show completions before typing
    ['<C-e>'] = cmp.mapping.abort(),
    ["<tab>"] = cmp.mapping.confirm {                                    -- Can change to <C-y> which is the default
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },

    ["<C-k>"] = cmp.mapping(function(fallback)
      if cmp.visible() or ls.expand_or_jumpable() then
        ls.expand_or_jump()
      else
        fallback()
      end
    end, { "i", "s" }),
    ["<C-j>"] = cmp.mapping(function(fallback)
      if ls.jumpable(-1) then
        ls.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),
  },

  window = {
    -- completion = cmp.config.window.bordered {
    --   winhighlight = "Normal:CmpPmenu,CursorLine:PmenuSel,Search:None",
    -- },
    documentation = {
      border = border "CmpDocBorder",
      winhighlight = "Normal:CmpDoc",
    },
  },

  formatting = {
    format = lk.cmp_format({
      mode = 'symbol_text', -- options: 'text','text_symbol','symbol_text','symbol'
      maxwidth = 50,        -- can also be a function to dynamically calculate max width such as: maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
      ellipsis_char = '...',
      show_labelDetails = true,

      before = function(entry, vim_item)
        vim_item.menu = ({
          luasnip = "[SNIP]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          crates = "[crates]",
          path = "[path]",
          buffer = "[buf]",
        })[entry.source.name]
        return vim_item
      end
    })
  },

  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  }
}

-- Function to enable completion for the current buffer
function EnableCompletion()
  cmp.setup.buffer({
    enabled = true
  })
  print("Completion enabled")
end

-- Function to disable completion for the current buffer
function DisableCompletion()
  cmp.setup.buffer({
    enabled = false
  })
  print("Completion disabled")
end

-- You can manually toggle with these functions in command mode as well
vim.api.nvim_create_user_command('EnableCompletion', EnableCompletion, {})
vim.api.nvim_create_user_command('DisableCompletion', DisableCompletion, {})

--for _, ft_path in ipairs(vim.api.nvim_get_runtime_file("lua/custom/snippets/*.lua")) do
-- loadfile(ft_path)()
--end
