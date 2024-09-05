return {
  {
    "nvim-telescope/telescope.nvim",
    lazy = false,
    tag = "0.1.6",
    dependencies = {
      "nvim-lua/plenary.nvim"
    },
    config = function()
      -- local builtin = require("telescope.builtin")
      require('telescope').setup{
        defaults = {
          mappings = {
            i = {
              ["<C-k>"] = "move_selection_previous",
              ["<C-j>"] = "move_selection_next",
              ["<C-q>"] = "close",
              ["<CR>"]  = "select_default",
              ["<C-m>"] = "select_vertical",
              ["<C-n>"] = "select_horizontal",
              ["<C-t>"] = "select_tab",
            }
          }
        }
      }
    end
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
    config = function()
      require("telescope").setup({
        extensions = {
          ["ui-select"] = {
            require("telescope.themes").get_dropdown {}
          }
        }
      })
      require("telescope").load_extension("ui-select")
    end
  },
  {
    "nvim-telescope/telescope-file-browser.nvim",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim"
    },
    config = function()
      local fb_actions = require "telescope._extensions.file_browser.actions"
      require.("telescope").setup {
        mappings = {
          ["i"] = {
            ["<A-c>"]  = fb_actions.create,
            ["<S-CR>"] = fb_actions.create_from_prompt,
            ["<A-r>"]  = fb_actions.rename,
            ["<A-m>"]  = fb_actions.move,
            ["<A-y>"]  = fb_actions.copy,
            ["<A-d>"]  = fb_actions.remove,
            ["<C-o>"]  = fb_actions.open,
            ["<C-g>"]  = fb_actions.goto_parent_dir,
            ["<C-e>"]  = fb_actions.goto_home_dir,
            ["<C-w>"]  = fb_actions.goto_cwd,
            ["<C-t>"]  = fb_actions.change_cwd,
            ["<C-f>"]  = fb_actions.toggle_browser,
            ["<C-h>"]  = fb_actions.toggle_hidden,
            ["<C-s>"]  = fb_actions.toggle_all,
            ["<bs>"]   = fb_actions.backspace,
          },
          ["n"] = {
            ["c"] = fb_actions.create,
            ["r"] = fb_actions.rename,
            ["m"] = fb_actions.move,
            ["y"] = fb_actions.copy,
            ["d"] = fb_actions.remove,
            ["o"] = fb_actions.open,
            ["g"] = fb_actions.goto_parent_dir,
            ["e"] = fb_actions.goto_home_dir,
            ["w"] = fb_actions.goto_cwd,
            ["t"] = fb_actions.change_cwd,
            ["f"] = fb_actions.toggle_browser,
            ["h"] = fb_actions.toggle_hidden,
            ["s"] = fb_actions.toggle_all,
          },
        },
      }
    end
  },
}
