local plugins = {
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = "VeryLazy",
    opts = function()
      return require "custom.configs.null-ls"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts =  {
      ensure_installed = {
        "clangd",
        "clang-format",
        "glow",
        "black",
        "pyright",
      }
    }
  },
  {
    "lervag/vimtex",
    lazy = false,
    init = function()
      vim.g.vimtex_view_method = "general"
      vim.g.vimtex_imaps_leader = ";"
      vim.g.vimtex_delim_stopline = 200
      vim.g.vimtex_compiler_latexmk = {
        options = {
          '-verbose',
          '-file-line-error',
          '-synctex=1',
          '-interaction=nonstopmode',
          '-shell-escape',
        }
      }
      vim.g.vimtex_quickfix_ignore_filters = {
        'Overfull',
        'Underfull',
      }
      vim.api.nvim_create_augroup("vimtex", { clear = true })
      vim.api.nvim_create_autocmd("User", {
        group = "vimtex",
        pattern = "VimtexEventQuit",
        command = "VimtexClean",
      })
      vim.api.nvim_create_autocmd("User", {
        group = "vimtex",
        pattern = "VimtexEventViewReverse",
        callback = function()
          vim.system({"open", "-a", "iTerm"})
        end,
      })
      vim.keymap.set("n", "<C-k>", "d$", {silent = false, noremap = true })
      vim.keymap.set("i", "<C-k>", "<Esc>ld$A", {silent = false, noremap = true })
    end,
  },
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  {
    "dense-analysis/ale", lazy = false,
  },
  {
    "FabijanZulj/blame.nvim"
  },
  {
    'mvllow/modes.nvim',
    lazy = false,
    tag = 'v0.2.0',
    config = function()
      require('modes').setup()
    end
  },
  {
    "chrisgrieser/nvim-early-retirement",
    config = true,
    event = "VeryLazy",
  },
  {
    "AckslD/nvim-neoclip.lua",
    lazy = false,
    requires = {
      {'nvim-telescope/telescope.nvim'},
    },
    config = function()
      require('neoclip').setup()
    end,
    keys = {
      { "<leader>r", "<cmd>Telescope neoclip plus<CR>", desc = "Toggle neoclip" },
    },
  },
  {
    "hedyhli/outline.nvim",
    lazy = true,
    cmd = { "Outline", "OutlineOpen" },
    keys = { -- Example mapping to toggle outline
      { "<leader>o", "<cmd>Outline<CR>", desc = "Toggle outline" },
    },
    opts = {
      -- Your setup opts here
    },
  },
}
return plugins
