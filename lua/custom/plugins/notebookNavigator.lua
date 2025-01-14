return {
  'GCBallesteros/NotebookNavigator.nvim',
  ft = { 'python', 'r', 'julia' },
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
    { '<leader>jr', "<cmd>lua require('notebook-navigator').run_cell()<cr>", { desc = 'run cell' } },
    { '<leader>jj', "<cmd>lua require('notebook-navigator').run_and_move()<cr>", { desc = 'run cell and move' } },
  },
  dependencies = {
    'echasnovski/mini.comment',
    'hkupty/iron.nvim', -- repl provider
    'anuvyklack/hydra.nvim',
  },
  -- event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local nn = require 'notebook-navigator'
    nn.setup { activate_hydra_keys = '<leader>jn' }
  end,
}
