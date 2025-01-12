return {
  'LiadOz/nvim-dap-repl-highlights',
  dependencies = {
    'rcarriga/nvim-dap-ui',
  },
  config = function()
    require('nvim-dap-repl-highlights').setup()
  end,
}
