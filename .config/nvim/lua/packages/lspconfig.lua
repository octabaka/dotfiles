return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "hrsh7th/cmp-nvim-lsp", "lvimuser/lsp-inlayhints.nvim", "folke/neodev.nvim" },
    config = function()
      require("neodev").setup({})

      -- local lspconfig = require("lspconfig")
      local lspconfig = require 'lspconfig'
      local configs = require("lspconfig.configs")
      if not configs.templ then
        configs.templ = {
          default_config = {
            cmd = { "templ", "lsp" },
            filetypes = { 'templ' },
            root_dir = lspconfig.util.root_pattern("go.mod", ".git"),
            settings = {},
          },
        }
      end


      local capabilities = vim.lsp.protocol.make_client_capabilities()
      capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
      capabilities.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true
      }

      local lsp_flags = {
        debounce_text_changes = 500,
      }
      local on_attach = function(client, bufnr)
        -- require("lsp-inlayhints").on_attach(client, bufnr, false)
        -- require("lsp_signature").on_attach(client, bufnr)
      end
      -- rounded doc
      local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
      function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
        opts = opts or {}
        opts.border = opts.border or "rounded"
        return orig_util_open_floating_preview(contents, syntax, opts, ...)
      end

      -- Others
      local servers = {
        "pyright",
        "tsserver",
        "svelte",
        "cssls",
        "bashls",
        "gopls",
        "rust_analyzer",
        "taplo",
        "graphql",
        "yamlls",
        "dotls",
        "kotlin_language_server",
        "zls",
        "ocamllsp",
        "clangd",
        -- "ccls",
        -- "arduino_language_server",
      }

      for _, lsp in ipairs(servers) do
        capabilities.textDocument.completion.completionItem.snippetSupport = false
        lspconfig[lsp].setup({
          on_attach = on_attach,
          flags = lsp_flags,
          capabilities = capabilities,
          settings = require('lspsettings')
        })
      end

      -- TEMPL (Go)
      configs.templ.setup({
        on_attach = on_attach,
        flags = {
          debounce_text_changes = 150,
        },
      })

      -- LSP_LS
      lspconfig['lua_ls'].setup({
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
        settings = {
          Lua = {
            workspace = {
              checkThirdParty = false,
            },
            diagnostics = {
              globals = { "vim", "vis" },
              -- disable = {"lowercase-global"}
            },
            telemetry = {
              enable = false,
            },
            format = {
              enable = true,
              defaultConfig = {
                indent_style = "tab",
                indent_size = "2",
                tab_width = "2",
                continuation_indent = "2"
              }
            }
          }
        },
      })

      -- ccls
      -- lspconfig['ccls'].setup {
      --   on_attach = on_attach,
      --   flags = lsp_flags,
      --   capabilities = capabilities,
      --   init_options = {
      --     -- compilationDatabaseDirectory = "build",
      --     index = {
      --       threads = 0,
      --     },
      --     clang = {
      --       excludeArgs = { "-frounding-math" },
      --       extraArgs = { "--gcc-toolchain=/home/octa/.espressif/tools/xtensa-esp32s3-elf/esp-12.2.0_20230208/xtensa-esp32s3-elf:" },
      --     },
      --   }
      -- }
      -- Jsonls
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig['jsonls'].setup {
        on_attach = on_attach,
        flags = lsp_flags,
        capabilities = capabilities,
      }

      -- EMMET
      capabilities.textDocument.completion.completionItem.snippetSupport = true
      lspconfig['emmet_ls'].setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { 'gotmpl', 'html', 'typescriptreact', 'javascriptreact', 'css', 'sass', 'scss', 'less' },
        init_options = {
          html = {
            options = {
              -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
              ["bem.enabled"] = true,
            },
          },
          jsx = {
            options = {
              ["jsx.enabled"] = false,
            },
          },
        }
      })
      lspconfig.html.setup({
        on_attach = on_attach,
        flags = lsp_flags,
        filetypes = { 'gotmpl', 'html' },
        capabilities = capabilities,
        settings = require('lspsettings')
      })

      vim.diagnostic.config({
        -- virtual_text = false,
        virtual_text = {
          -- prefix = "…",
          spacing = 2,
          -- severity = "Error",
          severity = nil,
          source = "if_many",
          format = nil,
        },
        underline = false,
        update_in_insert = true,
        signs = true,
        -- float = {
        --   show_header = true,
        --   source = 'if_many',
        --   border = 'rounded',
        --   focusable = false,
        -- }
        -- virtual_lines = {
        --   only_current_line = false,
        --   severity = { min = vim.diagnostic.severity.WARN },
        -- },
      })
      -- require('ufo').setup()
      vim.fn.sign_define("DiagnosticSignError", { text = "→", texthl = "DiagnosticError" })
      vim.fn.sign_define("DiagnosticSignWarn", { text = "→", texthl = "DiagnosticWarn" })
      vim.fn.sign_define("DiagnosticSignInformation", { text = "→", texthl = "DiagnosticInfo" })
      vim.fn.sign_define("DiagnosticSignHint", { text = "→", texthl = "DiagnosticHint" })
    end,
  },
  { "hrsh7th/cmp-nvim-lsp-signature-help" },
  -- Packer:
  {
    "lvimuser/lsp-inlayhints.nvim",
    enabled = false,
    opts = {
      enabled_at_startup = true,
      inlay_hints = {
        parameter_hints = {
          show = true,
        },
      },
    },
  },
  {
    "folke/trouble.nvim",
    enabled = false,
    dependencies = "nvim-tree/nvim-web-devicons",
    opts = {
      mode = "workspace_diagnostics", -- "workspace_diagnostics", "document_diagnostics", "quickfix", "lsp_references", "loclist"
      position = "bottom",
      padding = false,
      height = 4,
      group = true,
      indent_lines = false,
      fold_open = "", -- icon used for open folds
      fold_closed = "", -- icon used for closed folds
      auto_open = true,
      auto_close = true,
      auto_preview = true, -- automatically preview the location of the diagnostic. <esc> to close preview and go back to last window
    },
  },
  {
    "p00f/clangd_extensions.nvim",
    enabled = true,
    opts = {
      inlay_hints = {
        -- inline = vim.fn.has("nvim-0.10") == 1,
        inline = false,
        -- Options other than `highlight' and `priority' only work
        -- if `inline' is disabled
        -- Only show inlay hints for the current line
        only_current_line = false,
        -- Event which triggers a refresh of the inlay hints.
        -- You can make this { "CursorMoved" } or { "CursorMoved,CursorMovedI" } but
        -- not that this may cause  higher CPU usage.
        -- This option is only respected when only_current_line and
        -- autoSetHints both are true.
        only_current_line_autocmd = { "CursorHold" },
        -- whether to show parameter hints with the inlay hints or not
        show_parameter_hints = true,
        -- prefix for parameter hints
        parameter_hints_prefix = "<- ",
        -- prefix for all the other hints (type, chaining)
        other_hints_prefix = "=> ",
        -- whether to align to the length of the longest line in the file
        max_len_align = false,
        -- padding from the left if max_len_align is true
        max_len_align_padding = 1,
        -- whether to align to the extreme right or not
        right_align = false,
        -- padding from the right if right_align is true
        right_align_padding = 7,
        -- The color of the hints
        highlight = "Comment",
        -- The highlight group priority for extmark
        priority = 100,
      },
      ast = {
        -- These are unicode, should be available in any font
        role_icons = {
          type = "🄣",
          declaration = "🄓",
          expression = "🄔",
          statement = ";",
          specifier = "🄢",
          ["template argument"] = "🆃",
        },
        kind_icons = {
          Compound = "🄲",
          Recovery = "🅁",
          TranslationUnit = "🅄",
          PackExpansion = "🄿",
          TemplateTypeParm = "🅃",
          TemplateTemplateParm = "🅃",
          TemplateParamObject = "🅃",
        },
        --[[ These require codicons (https://github.com/microsoft/vscode-codicons)
            role_icons = {
                type = "",
                declaration = "",
                expression = "",
                specifier = "",
                statement = "",
                ["template argument"] = "",
            },

            kind_icons = {
                Compound = "",
                Recovery = "",
                TranslationUnit = "",
                PackExpansion = "",
                TemplateTypeParm = "",
                TemplateTemplateParm = "",
                TemplateParamObject = "",
            }, ]]

        highlights = {
          detail = "Comment",
        },
      },
      memory_usage = {
        border = "none",
      },
      symbol_info = {
        border = "none",
      },
    }
  },
}
