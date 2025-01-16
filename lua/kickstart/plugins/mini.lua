return {
  { -- Collection of various small independent plugins/modules
    'echasnovski/mini.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- Better Around/Inside textobjects
      --
      -- Examples:
      --  - va)  - [V]isually select [A]round [)]paren
      --  - yinq - [Y]ank [I]nside [N]ext [Q]uote
      --  - ci'  - [C]hange [I]nside [']quote
      require('mini.ai').setup { n_lines = 500 }

      require('mini.icons').setup {}
      require('mini.indentscope').setup {}
      require('mini.bufremove').setup {}
      require('mini.bracketed').setup {}
    end,

    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  },
}
-- vim: ts=2 sts=2 sw=2 et
