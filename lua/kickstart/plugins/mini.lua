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
      require('mini.operators').setup {
        {
          -- Each entry configures one operator.
          -- `prefix` defines keys mapped during `setup()`: in Normal mode
          -- to operate on textobject and line, in Visual - on selection.

          -- Evaluate text and replace with output
          evaluate = {
            prefix = 'g=',

            -- Function which does the evaluation
            func = nil,
          },

          -- Exchange text regions
          exchange = {
            prefix = 'gx',

            -- Whether to reindent new text to match previous indent
            reindent_linewise = true,
          },

          -- Multiply (duplicate) text
          multiply = {
            prefix = 'gm',

            -- Function which can modify text before multiplying
            func = nil,
          },

          -- Replace text with register
          replace = {
            prefix = 'gr',

            -- Whether to reindent new text to match previous indent
            reindent_linewise = true,
          },

          -- Sort text
          sort = {
            prefix = 'gs',

            -- Function which does the sort
            func = nil,
          },
        },
      }
      require('mini.bracketed').setup {}
      require('mini.bufremove').setup {}
      -- require('mini.files').setup {}
      require('mini.icons').setup {}
      require('mini.indentscope').setup { symbol = '|' }
      require('mini.move').setup {}
      require('mini.surround').setup {}
    end,
    -- ... and there is more!
    --  Check out: https://github.com/echasnovski/mini.nvim
  },
}
-- vim: ts=2 sts=2 sw=2 et
