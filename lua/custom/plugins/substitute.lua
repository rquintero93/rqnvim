return {
  {
    'gbprod/substitute.nvim',
    config = true,
    keys = {
      {
        's',
        function()
          require('substitute').visual()
        end,
        mode = 'x',
      },
      {
        's',
        function()
          require('substitute').operator()
        end,
        mode = 'n',
      },
      {
        'S',
        function()
          require('substitute').eol()
        end,
        mode = 'n',
      },

      {
        'ss',
        function()
          require('substitute').line()
        end,
        mode = 'n',
      },
    },
  },
}
