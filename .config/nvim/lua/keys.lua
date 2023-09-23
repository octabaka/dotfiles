-- functions ####################
-- local reload_config = function()
-- vim.cmd("runtime init.lua")
-- vim.cmd("color octa")
-- end
local reload_and_sync = function()
  -- vim.cmd("runtime init.lua")
  require("lazy").sync()
end
local util = require 'lspconfig.util'


local function switch_source_header(bufnr)
  bufnr = util.validate_bufnr(bufnr)
  local clangd_client = util.get_active_client_by_name(bufnr, 'clangd')
  local params = { uri = vim.uri_from_bufnr(bufnr) }
  if clangd_client then
    clangd_client.request('textDocument/switchSourceHeader', params, function(err, result)
      if err then
        error(tostring(err))
      end
      if not result then
        print 'Corresponding file cannot be determined'
        return
      end
      vim.api.nvim_command('edit ' .. vim.uri_to_fname(result))
    end, bufnr)
  else
    print 'method textDocument/switchSourceHeader is not supported by any servers active on the current buffer'
  end
end

local switch_source_headerz = function()
  switch_source_header(0)
end

-- toggle_diagnostics
local diagnostics_active = true
local toggle_diagnostics = function()
  diagnostics_active = not diagnostics_active
  if diagnostics_active then
    vim.diagnostic.show()
  else
    vim.diagnostic.hide()
  end
end

-- toggle numbers
local numbers_active = false
local toggle_numbers = function()
  numbers_active = not numbers_active
  if numbers_active then
    vim.cmd("set number")
  else
    vim.cmd("set nonumber")
  end
end
-- toggle ;
local toggle_character = function(character)
  local delimiters = { ",", ";" }
  local line = vim.api.nvim_get_current_line()
  local last_char = line:sub(-1)

  if last_char == character then
    return vim.api.nvim_set_current_line(line:sub(1, #line - 1))
  elseif vim.tbl_contains(delimiters, last_char) then
    return vim.api.nvim_set_current_line(line:sub(1, #line - 1) .. character)
  else
    return vim.api.nvim_set_current_line(line .. character)
  end
end

local silent_noremap = { noremap = true, silent = true }
-- ###############################
--
vim.keymap.set("n", "<m-s>", "<cmd>:w<cr>")
vim.keymap.set("i", "<m-s>", "<esc><cmd>:w<cr><esc>")

vim.keymap.set({ "n" }, "<leader>c", "<cmd>lcd %:p:h<cr>", { desc = "set pwd to current file dir", silent = false })
vim.keymap.set("n", "<leader>n", ":noh<enter>", { desc = "no highlight" })
-- vim.keymap.set({ "n", "v" }, "q", "<cmd>BufDel<cr>")
vim.keymap.set({ "n", "v" }, "q", "<cmd>bd!<cr>")

vim.keymap.set("n", "<Leader>pp", "<cmd>Alpha<cr>", { desc = "startup menu" })
-- vim.keymap.set("n", "<leader>ps", reload_config, { desc = "reload config" })
vim.keymap.set({ "n" }, "<leader>ps", reload_and_sync, { desc = "Sync packages", silent = false })

-- ############ DIFF ####################
-- vim.keymap.set("n", "<leader>ds", ":diffsplit ~/snippets/", { desc = "diffsplit snippets ?" })
-- vim.keymap.set("n", "<leader>dg", ":diffget<cr>", { desc = "diff get" })
-- vim.keymap.set("n", "<leader>dp", ":diffput<cr>", { desc = "diff put" })
-- vim.keymap.set("n", "<leader>dd", ":diffsplit<space>", { desc = "diff split" })
-- vim.keymap.set("v", "<leader>dd", ":Linediff <cr> <bar> :vs ~/snippets/<cr>", { desc = "linediff snippets ?" })
-- vim.keymap.set("v", "<leader>dl", ":Linediff <cr>", { desc = "linediff" })

-- ###########   NAV ###############
vim.keymap.set("n", "<leader>e", "<cmd>Lf %:p:h<cr>", { desc = "LF Explorer" })
-- vim.keymap.set("n", "<leader>E", ":lcd %:p:h <bar> Lf<cr>", { desc = "LF Explorer in current dir" })
vim.keymap.set("n", "<leader>t", "<cmd>TodoTelescope<cr>", { desc = "Todo dans Telescope" })

-- ###########    DEV   ###############
-- vim.keymap.set("n", "<leader>5", "<cmd>lua vim.lsp.buf.format()<cr>", { desc = "format current file" })
vim.keymap.set("n", "<leader>5", "<cmd>lua vim.lsp.buf.format({formatting_options = {tabSize = 2}})<cr>",
  { desc = "format current file" })
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "goto definition" })
-- vim.keymap.set("n", "gD", "<cmd>tab split | lua vim.lsp.buf.definition()<cr>", { desc = "goto definition" })
vim.keymap.set("n", "<leader>1", switch_source_headerz, { desc = "switch source header", silent = true })
vim.keymap.set("n", "gn", vim.diagnostic.goto_next, { desc = "goto next error", silent = true })
vim.keymap.set("n", "gp", vim.diagnostic.goto_prev, { desc = "goto previous error" })
vim.keymap.set("n", "<leader>k", vim.lsp.buf.hover, { desc = "documentation" })
vim.keymap.set("n", "<leader>2", vim.lsp.buf.rename, { desc = "rename symbol" })
vim.keymap.set({ "n", "v" }, "<leader>a", vim.lsp.buf.code_action, { desc = "code action" })

vim.keymap.set("n", "<Leader>se", "<cmd>e ~/.config/nvim/snippets<cr>", { desc = "edit snippets" })
vim.keymap.set("n", "<Leader>si", ":set invlist<CR>", { desc = "show invisible characters" })
vim.keymap.set("n", "<leader>sd", toggle_diagnostics, { desc = "toggle lsp" })
-- vim.keymap.set("n", "<Leader>sh", '<cmd>lua require("lsp-inlayhints").toggle()<cr>', { desc = "toggle inlay hints" })
vim.keymap.set('n', '<leader>sh', '<cmd>lua vim.lsp.inlay_hint(0)<cr>', { desc = "toggle inlay hints" })
vim.keymap.set("n", "<leader>sg", "<cmd>Gitsigns toggle_signs<cr>", { desc = "toggle git signs" })
vim.keymap.set("n", "<leader>st", "<cmd>Inspect<cr>", { desc = "inspect highlight at cursor" })

-- vim.keymap.set("n", "<leader>sd", "<cmd>lua print(vim.inspect(vim.o.foldlevel))<cr>",
--   { desc = "debug foldlevel" })

vim.keymap.set({ "n", "v" }, "gh", "0", { desc = "goto début de ligne" })
vim.keymap.set({ "n", "v" }, "gl", "$", { desc = "goto fin de ligne" })
vim.keymap.set("n", "gj", "<c-d>", { desc = "go down" })
vim.keymap.set("n", "gk", "<c-u>", { desc = "go up" })
vim.keymap.set("n", "<leader>h", "<cmd>BufferLineCyclePrev<CR>", { desc = "previous buffer" })
vim.keymap.set("n", "<leader>l", "<cmd>BufferLineCycleNext<CR>", { desc = "next buffer" })
--
vim.keymap.set({ "n" }, "#", "<cmd>CommentToggle<cr>", silent_noremap)
vim.keymap.set({ "v" }, "#", ":'<,'>CommentToggle<cr>")

-- vim.keymap.set("n", "<leader>,", function() toggle_character(";") end, { desc = "toggle end of line ;" })
--
vim.keymap.set({ "n", "v" }, "<Leader>sn", toggle_numbers, { desc = "toggle numbers" })
-- vim.keymap.set({ "n", "v" }, "<Leader>so", "<cmd>SymbolsOutline<cr>", { desc = "toggle symbols" })
vim.keymap.set('n', '<leader>so', '<cmd>AerialToggle!<CR>', { desc = "AerialToggle (outline)" })
-- vim.keymap.set("n", "<leader>sp", '<cmd>Telescope aerial<cr>', { desc = "goto symbols" })
vim.keymap.set({ "n", "v" }, "<Leader>R", "<Plug>RestNvim<cr>", { desc = "Run http req" })
