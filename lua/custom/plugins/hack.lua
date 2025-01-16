return {
  'letieu/hacker.nvim',
  -- event = 'VeryLazy',
  cmd = { 'Hack' },
  config = function()
    require('hacker').setup {

      filetype = 'python',
    }
  end,
}
