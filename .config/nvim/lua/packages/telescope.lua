return {
  {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.1',
    config = function()
      local act = require('telescope.actions')
      local bui = require('telescope.builtin')
      local ext = require('telescope').extensions
      require('telescope').setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = act.close,
              ["<C-h>"] = "which_key",
              ["<C-j>"] = act.move_selection_next,
              ["<C-k>"] = act.move_selection_previous,
            }
          },
          vimgrep_arguments = {
            "rg",
            "--color=never",
            "--no-heading",
            "--with-filename",
            "--line-number",
            "--column",
            "--smart-case",
            "--trim",
          },
        },
        pickers = {
          buffers = {
            prompt_prefix = "buffers 🔍 ",
            ignore_current_buffer = true,
            sort_lastused = true,
          },
          find_files = {
            prompt_prefix = "files 🔍 ",
            find_command = { "fd", "--type", "f", "--hidden", "--follow", "--exclude", ".git" },
          },
          live_grep = {
            prompt_prefix = "grep 🔍 ",
            disable_coordinates = true,
          },
          lsp_document_symbols = {
            theme = "ivy",
            symbol_width = 46
          },
          symbols = {
            -- source = { "emoji", "file", "buffer", "nvim_lsp" },
          },
        },
        extensions = {
          aerial = {
            -- Display symbols as <root>.<parent>.<symbol>
            show_nesting = {
              ['_'] = false, -- This key will be the default
              json = true,   -- You can set the option for specific filetypes
              yaml = true,
            },
            show_lines = false,
          },

          -- frecency = {
          --   default_workspace = "CWD",
          --   db_root = "~/.config/nvim/data/",
          --   show_scores = false,
          --   show_unindexed = false,
          --   ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
          --   workspaces = {
          --     ["nvim"] = "~/.config/nvim",
          --     ["dotfiles"] = "~/dotfiles",
          --   },
          -- },
        },
      })
      local my_ivy = require('telescope.themes').get_ivy({
        layout_config = {
          preview_cutoff = 1,
          width = 1.0,
          height = 0.3,
          prompt_position = "top",
        },
        border = false
      })
      local find_f = function()
        -- return bui.find_files(my_ivy)
        local opts = vim.deepcopy(my_ivy)
        opts.cwd_only = true
        opts.prompt_prefix = "files 🔍 "
        ext.smart_open.smart_open(opts)
        -- return require('telescope').extensions.frecency.frecency(opts)
      end
      local grep_f = function()
        return bui.live_grep(my_ivy)
      end
      local grep_f2 = function()
        return bui.grep_string(my_ivy)
      end
      local buff_f = function()
        return bui.buffers(my_ivy)
      end
      local symb_f = function()
        local opts = vim.deepcopy(my_ivy)
        opts.prompt_prefix = "symbols 🔍 "
        opts.cwd_only = true
        -- print( vim.inspect( ext.aerial.aerial) )
        -- print(vim.inspect(opts))
        ext.aerial.aerial(opts)
      end
      vim.keymap.set("n", "<leader><space>", buff_f, { desc = "buffers" })
      vim.keymap.set("n", "<leader>f", find_f, { desc = "fuzzy find files" })
      vim.keymap.set("n", "<leader>F", ":lcd %:p:h <bar> lua require('telescope.builtin').find_files()<cr>",
        { desc = "fuzzy find files in current dir" })
      vim.keymap.set("n", "<m-f>", grep_f, { desc = "grep" })
      vim.keymap.set("n", "<m-F>", grep_f2, { desc = "grep" })
      vim.keymap.set("n", "gr", bui.lsp_references, { desc = "goto references" })
      vim.keymap.set("n", "gi", bui.lsp_implementations, { desc = "goto implementations" })
      vim.keymap.set("n", "<leader>3", function()
        bui.diagnostics({ bufnr = 0 })
      end, { desc = "diagnostics document" })
      vim.keymap.set("n", "<leader>4", bui.diagnostics, { desc = "diagnostic buffers" })
      vim.keymap.set("n", "<leader>K", bui.keymaps, { desc = "Keymaps" })
      vim.keymap.set("n", "<leader>sa", bui.highlights, { desc = "show highlights capture" })
      vim.keymap.set("n", "<leader>H", bui.help_tags, { desc = "help tags" })
      vim.keymap.set("n", "gm", bui.marks, { desc = "marks" })
      vim.keymap.set("n", "ge", bui.symbols, { desc = "Emojis" })
      vim.keymap.set("n", "gd", function() bui.lsp_definitions({ fname_width = 50 }) end, { desc = "goto definition" })
      vim.keymap.set("n", "<leader>o", symb_f, { desc = "goto symbols" })
      -- vim.keymap.set("n", "gs", bui.lsp_document_symbols, { desc = "goto symbols" })
      require("telescope").load_extension("smart_open")
      require('telescope').load_extension('aerial')
    end,
    dependencies = { 'nvim-lua/plenary.nvim', 'stevearc/aerial.nvim' },
  },
  {
    "danielfalk/smart-open.nvim",
    enabled = true,
    dependencies = { "kkharji/sqlite.lua" },
    branch = "0.1.x",
  }
}
