return {
  'mfussenegger/nvim-dap',
  recommended = true,
  desc = 'Debugging support. Requires language specific adapters to be configured. (see lang extras)',

  dependencies = {
    'rcarriga/nvim-dap-ui',
    -- virtual text for the debugger
    {
      'theHamsta/nvim-dap-virtual-text',
      opts = {},
    },
    {
      'jbyuki/one-small-step-for-vimkind',
      -- stylua: ignore
      config = function()
        local dap = require("dap")
        dap.adapters.nlua = function(callback, conf)
          local adapter = {
            type = "server",
            host = conf.host or "127.0.0.1",
            port = conf.port or 8086,
          }
          if conf.start_neovim then
            local dap_run = dap.run
            dap.run = function(c)
              adapter.port = c.port
              adapter.host = c.host
            end
            require("osv").run_this()
            dap.run = dap_run
          end
          callback(adapter)
        end
        dap.configurations.lua = {
          {
            type = "nlua",
            request = "attach",
            name = "Run this file",
            start_neovim = {},
          },
          {
            type = "nlua",
            request = "attach",
            name = "Attach to running Neovim instance (port = 8086)",
            port = 8086,
          },
        }
      end,
    },
  },

  -- stylua: ignore
  keys = {
    { "<leader>cB", function() require("dap").set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, desc = "Breakpoint Condition" },
    { "<leader>cb", function() require("dap").toggle_breakpoint() end, desc = "Toggle Breakpoint" },
    { "<leader>cc", function() require("dap").continue() end, desc = "Run/Continue" },
    -- { "<leader>da", function() require("dap").continue({ before = get_args }) end, desc = "Run with Args" },
    { "<leader>cC", function() require("dap").run_to_cursor() end, desc = "Run to Cursor" },
    { "<leader>cg", function() require("dap").goto_() end, desc = "Go to Line (No Execute)" },
    { "<leader>ci", function() require("dap").step_into() end, desc = "Step Into" },
    { "<leader>cj", function() require("dap").down() end, desc = "Down" },
    { "<leader>ck", function() require("dap").up() end, desc = "Up" },
    { "<leader>cl", function() require("dap").run_last() end, desc = "Run Last" },
    { "<leader>co", function() require("dap").step_out() end, desc = "Step Out" },
    { "<leader>cO", function() require("dap").step_over() end, desc = "Step Over" },
    { "<leader>cP", function() require("dap").pause() end, desc = "Pause" },
    { "<leader>cr", function() require("dap").repl.toggle() end, desc = "Toggle REPL" },
    { "<leader>cs", function() require("dap").session() end, desc = "Session" },
    { "<leader>ct", function() require("dap").terminate() end, desc = "Terminate" },
    { "<leader>cw", function() require("dap.ui.widgets").hover() end, desc = "Widgets" },
  },

  config = function()
    -- load mason-nvim-dap here, after all adapters have been setup
    -- if LazyVim.has 'mason-nvim-dap.nvim' then
    --   require('mason-nvim-dap').setup(custom.plugins 'mason-nvim-dap.nvim')
    -- end
    --
    -- vim.api.nvim_set_hl(0, 'DapStoppedLine', { default = true, link = 'Visual' })
    --
    -- for name, sign in pairs(custom.plugins.config.icons.dap) do
    --   sign = type(sign) == 'table' and sign or { sign }
    --   vim.fn.sign_define('Dap' .. name, { text = sign[1], texthl = sign[2] or 'DiagnosticInfo', linehl = sign[3], numhl = sign[3] })
    -- end
    --
    -- -- setup dap config by VsCode launch.json file
    -- local vscode = require 'dap.ext.vscode'
    -- local json = require 'plenary.json'
    -- vscode.json_decode = function(str)
    --   return vim.json.decode(json.json_strip_comments(str))
    -- end
    require('mason-nvim-dap').setup()
  end,
}
