vim.g.python3_host_prog = "/usr/bin/python"
vim.o.termguicolors = true
vim.cmd("colorscheme octa")

vim.o.shell = "/bin/bash"
vim.o.scrolloff = 4
vim.o.scrolljump = 0
vim.o.wrap = false
vim.o.expandtab = true
vim.o.tabstop = 2
vim.o.shiftwidth = 2
vim.o.autoindent = true
vim.o.display = "lastline"
vim.o.encoding = "utf-8"
vim.o.mouse = "a"
vim.o.viminfo = "'1000"
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.splitkeep = "topline"
vim.o.autowrite = true
vim.o.autoread = true
vim.o.hidden = true
vim.o.showmatch = true
vim.o.report = 0
vim.o.pumheight = 22
vim.o.number = false
vim.o.relativenumber = false
vim.o.signcolumn = "yes"
vim.o.cursorline = true
vim.o.clipboard = "unnamedplus"
vim.o.switchbuf = "useopen"
vim.o.winminheight = 0
vim.o.wildmode = "longest,list,full"
vim.o.iskeyword = "@,48-57,_,192-255,?"
-- vim.o.listchars = ''
-- set listchars=tab:→\ ,eol:↵,trail:·,extends:↷,precedes:↶
vim.o.whichwrap = "b,s,<,>,h,l"
vim.o.fileencodings = "utf-8"
vim.o.backup = false
vim.o.swapfile = false
vim.o.writebackup = false
vim.opt.diffopt = vim.opt.diffopt + "vertical"
vim.o.title = true
vim.o.titleold = "bash"
vim.o.wildignore = "*/node_modules/*,*/.git/*,*.min.js,*.min.css"

vim.o.showmode = false
vim.o.cmdheight = 0
vim.o.laststatus = 3
vim.o.ruler = false
vim.o.showcmd = false

vim.opt.fillchars = {
  eob = " ",
  horiz = "⎼",
  horizup = "―",
  horizdown = "―",
  vert = "⏐",
  vertleft = "⏐",
  vertright = "⏐",
  verthoriz = "+"
}

vim.o.path = ".,,"
vim.o.startofline = false
vim.opt.sessionoptions = vim.opt.sessionoptions + "globals"

vim.o.completeopt = "menu,menuone,noselect,noinsert"

vim.o.timeout = true
vim.o.timeoutlen = 400
vim.g.mapleader = " "
vim.g.maplocalleader = ";"

-- --  Return to last edit position when opening files (You want this!)
vim.api.nvim_create_autocmd('BufReadPost', {
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})


-- highlight yanked text for 200ms using the "Visual" highlight group
local highlight_grp = vim.api.nvim_create_augroup("Highlight_yank", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ higroup = "QuickFixLine", timeout = 300 })
  end,
  group = highlight_grp,
})

-- custom options for filetype
local custom_filetype_options_grp = vim.api.nvim_create_augroup("Custom_filetype_options", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  group = custom_filetype_options_grp,
  callback = function(data)
    if data.match == "make" then
      vim.bo.expandtab = false
      vim.bo.shiftwidth = 2
      vim.bo.softtabstop = 0
      vim.wo.list = true
    elseif data.match == "text" then
      vim.wo.wrap = true
    elseif data.match == "yaml" then
      vim.wo.list = true
    elseif data.match == "svelte" then
      vim.o.foldlevel = 1
    elseif data.match == "css" then
      vim.o.foldlevel = 1
    elseif data.match == "json" then
      vim.o.foldlevel = 1
    elseif data.match == "vim" then
      vim.o.foldlevel = 1
    elseif data.match == "rust" then
      vim.o.foldlevel = 1
    elseif data.match == "help" then
      vim.keymap.set({ "n", "v" }, "q", "<cmd>quit<cr>", { buffer = true })
    elseif data.match == "graphql" then
      vim.opt_local.commentstring = "# %s"
    elseif data.match == "gotmpl" then
      vim.opt_local.commentstring = "{{/* %s */}}"
    elseif data.match == "hcl" then
      vim.opt_local.commentstring = "# %s"
    elseif data.match == "just" then
      vim.opt_local.commentstring = "# %s"
    elseif data.match == "zig" then
      vim.opt_local.commentstring = "// %s"
    elseif data.match == "arduino" then
      vim.opt_local.commentstring = "// %s"
    elseif data.match == "cpp" then
      vim.opt_local.commentstring = "// %s"
    elseif data.match == "c" then
      vim.opt_local.commentstring = "// %s"
    elseif data.match == "kotlin" then
      vim.opt_local.commentstring = "// %s"
    end
  end,
})


-- auto import golang
local goimport_grp = vim.api.nvim_create_augroup('GoImports', { clear = true })
-- Fold_level = 0
vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.go' },
  callback = function()
    Go_org_imports(1000)
    -- golang autoimport
    -- vim.lsp.buf.execute_command({ command = "_go.organizeImports", arguments = { vim.fn.expand("%:p") } })
  end,
  group = goimport_grp
})

function Go_org_imports(wait_ms_max)
  local params = vim.lsp.util.make_range_params()
  params.context = { only = { "source.organizeImports" } }
  local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, wait_ms_max)
  for cid, res in pairs(result or {}) do
    for _, r in pairs(res.result or {}) do
      if r.edit then
        local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
        vim.lsp.util.apply_workspace_edit(r.edit, enc)
      end
    end
  end
end

vim.filetype.add({ filename = { ['justfile'] = 'just' } })
vim.filetype.add({ filename = { ['Vagrantfile'] = 'ruby' } })
vim.filetype.add({ filename = { ['dscpclassify'] = 'config' } })
vim.filetype.add({ extension = { gohtml = 'gotmpl' } })
vim.filetype.add({ extension = { html = 'gotmpl' } })
vim.filetype.add({ extension = { conflist = 'json' } })
vim.filetype.add({ extension = { inc = 'cpp' } })
-- vim.filetype.add({ extension = { cpp = 'arduino' } })
vim.filetype.add({ extension = { ino = 'cpp' } })

-- -- custom set filetype
-- local filetype_grp = vim.api.nvim_create_augroup("AutoFileType", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufRead", "BufNewFile" }, {
--   group = filetype_grp,
--   pattern = { "Vagrantfile", "*.gohtml" },
--   callback = function()
--     local file = vim.fn.expand("<afile>")
--     local ext = vim.fn.expand("%:e")
--     if file == "Vagrantfile" then
--       vim.o.filetype = "ruby"
--     elseif ext == "gohtml" then
--       vim.o.filetype = "html"
--       -- elseif file == "justfile" then
--       --   vim.o.filetype = "just"
--     end
--   end,
-- })
-- format avant save
-- local autoformat_grp = vim.api.nvim_create_augroup('AutoFormat', { clear = true })
-- -- Fold_level = 0
-- vim.api.nvim_create_autocmd('BufWritePre', {
--   pattern = { '*.tsx', '*.go', '*.svelte', '*.rs', '*.lua', '*.json' },
--   callback = function()
--     vim.lsp.buf.format({ async = false })
--     -- Fold_level = vim.o.foldlevel
--   end,
--   group = autoformat_grp
-- })
-- vim.api.nvim_create_autocmd('BufWritePost', {
--   pattern = { '*.tsx', '*.go', '*.svelte', '*.rs', '*.lua', '*.json' },
--   callback = function()
--     vim.cmd('e %')
--     vim.o.foldlevel = Fold_level
--     -- print(Fold_level)
--   end,
--   group = autoformat_grp
-- })
--
-- dot/graphviz 
local graphviz_grp= vim.api.nvim_create_augroup('AutoGraphviz', { clear = true })
-- Fold_level = 0
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = {"*.dot"},
  callback = function()
    -- vim.notify("Diagramme généré", "info", { title = "Diagramme" })
    vim.fn.jobstart("dot -Tpng -Gdpi=300 " .. vim.fn.expand("%:p") ..  " > " .. vim.fn.expand("%:p:r") .. ".png", {
      stdout_buffered = true,
      sterr_buffered = true,
      on_stderr = function (_, data)
        if data then
          local myStr = unpack(data)
          if myStr ~= "" then
            vim.notify(myStr, vim.log.levels.ERROR, { title = "Diagram" })
          end
        end
      end
    })
  end,
  group = graphviz_grp
})

-- diagrams 
local diagram_grp= vim.api.nvim_create_augroup('AutoDiagram', { clear = true })
-- Fold_level = 0
vim.api.nvim_create_autocmd('BufWritePost', {
  pattern = {"diagram.ts"},
  callback = function()
    -- vim.notify("Diagramme généré", "info", { title = "Diagramme" })
    vim.fn.jobstart("esr " .. vim.fn.expand("%:p"), {
      stdout_buffered = true,
      sterr_buffered = true,
      on_stderr = function (_, data)
        if data then
          local myStr = unpack(data)
          if myStr ~= "" then
            vim.notify(myStr, vim.log.levels.ERROR, { title = "Diagram" })
          end
        end
      end
    })
  end,
  group = diagram_grp
})

