return {
  'GCBallesteros/NotebookNavigator.nvim',

  keys = {
    {
      ']h',
      function()
        require('notebook-navigator').move_cell 'd'
      end,
    },
    {
      '[h',
      function()
        require('notebook-navigator').move_cell 'u'
      end,
    },
    { '<leader>J', "<cmd>lua require('notebook-navigator').run_cell()<cr>" },
    { '<leader>j', "<cmd>lua require('notebook-navigator').run_and_move()<cr>" },
  },
  dependencies = {
    'echasnovski/mini.comment',
    'hkupty/iron.nvim', -- repl provider
    'anuvyklack/hydra.nvim',
  },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local nn = require 'notebook-navigator'
    nn.setup { activate_hydra_keys = '<leader>hy' }
  end,
}
