return {
  { "freddiehaddad/feline.nvim",
    dependencies = {
      { "nvim-tree/nvim-web-devicons" },
      { "lewis6991/gitsigns.nvim" },
    },
    config = function()
      require("gitsigns").setup {
        signcolumn = false
      }
      -- local lsp = require('feline.providers.lsp')
      local vi_mode_utils = require("feline.providers.vi_mode")

      local force_inactive = {
        filetypes = {},
        buftypes = {},
        bufnames = {},
      }

      -- local winbar_components = {
      --   active = { {}, {}, {} },
      --   inactive = { {}, {}, {} },
      -- }

      local components = {
        active = { {}, {}, {} },
        inactive = { {}, {}, {} },
      }

      local colors = {
        bg = "#101010",
        black = "#101010",
        yellow = "#e7f2bc",
        cyan = "#8bb3fc",
        oceanblue = "#5854de",
        green = "#28779c",
        orange = "#e7f2bc",
        violet = "#bd93f9",
        magenta = "#bd93f9",
        white = "#ffffff",
        fg = "#ffffff",
        skyblue = "#7daea3",
        red = "#ea6962",
        dark_gray = "#008080",
      }

      local vi_mode_colors = {
        NORMAL = "green",
        OP = "green",
        INSERT = "red",
        CONFIRM = "red",
        VISUAL = "skyblue",
        LINES = "skyblue",
        BLOCK = "skyblue",
        REPLACE = "violet",
        ["V-REPLACE"] = "violet",
        ENTER = "cyan",
        MORE = "cyan",
        SELECT = "orange",
        COMMAND = "green",
        SHELL = "green",
        TERM = "green",
        NONE = "yellow",
      }

      -- local vi_mode_text = {
      --   NORMAL = '<|',
      --   OP = '<|',
      --   INSERT = '|>',
      --   VISUAL = '<>',
      --   LINES = '<>',
      --   BLOCK = '<>',
      --   REPLACE = '<>',
      --   ['V-REPLACE'] = '<>',
      --   ENTER = '<>',
      --   MORE = '<>',
      --   SELECT = '<>',
      --   COMMAND = '<|',
      --   SHELL = '<|',
      --   TERM = '<|',
      --   NONE = '<>',
      --   CONFIRM = '|>'
      -- }

      -- local buffer_not_empty = function()
      --   if vim.fn.empty(vim.fn.expand('%:t')) ~= 1 then
      --     return true
      --   end
      --   return false
      -- end

      -- local checkwidth = function()
      --   local squeeze_width  = vim.fn.winwidth(0) / 2
      --   if squeeze_width > 40 then
      --     return true
      --   end
      --   return false
      -- end

      force_inactive.filetypes = {
        "NvimTree",
        "dbui",
        "packer",
        "startify",
        "fugitive",
        "fugitiveblame",
      }

      force_inactive.buftypes = {
        "terminal",
      }

      -- STATUSLINE
      -- LEFT

      -- vi-mode
      components.active[1][1] = {
        -- provider = ' NVIM ',
        provider = function()
          return " " .. vi_mode_utils.get_vim_mode() .. " "
        end,
        hl = function()
          local val = {}

          val.bg = vi_mode_utils.get_mode_color()
          val.fg = "black"
          val.style = "bold"

          return val
        end,
        right_sep = " ",
      }
      -- vi-symbol
      -- components.active[1][2] = {
      --   provider = function()
      --     return vi_mode_text[vi_mode_utils.get_vim_mode()]
      --   end,
      --   hl = function()
      --     local val = {}
      --     val.fg = vi_mode_utils.get_mode_color()
      --     val.bg = 'bg'
      --     val.style = 'bold'
      --     return val
      --   end,
      --   right_sep = ' '
      -- }
      --
      -- directory
      components.active[1][2] = {
        provider = function()
          return vim.fn.expand("%:p:h")
        end,
        hl = {
          fg = "dark_gray",
          bg = "bg",
          -- style = 'bold'
        },
        right_sep = " ",
      }
      -- filename
      components.active[1][3] = {
        provider = function()
          return vim.fn.expand("%:t")
        end,
        hl = {
          fg = "white",
          bg = "bg",
          style = "bold",
        },
        right_sep = " ",
      }
      -- navic
      -- local navic = require("nvim-navic")
      -- components.active[1][4] = {
      --   provider = function() return navic.get_location() end,
      --   enabled = function() return navic.is_available() end,
      --   hl = {
      --     fg = 'cyan',
      --     style = 'italic'
      --   }
      -- }
      -- MID

      components.active[3][1] = {
        enabled = false,
        provider = function()
          return require("nomodoro").status() -- require("pomodoro").statusline()
        end,
        hl = {
          fg = "cyan",
          bg = "bg",
          -- style = "",
        },
        right_sep = " ",
      }
      -- gitBranch
      components.active[3][2] = {
        provider = "git_branch",
        enabled = true,
        hl = {
          fg = "red",
          bg = "bg",
          style = "bold",
        },
        right_sep = " ",
      }
      -- diffAdd
      -- components.active[2][2] = {
      --   provider = 'git_diff_added',
      --   hl = {
      --     fg = 'green',
      --     bg = 'bg',
      --     style = 'bold'
      --   }
      -- }
      -- -- diffModfified
      -- components.active[2][3] = {
      --   provider = 'git_diff_changed',
      --   hl = {
      --     fg = 'orange',
      --     bg = 'bg',
      --     style = 'bold'
      --   }
      -- }
      -- -- diffRemove
      -- components.active[2][4] = {
      --   provider = 'git_diff_removed',
      --   hl = {
      --     fg = 'red',
      --     bg = 'bg',
      --     style = 'bold'
      --   },
      -- }

      -- RIGHT

      -- fileIcon
      components.active[3][3] = {
        provider = function()
          local filename = vim.fn.expand("%:t")
          local extension = vim.fn.expand("%:e")
          local icon = require("nvim-web-devicons").get_icon(filename, extension)
          if icon == nil then
            icon = ""
          end
          return icon
        end,
        hl = function()
          local val = {}
          local filename = vim.fn.expand("%:t")
          local extension = vim.fn.expand("%:e")
          local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
          if icon ~= nil then
            val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
          else
            val.fg = "white"
          end
          val.bg = "bg"
          val.style = "bold"
          return val
        end,
        right_sep = " ",
      }
      -- fileType
      components.active[3][4] = {
        -- provider = "file_type",
        provider = function ()
          return vim.bo.filetype
        end,
        hl = function()
          local val = {}
          local filename = vim.fn.expand("%:t")
          local extension = vim.fn.expand("%:e")
          local icon, name = require("nvim-web-devicons").get_icon(filename, extension)
          if icon ~= nil then
            val.fg = vim.fn.synIDattr(vim.fn.hlID(name), "fg")
          else
            val.fg = "white"
          end
          val.bg = "bg"
          val.style = "bold"
          return val
        end,
        right_sep = " ",
      }
      -- fileSize
      components.active[3][5] = {
        provider = "file_size",
        enabled = false,
        -- enabled = function()
        --   return vim.fn.getfsize(vim.fn.expand("%:t")) > 0
        -- end,
        hl = {
          fg = "skyblue",
          bg = "bg",
          style = "bold",
        },
        right_sep = " ",
      }
      -- fileFormat
      -- components.active[3][5] = {
      --   provider = function()
      --     return "" .. vim.bo.fileformat:upper() .. ""
      --   end,
      --   hl = {
      --     fg = "white",
      --     bg = "bg",
      --     style = "bold",
      --   },
      --   right_sep = " ",
      -- }
      -- fileEncode
      -- components.active[3][5] = {
      --   provider = "file_encoding",
      --   hl = {
      --     fg = "white",
      --     bg = "bg",
      --     style = "bold",
      --   },
      --   right_sep = " ",
      -- }
      components.active[3][6] = {
        provider = 'position',
        hl = {
          fg = 'white',
          bg = 'bg',
          style = 'bold'
        },
        right_sep = ' '
      }
      -- linePercent
      components.active[3][7] = {
        enabled = false,
        provider = "line_percentage",
        hl = {
          fg = "white",
          bg = "bg",
          style = "bold",
        },
        right_sep = " ",
      }
      -- scrollBar
      -- components.active[3][7] = {
      --   provider = 'scroll_bar',
      --   hl = {
      --     fg = 'bg',
      --     bg = 'yellow',
      --   },
      -- }

      -- INACTIVE

      -- fileType
      components.inactive[1][1] = {
        provider = "file_type",
        hl = {
          fg = "black",
          bg = "cyan",
          style = "bold",
        },
        left_sep = {
          str = " ",
          hl = {
            fg = "NONE",
            bg = "cyan",
          },
        },
        right_sep = {
          {
            str = " ",
            hl = {
              fg = "NONE",
              bg = "cyan",
            },
          },
          " ",
        },
      }

      -- WINBAR
      -- LEFT

      -- MID

      -- RIGHT

      -- LspName
      -- winbar_components.active[3][1] = {
      --   provider = 'lsp_client_names',
      --   hl = {
      --     fg = 'yellow',
      --     style = 'bold'
      --   },
      --   right_sep = ' '
      -- }
      -- -- diagnosticErrors
      -- winbar_components.active[3][2] = {
      --   provider = 'diagnostic_errors',
      --   enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.ERROR) end,
      --   hl = {
      --     fg = 'red',
      --     style = 'bold'
      --   }
      -- }
      -- -- diagnosticWarn
      -- winbar_components.active[3][3] = {
      --   provider = 'diagnostic_warnings',
      --   enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.WARN) end,
      --   hl = {
      --     fg = 'yellow',
      --     style = 'bold'
      --   }
      -- }
      -- -- diagnosticHint
      -- winbar_components.active[3][4] = {
      --   provider = 'diagnostic_hints',
      --   enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.HINT) end,
      --   hl = {
      --     fg = 'cyan',
      --     style = 'bold'
      --   }
      -- }
      -- -- diagnosticInfo
      -- winbar_components.active[3][5] = {
      --   provider = 'diagnostic_info',
      --   enabled = function() return lsp.diagnostics_exist(vim.diagnostic.severity.INFO) end,
      --   hl = {
      --     fg = 'skyblue',
      --     style = 'bold'
      --   }
      -- }

      -- -- INACTIVE

      -- -- fileType
      -- winbar_components.inactive[1][1] = {
      --   provider = 'file_type',
      --   hl = {
      --     fg = 'black',
      --     bg = 'cyan',
      --     style = 'bold'
      --   },
      --   left_sep = {
      --     str = ' ',
      --     hl = {
      --       fg = 'NONE',
      --       bg = 'cyan'
      --     }
      --   },
      --   right_sep = {
      --     {
      --       str = ' ',
      --       hl = {
      --         fg = 'NONE',
      --         bg = 'cyan'
      --       }
      --     },
      --     ' '
      --   }
      -- }

      require("feline").setup({
        theme = colors,
        default_bg = colors.bg,
        default_fg = colors.fg,
        vi_mode_colors = vi_mode_colors,
        components = components,
        force_inactive = force_inactive,
      })

      -- require('feline').winbar.setup({
      -- components = winbar_components,
      -- force_inactive = force_inactive,
      -- })
    end,
  },
}
