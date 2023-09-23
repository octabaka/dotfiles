-- disable netrw 
-- vim.g.loaded_netrw = 1
-- vim.g.loaded_netrwPlugin = 1
-- -- --
vim.g.netrw_banner = 0
vim.g.netrw_altv = 1
vim.g.netrw_liststyle = 4
vim.g.netrw_preview = 0
vim.g.netrw_keepdir = 0
vim.g.netrw_winsize = 18



local netrw_grp = vim.api.nvim_create_augroup("netrw_mapping", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = netrw_grp,
  pattern = "netrw",
  callback = function()
    vim.keymap.set({ "n", "v" }, "q", "<cmd>Rex<cr>", { buffer = true})
  end,
})

