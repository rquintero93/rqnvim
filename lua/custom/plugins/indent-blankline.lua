return {
  'lukas-reineke/indent-blankline.nvim',
  event = 'VeryLazy',
  ft = { 'lua', 'vim', 'python', 'sql' },
  main = 'ibl',
  ---@module "ibl"
  ---@type ibl.config
  opts = {},
  require('ibl').setup(),
}
