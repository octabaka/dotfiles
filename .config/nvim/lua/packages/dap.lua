-- local setKeys = function()
--   vim.keymap.set("n", "<Leader>dd", "<cmd>lua require('dap').continue()<cr>", { desc = "dap continue" })
--   vim.keymap.set("n", "<Leader>o", "<Cmd>lua require'dap'.step_over()<CR>", { desc = "dap step_over" })
--   vim.keymap.set("n", "<Leader>i", "<Cmd>lua require'dap'.step_into()<CR>", { desc = "dap step_into" })
--   vim.keymap.set("n", "<Leader>u", "<Cmd>lua require'dap'.step_out()<CR>", { desc = "dap step_out" })
--   vim.keymap.set("n", "<Leader>b", "<Cmd>lua require'dap'.toggle_breakpoint()<CR>", { desc = "dap toggle_breakpoint" })
--   vim.keymap.set("n", "<Leader>db", "<Cmd>lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
--     { desc = "dap set_breakpoint" })
--   vim.keymap.set("n", "<Leader>dl",
--     "<Cmd>lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<CR>", { desc = "dap Log point" })
--   vim.keymap.set("n", "<Leader>de", "<Cmd>lua require'dap'.repl.open()<CR>", { desc = "dap repl" })
--   vim.keymap.set("n", "<Leader>dr", "<Cmd>lua require'dap'.run_last()<CR>", { desc = "dap run_last" })
--   vim.keymap.set("n", "<Leader>do", "<Cmd>lua require'dapui'.open()<CR>", { desc = "dapui open" })
--   vim.keymap.set("n", "<Leader>dc", "<Cmd>lua require'dapui'.close()<CR>", { desc = "dapui close" })
-- end

return {
  { "mfussenegger/nvim-dap",
    enabled = false,
    -- init = setKeys()
  },
  { "leoluz/nvim-dap-go",
    enabled = false,
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      dap_configurations = {
        {
          -- Must be "go" or it will be ignored by the plugin
          type = "go",
          name = "Attach remote",
          mode = "remote",
          request = "attach",
        },
      },
      -- delve configurations
      delve = {
        -- time to wait for delve to initialize the debug session.
        -- default to 20 seconds
        initialize_timeout_sec = 20,
        -- a string that defines the port to start delve debugger.
        -- default to string "${port}" which instructs nvim-dap
        -- to start the process in a random available port
        port = "${port}"
      }
    }
  },
  { "rcarriga/nvim-dap-ui",
    enabled = false,
    dependencies = { "mfussenegger/nvim-dap" },
    opts = {
      icons = { expanded = "", collapsed = "", current_frame = "" },
      mappings = {
        -- Use a table to apply multiple mappings
        expand = { "<CR>", "<2-LeftMouse>" },
        open = "o",
        remove = "d",
        edit = "e",
        repl = "r",
        toggle = "t",
      },
      -- Use this to override mappings for specific elements
      element_mappings = {
        -- Example:
        -- stacks = {
        --   open = "<CR>",
        --   expand = "o",
        -- }
      },
      -- Expand lines larger than the window
      -- Requires >= 0.7
      expand_lines = vim.fn.has("nvim-0.7") == 1,
      -- Layouts define sections of the screen to place windows.
      -- The position can be "left", "right", "top" or "bottom".
      -- The size specifies the height/width depending on position. It can be an Int
      -- or a Float. Integer specifies height/width directly (i.e. 20 lines/columns) while
      -- Float value specifies percentage (i.e. 0.3 - 30% of available lines/columns)
      -- Elements are the elements shown in the layout (in order).
      -- Layouts are opened in order so that earlier layouts take priority in window sizing.
      layouts = {
        {
          elements = {
            -- "repl",
            -- "console",
            { id = "scopes", size = 1.00 },
          },
          size = 0.10, -- 25% of total lines
          position = "bottom",
        },
        {
          elements = {
            -- "repl",
            -- "console",
            { id = "watches", size = 1.00 },
          },
          size = 0.10, -- 25% of total lines
          position = "bottom",
        },
        {
          elements = {
            -- Elements can be strings or table with id and size keys.
            "breakpoints",
            "stacks",
          },
          size = 40, -- 40 columns
          position = "left",
        },
      },
      controls = {
        -- Requires Neovim nightly (or 0.8 when released)
        enabled = false,
        -- Display controls in this element
        element = "repl",
        icons = {
          pause = "",
          play = "",
          step_into = "",
          step_over = "",
          step_out = "",
          step_back = "",
          run_last = "",
          terminate = "",
        },
      },
      floating = {
        max_height = nil, -- These can be integers or a float between 0 and 1.
        max_width = nil, -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
          close = { "q", "<Esc>" },
        },
      },
      windows = { indent = 1 },
      render = {
        max_type_length = nil, -- Can be integer or nil.
        max_value_lines = 100, -- Can be integer or nil.
      }
    }
  }
}


