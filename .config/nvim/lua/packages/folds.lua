return {
  -- folds
  {
    "anuvyklack/pretty-fold.nvim",
    enabled = false,
    init = function()
      vim.o.foldmethod = "expr"
      vim.o.foldexpr = "nvim_treesitter#foldexpr()"
      -- vim.o.foldexpr="v:lnum==1?'>1':getline(v:lnum)=~'import'?1:nvim_treesitter#foldexpr()"
      vim.o.foldcolumn = "0"
      vim.o.foldnestmax = 4
      vim.o.foldminlines = 2
      vim.o.foldlevel = 2
      -- vim.o.foldlevelstart = 2
      vim.o.foldenable = false
    end,
    opts = {
      fill_char = " ",
      sections = {
        left = {
          'content'
        },
        right = {
          ' ', 'number_of_folded_lines', ': ', 'percentage', ' ',
          function(config) return config.fill_char:rep(3) end
        }
      }
    },
  },
  {
    'milisims/foldhue.nvim',
    enabled = false,
    config = function()
      require('foldhue').enable()
    end
  },
  {
    'kevinhwang91/nvim-ufo',
    enabled = true,
    dependencies = { 'kevinhwang91/promise-async' },
    init = function()
      vim.o.foldcolumn = '0' -- '0' is not bad
      vim.o.foldlevel = 99   -- Using ufo provider need a large value, feel free to decrease the value
      vim.o.foldlevelstart = 99
      vim.o.foldenable = true
      -- Using ufo provider need remap `zR` and `zM`. If Neovim is 0.6.1, remap yourself
      vim.keymap.set('n', 'zR', require('ufo').openFoldsExceptKinds)
      vim.keymap.set('n', 'zM', require('ufo').closeAllFolds)
      vim.keymap.set('n', ',', "za", { desc = "toggle Fold" })
      -- vim.keymap.set('n', 'zr', require('ufo').openFoldsExceptKinds)
      -- vim.keymap.set('n', 'zm', require('ufo').closeFoldsWith)
    end,
    config = function()
      require('ufo').setup({
        provider_selector = function(bufnr, filetype, buftype)
          if filetype == 'json' then return {""} end
          if filetype == 'go' or filetype == 'toml' or filetype == 'javascript' or
           filetype == 'typescript' or filetype == 'zig' or filetype == 'rust' or
          filetype == 'cpp' or filetype == 'c'
          then
            return { 'lsp', 'treesitter' }
          else
            return { 'indent' }
          end
        end,
        close_fold_kinds = { "imports", "comment" }
      })
    end
  },
}
