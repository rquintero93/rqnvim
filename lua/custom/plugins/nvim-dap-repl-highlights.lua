return {
  'LiadOz/nvim-dap-repl-highlights',
  event = { 'BufNewFile', 'BufRead' },
  dependencies = {
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    require('nvim-dap-repl-highlights').setup()
  end,
}
