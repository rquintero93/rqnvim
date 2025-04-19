return {
  'EdenEast/nightfox.nvim',
  lazy = true,
  priority = 2000, -- Make sure to load this before all the other start plugins.
  init = function()
    -- Load the colorscheme here.
    -- Like many other themes, this one has different styles, and you could load
    -- any other, such as 'tokyonight-storm', 'tokyonight-moon', or 'tokyonight-day'.
    vim.cmd.colorscheme 'carbonfox'
  end,
  config = function()
    -- Default options
    require('nightfox').setup {
      options = {
        -- Compiled file's destination location
        compile_path = vim.fn.stdpath 'cache' .. '/nightfox',
        compile_file_suffix = '_compiled', -- Compiled file suffix
        transparent = true, -- Disable setting background
        terminal_colors = true, -- Set terminal colors (vim.g.terminal_color_*) used in `:terminal`
        dim_inactive = true, -- Non focused panes set to alternative background
        module_default = true, -- Default enable value for modules
        colorblind = {
          enable = false, -- Enable colorblind support
          simulate_only = false, -- Only show simulated colorblind colors and not diff shifted
          severity = {
            protan = 0, -- Severity [0,1] for protan (red)
            deutan = 0, -- Severity [0,1] for deutan (green)
            tritan = 0, -- Severity [0,1] for tritan (blue)
          },
        },
        styles = { -- Style to be applied to different syntax groups
          comments = 'NONE', -- Value is any valid attr-list value `:help attr-list`
          conditionals = 'NONE',
          constants = 'NONE',
          functions = 'NONE',
          keywords = 'NONE',
          numbers = 'NONE',
          operators = 'NONE',
          strings = 'NONE',
          types = 'NONE',
          variables = 'NONE',
        },
        inverse = { -- Inverse highlight for different types
          match_paren = false,
          visual = false,
          search = false,
        },
        modules = { -- List of various plugins and additional options
          -- ...
          barbar = true, -- barbar.nvim
          cmp = true, -- nvim-cmp
          -- dap_ui = true, -- nvim-dap-ui
          gitsigns = true, -- gitsigns.nvim
          telescope = true, -- telescope.nvim
          whichkey = true, -- which-key.nvim
          treesitter = true, -- nvim-treesitter
          rainbow_delimiters = true, -- rainbow_delimiters.nvim
          lsp_saga = true, -- lspsaga.nvim
          lsp_trouble = true, -- lsp-trouble.nvim
          indent_blankline = true, -- indent-blankline.nvim
          mini = true, -- minimap.vim
          modes = true, -- vim-modes.nvim
          native_lsp = true, -- nvim-lspconfig
          neotree = true, -- neotree
          notify = true, -- notify.nvim
          diagnostic = true, -- nvim-diagnostic
          neotest = true, -- neotest.nvim
          dashboard = true, -- dashboard-nvim
          alpha = true, -- alpha-nvim
        },
      },
      palettes = {},
      specs = {},
      groups = {},
    }
  end,
}
