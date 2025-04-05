return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
        disabled_filetypes = {
          winbar = {},
          statusline = { 'snacks_dashboard' },
        },
        ignore_focus = {},
        always_divide_middle = true,
        always_show_tabline = true,
        globalstatus = true,
        refresh = {
          statusline = 100,
          tabline = 100,
          winbar = 100,
        },
      },
      sections = {
        lualine_a = {
          'mode',
          {
            'macro',
            fmt = function()
              local reg = vim.fn.reg_recording()
              if reg ~= '' then
                return 'Recording @' .. reg
              end
              return nil
            end,
            -- color = { fg = '#ff9e64' },
            draw_empty = false,
          },
        },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = {},
        lualine_x = { { require('action-hints').statusline }, 'encoding', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { 'filename' },
        lualine_x = { 'location' },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {
        lualine_a = { { 'buffers', mode = 2, use_mode_colors = true, hide_filename_extension = true } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { { 'windows', mode = 1, use_mode_colors = true } },
        lualine_z = { { 'tabs', use_mode_colors = true } },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = { 'lazy', 'quickfix', 'toggleterm', 'trouble', 'fzf', 'mason' },
    }
  end,
}
