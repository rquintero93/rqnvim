return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    require('lualine').setup {
      options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = '' },
        section_separators = { left = '', right = '' },
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
        lualine_a = { 'mode' },
        lualine_b = { 'branch', 'diff', 'diagnostics' },
        lualine_c = { 'filename' },
        lualine_x = { 'encoding', 'filetype' },
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
        lualine_a = { { 'buffers', mode = 2, use_mode_colors = true } },
        lualine_b = {},
        lualine_c = {},
        lualine_x = {},
        lualine_y = { { 'windows', mode = 1, use_mode_colors = true } },
        lualine_z = { { 'tabs', use_mode_colors = true } },
      },
      winbar = {},
      inactive_winbar = {},
      extensions = { 'lazy', 'neo-tree', 'nvim-dap-ui', 'quickfix', 'toggleterm', 'trouble', 'fzf', 'mason' },
    }
  end,
}
