return {
  -- [[ For HTML ]]
  {
    "windwp/nvim-ts-autotag",
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html", "astro" },
    config = function()
      require("nvim-ts-autotag").setup()
    end
  },
  -- To fix jsx/tsx commenting
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    ft = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
    config = function()
      require('ts_context_commentstring').setup {
        enable_autocmd = false,
      }
    end
  },

  -- [[ For LaTeX ]]
  {
    "lervag/vimtex",
    lazy = false,
    config = function()
      vim.g.tex_flavor = "latex"
      vim.g.vimtex_view_method = "sioyek"
      vim.g.vimtex_view_general_options = '-reuse-instance -forward-search @tex @line @pdf'
      vim.g.vimtex_quickfix_mode = 0
      vim.opt.conceallevel = 1
      vim.opt.concealcursor = "i"
      vim.g.tex_conceal = "abdmgs"
    end
  },

  -- [[ For go ]]
  -- ***UNTESTED***
  -- {
  --   "fatih/vim-go",
  -- },

  -- [[ For Rust ]]
  {
    'mrcjkb/rustaceanvim',
    version = '^5', -- Recommended
    ft = { 'rust' },
    dependencies = "neovim/nvim-lspconfig",
    config = function()
      require "custom.configs.rustaceanvim"
    end
  },
  {
    'saecki/crates.nvim',
    event = { "BufRead Cargo.toml" },
    tag = "stable",
    config = function()
      require('crates').setup()
    end,
  },

  -- [[ For Markdown ]]
  -- {
  --   'aspeddro/pandoc.nvim',
  --   event = "VeryLazy",
  --   config = function()
  --     require "pandoc".setup()
  --   end
  -- },
  -- {
  --   "vim-pandoc/vim-pandoc-syntax",
  --   event = "VeryLazy",
  -- },
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'brianhuster/live-preview.nvim',
    dependencies = {
      'nvim-telescope/telescope.nvim',
    },
  }

  -- [[ For Jupyter Notebooks ]]
  -- {
  --   "GCBallesteros/jupytext.nvim",
  --   config = true,
  -- },
  -- {
  --   "benlubas/molten-nvim",
  --   version = "^1.0.0", -- use version <2.0.0 to avoid breaking changes
  --   dependencies = { "3rd/image.nvim" },
  --   build = ":UpdateRemotePlugins",
  --   init = function()
  --     -- these are examples, not defaults. Please see the readme
  --     vim.g.molten_image_provider = "image.nvim"
  --     vim.g.molten_output_win_max_height = 20
  --     vim.g.molten_virt_text_output = true
  --     require "custom.configs.jupyter"
  --   end,
  -- },
  -- {
  --   "3rd/image.nvim",
  --   opts = {
  --     backend = "kitty",
  --     max_width = 100,
  --     max_height = 12,
  --     max_height_window_percentage = math.huge,
  --     max_width_window_percentage = math.huge,
  --     window_overlap_clear_enabled = true,
  --     window_overlap_clear_ft_ignore = { "cmp_menu", "cmp_docs", "" },
  --   },
  -- },

  -- [[ For Flutter ]]
  -- {
  --   'akinsho/flutter-tools.nvim',
  --   lazy = false,
  --   dependencies = {
  --     'nvim-lua/plenary.nvim',
  --   },
  --   config = function()
  --     -- require "custom.configs.flutter-tools"
  --   end,
  -- },

}
