return {
  { "zbirenbaum/copilot.lua",
    enabled = false,
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        yaml = false,
        markdown = false,
        help = false,
        gitcommit = false,
        gitrebase = false,
        hgcommit = false,
        svn = false,
        cvs = false,
        ["."] = false,
      },
      copilot_node_command = 'node', -- Node.js version must be > 16.x
      server_opts_overrides = {
        settings = {
          advanced = {
            inlineSuggestCount = 4,
          }
        }
      },
    },
  },
  { "zbirenbaum/copilot-cmp",
    enabled = false,
    dependencies = { 'zbirenbaum/copilot.lua' },
    config = true,
  },
  { "jcdickinson/codeium.nvim",
    enabled = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
      -- "MunifTanjim/nui.nvim",
      "nvim-cmp",
    },
    config = true
  },
}
