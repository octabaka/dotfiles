return {
  {
    "dcampos/nvim-snippy",
    opts = {
      is = {
        ['<Tab>'] = 'expand_or_advance',
        ['<S-Tab>'] = 'previous',
      }
    }
  },
  -- https://github.com/altermo/ultimate-autopair.nvim -- à tester
  {
    "windwp/nvim-autopairs",
    enabled = true,
    opts = {
      check_ts = true,
      ts_config = {
        lua = { "string" }, -- it will not add a pair on that treesitter node
      },
      enable_check_bracket_line = true,
    }
  },
  {
    'ofirgall/cmp-lspkind-priority',
    opts = {
      priority = {
        'Field',
        'Snippet',
        'Method',
        'Function',
        'Constructor',
        'Variable',
        'Class',
        'Interface',
        'Module',
        'Property',
        'Unit',
        'Value',
        'Enum',
        'Keyword',
        'Color',
        'File',
        'Reference',
        'Folder',
        'EnumMember',
        'Constant',
        'Struct',
        'Event',
        'Operator',
        'TypeParameter',
        'Text',
      }
    }
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "hrsh7th/cmp-nvim-lsp-signature-help", "hrsh7th/cmp-path", "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-nvim-lsp",
      "ofirgall/cmp-lspkind-priority",
      -- "zbirenbaum/copilot-cmp",
      "onsails/lspkind-nvim", "dcampos/cmp-snippy",
    },
    config = function()
      local cmp = require("cmp")
      local snippy = require("snippy")
      local lspkind = require("lspkind")
      local types = require("cmp.types")
      local lspkind_priority = require('cmp-lspkind-priority')
      local compare = require('cmp.config.compare')



      local has_words_before = function()
        unpack = unpack or table.unpack
        local line, col = unpack(vim.api.nvim_win_get_cursor(0))
        return col ~= 0
          and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
      end
      local function deprioritize_snippet(entry1, entry2)
        if entry1:get_kind() == types.lsp.CompletionItemKind.Snippet then
          return false
        end
        if entry2:get_kind() == types.lsp.CompletionItemKind.Snippet then
          return true
        end
      end

      cmp.setup({
        -- performance = {
        --   debounce = 60,
        --   throttle = 30,
        --   fetching_timeout = 800,
        -- },
        completion = {
          completeopt = "menu,menuone,noinsert,noselect",
          -- menuone: popup even when there's only one match
          -- " noinsert: Do not insert text until a selection is made
          -- " noselect: Do not select, force user to select one from the menu
        },
        -- view = {
        --   entries = { name = 'custom', selection_order = 'near_cursor' }
        -- },
        preselect = cmp.PreselectMode.None,
        snippet = {
          expand = function(args)
            snippy.expand_snippet(args.body)
          end,
        },
        window = {
          completion = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          }),
          documentation = cmp.config.window.bordered({
            winhighlight = "Normal:Normal,FloatBorder:FloatBorder,CursorLine:PmenuSel,Search:None",
          }),
        },
        mapping = {
          ["<C-d>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete({}),
          ["<C-c>"] = cmp.mapping.close(),
          ["<C-y>"] = cmp.config.disable,
          -- ["<CR>"] = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false }),
          ["<CR>"] = cmp.mapping.confirm({
            select = true,
            behavior = cmp.ConfirmBehavior.Replace,
          }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
          ["<Tab>"] = cmp.mapping(function(fallback)
            -- if snippy.can_expand() then
            --   snippy.expand()
            if cmp.visible() then
              cmp.select_next_item()
              -- elseif has_words_before() then
              --   cmp.complete()
            else
              fallback()
            end
          end, { "i", "s" }),

          ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
              -- elseif snippy.can_jump(-1) then
              --   snippy.previous()
            else
              fallback()
            end
          end, { "i", "s" }),
        },
        formatting = {
          -- expandable_indicator = true,
          format = lspkind.cmp_format({
            mode = "symbol_text",
            maxwidth = 46,
            ellipsis_char = '…',
            symbol_map = {
              Copilot = "",
              Codeium = "",
            },
            before = function(_, vim_item)
              -- print(vim.inspect(vim_item))
              vim_item.menu = ""
              return vim_item
            end,
          }),
          -- fields = { 'abbr', 'kind', 'menu'}
        },
        sorting = {
          -- priority_weight = 2,
          comparators = {
            -- deprioritize_snippet,
            -- require("copilot_cmp.comparators").prioritize,
            -- require("copilot_cmp.comparators").score,
            lspkind_priority.compare,
            compare.offset,
            compare.exact,
            -- compare.score,
            require("clangd_extensions.cmp_scores"),
            compare.recently_used,
            compare.locality,
            -- cmp.config.compare.kind,
            compare.sort_text,
            compare.length,
            compare.order,
          },
        },
        matching = {
          -- disallow_fuzzy_matching = false,
          -- disallow_partial_matching = true,
          --   disallow_prefix_unmatching = true,
        },
        sources = cmp.config.sources({
          -- { name = "codeium" },
          { name = "nvim_lsp" },
          { name = "snippy" },
          -- { name = "copilot" },
          { name = 'nvim_lsp_signature_help' },
          { name = "buffer" },
          { name = "path" },
        }),
      })
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
}
