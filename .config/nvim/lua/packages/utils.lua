return {
  {
    "kylechui/nvim-surround",
    config = true
  },
  {
    "ojroques/nvim-bufdel",
    opts = {
      next = "tabs", -- or 'alternate'
      quit = true,
    }
  },
  {
    "folke/which-key.nvim",
    enabled = true,
    opts = {
      window = {
        border = "double"
      }
    }
  },
  { "AndrewRadev/linediff.vim" },
  {
    'uga-rosa/ccc.nvim',
    config = function()
      local ccc = require('ccc')
      ccc.setup({
        bar_len = 35,
        output_line = function(b_color, a_color, width)
          local b_hex = b_color:hex()
          local a_str = a_color:str()
          local line = b_hex .. " =>" .. string.rep(" ", width - #b_hex - #a_str - 3) .. a_str

          local b_start_col = 0
          local b_end_col = #b_hex
          local a_start_col = width - 28 - #a_str
          local a_end_col = -1
          return line, b_start_col, b_end_col, a_start_col, a_end_col
        end
      })
    end,
    keys = {
      { "<leader>sc", "<cmd>CccHighlighterToggle<cr>", desc = "toggle colors", silent = true },
      { "<leader>C",  "<cmd>CccPick<cr>",              desc = "pick color",    silent = true },
    }
  },
  {
    "monaqa/dial.nvim",
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        -- default augends used when no group name is specified
        default = {
          augend.integer.alias.decimal_int,
          -- augend.integer.alias.hex,
          -- augend.date.alias["%d/%m/%Y"],
          -- augend.date.alias["%H:%M"],
          augend.constant.alias.bool, -- boolean value (true <-> false)
        },
      })
    end,
    keys = {
      { "<C-a>", "<cmd>DialIncrement<cr>" },
      { "<C-x>", "<cmd>DialDecrement<cr>" }
    }
  },
  {
    "arjunmahishi/flow.nvim",
    enabled = false,
    opts = {
      output = {
        buffer = false,
        split_cmd = '20split',
      },
      filetype_cmd_map = {
        rust = "cargo run --quiet"
      }
    },
    keys = {
      { '<leader>r', "<cmd>FlowRunFile<cr>", desc = "Run File", silent = true }
    }
  },
  {
    "rest-nvim/rest.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rest-nvim").setup({
        -- Open request results in a horizontal split
        result_split_horizontal = true,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = true,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = true,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 150,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = false,
          show_http_info = true,
          show_headers = true,
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            html = function(body)
              return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            end
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = '.env',
        custom_dynamic_variables = {},
        yank_dry_run = true,
      })
    end
  },
}
