return {
  {
    "terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({
        hook = function()
          if vim.api.nvim_buf_get_option(0, "filetype") == "svelte" then
            require("ts_context_commentstring.internal").update_commentstring({})
          end
          if vim.api.nvim_buf_get_option(0, "filetype") == "typescriptreact" then
            require("ts_context_commentstring.internal").update_commentstring({})
          end
        end
      })
    end
  },
  {
    "JoosepAlviste/nvim-ts-context-commentstring",
    dependencies = "terrortylor/nvim-comment"
  },
  {
    "nvim-treesitter/nvim-treesitter",
    cmd = "TSUpdate",
    config = function()
      local parser_configs = require("nvim-treesitter.parsers").get_parser_configs()
      parser_configs.just = {
        install_info = {
          url = "https://github.com/IndianBoy42/tree-sitter-just", -- local path or git repo
          files = { "src/parser.c", "src/scanner.cc" },
          branch = "main",
        },
        filetype = "just",
        -- filetype = "conf",
      }
      parser_configs.gotmpl = {
        install_info = {
          url = "https://github.com/ngalaiko/tree-sitter-go-template",
          files = { "src/parser.c" }
        },
        filetype = "gotmpl",
        used_by = { "gohtmltmpl", "gotexttmpl", "gotmpl", "yaml", 'html' }
      }
      -- parser_configs.jinja2 = {
      --   install_info = {
      --     url = "https://github.com/dbt-labs/tree-sitter-jinja2",
      --     files = { "src/parser.c" },
      --     branch = "main",
      --   },
      --   filetype = "jinja",
      -- }
      parser_configs.templ = {
        install_info = {
          url = "https://github.com/vrischmann/tree-sitter-templ.git",
          files = { "src/parser.c", "src/scanner.c" },
          branch = "master",
        },
      }
      vim.treesitter.language.register('templ', 'templ')
      parser_configs.d2 = {
        install_info = {
          url = "https://github.com/pleshevskiy/tree-sitter-d2",
          revision = "main",
          files = { "src/parser.c", "src/scanner.cc" },
        },
        filetype = "d2",
      }
      require("nvim-treesitter.configs").setup({
        ensure_installed = { "cpp", "c", "javascript", "go", "svelte", "css",
          "vim", "lua", "html", "python", "toml", "dockerfile", "bash", "hcl",
          "json", "typescript", "tsx", "yaml", "scss", "graphql", "rust", "http",
          "make", "just", "markdown", "query", "http", 'dot', 'd2', 'gotmpl', 'ocaml', 'arduino', 'ninja', 'kotlin'
          -- 'zig'
        },
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { enable = true },
        additional_vim_regex_highlighting = false,
        context_commentstring = {
          enable = true,
          enable_autocmd = false,
          config = {
            svelte = {
              __default = "<!-- %s -->",
              html = "<!-- %s -->",
              css = "/* %s */",
              javascript = "//%s",
              typescript = "//%s",
            },
          }
        }
      })
    end,
  },
  -- { 'nvim-treesitter/playground',
  --   enabled = false,
  --   dependencies = { 'nvim-treesitter/nvim-treesitter' },
  --   keys = { { "<leader>st", "<cmd>TSCaptureUnderCursor<cr>", desc = "show treesitter capture" } },

  -- vim.keymap.set("n", "<leader>st", "<cmd>TSCaptureUnderCursor<cr>", { desc = "show treesitter capture" })
  -- },
  -- { "ziontee113/syntax-tree-surfer",
  --   function()
  --     require('syntax-tree-surfer').setup()

  --   end
  -- },

  -- { 'RRethy/nvim-treesitter-textsubjects',
  --   dependencies = "nvim-treesitter/nvim-treesitter",
  --   function()
  --     require("nvim-treesitter.configs").setup({
  --       textsubjects = {
  --         enable = true,
  --         prev_selection = ',', -- (Optional) keymap to select the previous selection
  --         keymaps = {
  --           ['.'] = 'textsubjects-smart',
  --           [';'] = 'textsubjects-container-outer',
  --           ['i;'] = 'textsubjects-container-inner',
  --         },
  --       },

  --     })

  --   end
  -- },
  -- { 'nvim-treesitter/nvim-treesitter-textobjects',
  --   dependencies = 'nvim-treesitter/nvim-treesitter',
  --   config = function()
  --     require("nvim-treesitter.configs").setup({
  --       textobjects = {
  --         select = {
  --           enable = true,
  --           lookahead = true,
  --           keymaps = {
  --             ["af"] = "@function.outer",
  --             ["if"] = "@function.inner",
  --             ["ac"] = "@class.outer",
  --             ["ic"] = "@class.inner",
  --           },
  --         },
  --         swap = {
  --           enable = true,
  --           swap_next = {
  --             ["ml"] = "@parameter.inner",
  --             -- ["mn"] = "@block.outer",
  --           },
  --           swap_previous = {
  --             ["mh"] = "@parameter.inner",
  --             -- ["mp"] = "@block.outer",
  --           },
  --         },
  --       },
  --     })
  --   end
  -- },
  -- { 'drybalka/tree-climber.nvim' },

}
