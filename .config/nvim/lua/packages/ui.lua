return {
  -- nicer select and input ui
  {
    "stevearc/dressing.nvim",
    opts = {
      input = {
        win_options = {
          winblend = 7,
        }
      },
      select = {
        backend = { "telescope" },
        win_options = {
          winblend = 7,
        }
      }
    }
  },
  {
    "rcarriga/nvim-notify",
    init = function()
      vim.notify = require("notify")
      -- local severity = {
      --   "error",
      --   "warn",
      --   "info",
      --   "info", -- map both hint and info to info?
      -- }
      -- vim.lsp.handlers["window/showMessage"] = function(err, method, params, client_id)
      --   vim.notify(method.message, severity[params.type])
      -- end
    end,
    opts = {
      render = "compact",
      fps = 60,
      icons = {
        ERROR = "",
        WARN = "",
        INFO = "",
        DEBUG = "",
        TRACE = "",
      },
      -- stages = "fade_in_slide_out",
      stages = "static",
      timeout = 8000,
      top_down = false,
      background_colour = "#000000"
    }
  },
  {
    'mrded/nvim-lsp-notify',
    enabled = false,
    dependencies = { 'rcarriga/nvim-notify' },
    config = function()
      require('lsp-notify').setup({
        icons = false
      })
    end
  },
  -- { "folke/noice.nvim",
  --   enabled = true,
  --   opts = {
  --     cmdline = {
  --       view = "cmdline"
  --     },
  --     lsp = {
  --       -- override markdown rendering so that **cmp** and other plugins use **Treesitter**
  --       override = {
  --         ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
  --         ["vim.lsp.util.stylize_markdown"] = true,
  --         ["cmp.entry.get_documentation"] = true,
  --       },
  --       hover = {
  --         enabled = false
  --       },
  --       signature = {
  --         enabled = false
  --       }
  --     },
  --     messages = {
  --       view = "notify"
  --     },
  --     -- you can enable a preset for easier configuration
  --     presets = {
  --       bottom_search = false, -- use a classic bottom cmdline for search
  --       command_palette = false, -- position the cmdline and popupmenu together
  --       long_message_to_split = true, -- long messages will be sent to a split
  --       inc_rename = false, -- enables an input dialog for inc-rename.nvim
  --       lsp_doc_border = true, -- add a border to hover docs and signature help
  --     },
  --     views = {
  --       mini = {
  --         timeout = 4000,
  --         reverse = false,
  --         position = {
  --           col = "100%",
  --           -- col = 0,
  --         },
  --         size = "auto",
  --         win_options = {
  --           winblend = 17,
  --           winhighlight = {
  --             Normal = "NoiceMini",
  --             IncSearch = "",
  --             Search = "",
  --           },
  --         },
  --       }
  --     },
  --     routes = {
  --       {
  --         filter = {
  --           event = "msg_show",
  --           kind = "",
  --           find = "written"
  --         },
  --         opts = { skip = true }
  --       },
  --       -- {
  --         -- filter = {
  --         --   event = "notify",
  --         --   kind = "warn",
  --         --   find = "Config Change Detected"
  --         -- },
  --         -- view = "mini",
  --         -- opts = { skip = true }
  --       -- },
  --       {
  --         filter = {
  --           event = "msg_show",
  --           kind = "wmsg",
  --           find = "La recherche a atteint"
  --         },
  --         opts = { skip = true }
  --       },
  --       -- {
  --       --   filter = {
  --       --     event = "msg_show",
  --       --     kind = "emsg",
  --       --     find = "Motif introuvable"
  --       --   },
  --       --   -- opts = { skip = true }
  --       -- }
  --     }
  --   },
  --   dependencies = { "MunifTanjim/nui.nvim", "rcarriga/nvim-notify" }
  -- },
  {
    "akinsho/bufferline.nvim",
    -- branch = "v3.*",
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      options = {
        tab_size = 16,
        -- mode = "tabs",
        numbers = "none", -- numbers = "none" | "ordinal" | "buffer_id" | "both" | function({ ordinal, id, lower, raise }): string,
        -- close_command = "BufDel! %d",
        indicator = {
          icon = "",
          style = "none"
        },
        buffer_close_icon = "", -- '',
        modified_icon = "＊", -- '●',
        close_icon = "", -- '',
        left_trunc_marker = '⏴',
        right_trunc_marker = '⏵',
        color_icons = true,
        show_buffer_icons = true,
        show_buffer_close_icons = false,
        get_element_icon = function(element)
          -- element consists of {filetype: string, path: string, extension: string, directory: string}
          -- This can be used to change how bufferline fetches the icon
          -- for an element e.g. a buffer or a tab.
          -- e.g.
          local icon, hl = require('nvim-web-devicons').get_icon_by_filetype(element.filetype, { default = false })
          return icon, hl
          -- or
          -- local custom_map = {my_thing_ft: {icon = "my_thing_icon", hl}}
          -- return custom_map[element.filetype]
        end,
        show_close_icon = false,
        show_tab_indicators = false,
        separator_style = { "", "" },
        diagnostics = "nvim_lsp",
        -- diagnostics_indicator = function(count, level, _, _)
        --   local icon = level:match("error") and " " or " "
        --   return " " .. icon .. count
        -- end,
        hover = {
          enabled = false
        },
        -- always_show_bufferline = true,
        -- enforce_regular_tabs = true
        -- sort_by = 'insert_after_current' |'insert_at_end' | 'id' | 'extension' | 'relative_directory' | 'directory' 'tabs' |
        sort_by = 'directory'
      },
    },
  },
  -- {
  --   'simrat39/symbols-outline.nvim',
  --   opts = {
  --     -- auto_preview = true,
  --     highlight_hovered_item = true,
  --     -- auto_close = true,
  --     show_symbol_details = false,
  --     autofold_depth = 1,
  --     auto_unfold_hover = false,
  --     wrap = true,
  --   }
  -- },
  {
    'stevearc/aerial.nvim',
    -- config = function()
    --   require "telescope".load_extension("smart_open")
    -- end,
    opts = {
      layout = {
        max_width = { 80, 0.4 },
        default_direction = "prefer_left",
      }
    },
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
      "nvim-telescope/telescope.nvim"
    },

  },
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      signs = false,
      highlight = {
        -- after = ""
        --
      },
    }
  },
}
