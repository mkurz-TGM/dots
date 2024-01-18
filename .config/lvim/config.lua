-- Read the docs: https://www.lunarvim.org/docs/configuration
-- Video Tutorials: https://www.youtube.com/watch?v=sFA9kX-Ud_c&list=PLhoH5vyxr6QqGu0i7tt_XoVK9v-KvZ3m6
-- Forum: https://www.reddit.com/r/lunarvim/
-- Discord: https://discord.com/invite/Xb9B4Ny

lvim.plugins = {
  {"ellisonleao/glow.nvim", config = true, cmd = "Glow"},
  {"simrat39/rust-tools.nvim"},
  {
    "arminveres/md-pdf.nvim",
    branch = 'main', -- you can assume that main is somewhat stable until releases will be made
    lazy = true,
    keys = {
            {
              "<space>.",
              function()
                require("md-pdf").convert_md_to_pdf()
      
        end,
              desc = "Markdown preview",
    
      },
  
    },
    opts = {},

  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  
    opts = {
      }
  },

  {"github/copilot.vim"},
  {"vim-test/vim-test"},
{
  "rebelot/kanagawa.nvim",  -- neorg needs a colorscheme with treesitter support
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    opts = {
      highlight = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },
  {
    "nvim-neorg/neorg",
    build = ":Neorg sync-parsers",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("neorg").setup {
        load = {
          ["core.export"] ={},
          ["core.export.markdow"] = {},
          ["core.defaults"] = {},
          ["core.concealer"] = {},
          ["core.dirman"] = {
            config = {
              workspaces = {
                notes = "~/notes",
              },
              default_workspace = "notes",
            },
          },
          ["core.keybinds"] = {
            config = {
              default_keybinds = true,
              neorg_leader = "<Leader><Leader>",
            },
          },
        },
      }

      vim.wo.foldlevel = 99
      vim.wo.conceallevel = 2
    end,
    }
  }
}

require("md-pdf").setup({
  margins = "1.5cm",
  highlight = "tango",
  toc = true,
  preview_cmd = function() return 'firefox' end
})

vim.keymap.set('i', '<C-J>', 'copilot#Accept("<CR>")', {
  expr = true,
  replace_keycodes = false
})
lvim.keys.normal_mode["tc"] = ":Neorg toggle-concealer<CR>"
