return {
  -- { 'glepnir/dashboard-nvim',
  --     event = 'VimEnter',
  --     opts = {
  --       theme = "doom"
  --         -- config
  --     },
  --     dependencies = { { 'nvim-tree/nvim-web-devicons' } }
  -- },
  {
    'goolord/alpha-nvim',
    enabled = true,
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require("alpha")
      local startify = require 'alpha.themes.startify'
      startify.section.mru.val = { { type = "padding", val = 0 } }
      -- startify.section.mru_cwd.val = { { type = "padding", val = 0 } }
      startify.section.top_buttons.val = {
        startify.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
      }
      startify.section.bottom_buttons.val = {
        startify.button("c", "neovim", ":e ~/.config/nvim/init.lua<cr>"),
        startify.button("f", "lf", ":e ~/.config/lf/lfrc<cr>"),
        startify.button("b", "bash", ":e ~/.bashrc<cr>"),
        startify.button("s", "bspwm", ":e ~/.config/bspwm/bspwmrc<cr>"),
        startify.button("m", "mpv", ":e ~/.config/mpv/mpv.conf<cr>"),
        startify.button("x", "sxhkd", ":e ~/.config/sxhkd/sxhkdrc<cr>"),
        startify.button("p", "polybar", ":e ~/.config/polybar/config.ini<cr>"),
        startify.button("t", "tmux", ":e ~/.tmux.conf<cr>"),
        startify.button("i", "kitty", ":e ~/.config/kitty/kitty.conf<cr>"),
        -- startify.button("q", "  Quit NVIM", ":qa<cr>"),
      }
      -- startify.config.opts.noautocmd = false
      -- startify.mru_opts.autocd = true
      alpha.setup(startify.config)
    end
  },
  {
    "is0n/fm-nvim",
    opts = {
      edit_cmd = "tabedit",
      on_close = {},
      on_open = {},
      ui = {
        default = "float",
        float = {
          border = "rounded",
          float_hl = "Normal",
          border_hl = "FloatBorder",
          blend = 0,
          height = 0.8,
          width = 0.8,
          x = 0.5,
          y = 0.5,
        },
        split = {
          direction = "topleft",
          size = 24,
        },
      },
      cmds = {
        lf_cmd = "lf",   -- eg: lf_cmd = "lf -command 'set hidden'"
        fzf_cmd = "fzf", -- eg: fzf_cmd = "fzf --preview 'bat --style=numbers --color=always --line-range :500 {}'"
        fzy_cmd = "find . | fzy",
        broot_cmd = "broot",
        ranger_cmd = "ranger",
        lazygit_cmd = "lazygit",
        neomutt_cmd = "neomutt",
      },
      mappings = {
        vert_split = "<C-v>",
        horz_split = "<C-s>",
        tabedit = "<C-t>",
        edit = "<C-e>",
        ESC = "<ESC>",
      },
    }
  },
  {
    'stevearc/oil.nvim',
    enabled = true,
    init = function()
      vim.keymap.set({ "v", "n" }, "<leader>w", require("oil").open, { desc = "Oil Explorer" })
      -- vim.keymap.set({ "v", "n" }, "<C-h>", require("oil").open, { desc = "Oil Explorer" })
    end,
    opts = {
      use_default_keymaps = false,
      keymaps = {
        ["g?"] = "actions.show_help",
        ["<CR>"] = "actions.select",
        ["<C-l>"] = "actions.select",
        ["<C-s>"] = "actions.select_vsplit",
        -- ["<C-h>"] = "actions.select_split",
        ["<C-t>"] = "actions.select_tab",
        ["<C-p>"] = "actions.preview",
        ["<C-c>"] = "actions.close",
        ["q"] = "actions.close",
        -- ["<C-l>"] = "actions.refresh",
        ["<C-h>"] = "actions.parent",
        ["_"] = "actions.open_cwd",
        ["`"] = "actions.cd",
        ["~"] = "actions.tcd",
        ["g."] = "actions.toggle_hidden",
        ["<c-j>"] = "j",
        ["<c-k>"] = "k",
      }
    }
  }
}
