return {
  { "christoomey/vim-tmux-navigator",      lazy = false },
  { "j-hui/fidget.nvim",                   event = "BufEnter", tag = 'legacy',                opts = {} },
  { "stevearc/dressing.nvim",              event = "BufEnter", opts = { show_borders = true } },
  { "folke/todo-comments.nvim",            event = "VimEnter", opts = { signs = false } },
  -- { "mbbill/undotree",                     lazy = false, },
  { "lukas-reineke/indent-blankline.nvim", main = "ibl",       opts = {}, },
  -- { "m4xshen/autoclose.nvim",              opts = {}, },
  -- {
  --   "bekaboo/dropbar.nvim",
  --   -- optional, but required for fuzzy finder support
  --   -- dependencies = { "nvim-telescope/telescope-fzf-native.nvim" }
  -- },
  {
    "NvChad/nvim-colorizer.lua",
    event = "VeryLazy",
    config = function(_, opts)
      require("colorizer").setup(opts)
      -- execute colorizer as soon as possible
      vim.defer_fn(function()
        require("colorizer").attach_to_buffer(0)
      end, 0)
    end,
  },
  {
    "numToStr/Comment.nvim",
    event = "VeryLazy",
    config = function(_, opts)
      opts = {
        pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
      }
      vim.keymap.set("n", "<D-/>", function()
        require("Comment.api").toggle.linewise.current()
      end)

      vim.keymap.set("v", "<D-/>", "<ESC><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>")
      require("Comment").setup(opts)
    end
  },
  -- {
  --   "lewis6991/gitsigns.nvim",
  --   ft = { "gitcommit", "diff" },
  --   init = function()
  --     -- load gitsigns only when a git file is opened
  --     vim.api.nvim_create_autocmd({ "BufRead" }, {
  --       group = vim.api.nvim_create_augroup("GitSignsLazyLoad", { clear = true }),
  --       callback = function()
  --         vim.fn.jobstart({ "git", "-C", vim.loop.cwd(), "rev-parse" },
  --           {
  --             on_exit = function(_, return_code)
  --               if return_code == 0 then
  --                 vim.api.nvim_del_augroup_by_name "GitSignsLazyLoad"
  --                 vim.schedule(function()
  --                   require("lazy").load { plugins = { "gitsigns.nvim" } }
  --                 end)
  --               end
  --             end
  --           }
  --         )
  --       end,
  --     })
  --   end,
  --   opts = function()
  -- return require("custom.configs.misc").gitsigns
  --   end,
  --   config = function(_, opts)
  --     require("gitsigns").setup(opts)
  --   end,
  -- }

}
