-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>', { desc = 'clear search highlight' })

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- TIP: Disable arrow keys in normal mode
-- vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- barbar tab keymaps
local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

-- Move to previous/next
map('n', '<S-tab>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<tab>', '<Cmd>BufferNext<CR>', opts)

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Goto buffer in position...
map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

-- Pin/unpin buffer
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<leader>x', '<Cmd>BufferClose<CR>', opts)
-- Open new buffer
map('n', '<leader>n', '<Cmd>enew<CR>', { desc = 'BufferNew' })

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

-- Sort automatically by...
--map('n', '<Space>bb', '<Cmd>BufferOrderByBufferNumber<CR>', opts)
--map('n', '<Space>bn', '<Cmd>BufferOrderByName<CR>', opts)
--map('n', '<Space>bd', '<Cmd>BufferOrderByDirectory<CR>', opts)
--map('n', '<Space>bl', '<Cmd>BufferOrderByLanguage<CR>', opts)
--map('n', '<Space>bw', '<Cmd>BufferOrderByWindowNumber<CR>', opts)

--telescope find marks
map('n', '<leader>fm', '<cmd>Telescope marks<CR>', { desc = '[f]ind [m]arks' })

vim.api.nvim_set_keymap('n', '<Leader>db', ':DBUIToggle<CR>', { noremap = true, silent = true })

vim.api.nvim_set_keymap('n', '<Leader>df', ':DBUIFindBuffer<CR>', { noremap = true, silent = true })

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<Leader>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<Leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<Leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<Leader>rh', '<cmd>IronHide<cr>')

vim.keymap.set('n', '<Leader>gg', '<cmd>LazyGit<cr>')

vim.keymap.set('n', '<Leader>cp', '<cmd>CopilotChatToggle<cr>')

vim.keymap.set('n', '<Leader>fs', '<cmd>Telescope symbols<cr>', { desc = '[f]ind [s]ymbols' })
vim.keymap.set('n', '<Leader>fy', '<cmd>Telescope neoclip<cr>', { desc = '[f]ind [y]anks' })

function Open_in_visidata()
  -- Write the current buffer to a temporary file
  vim.cmd 'write! /tmp/vd_temp.csv'

  vim.fn.jobstart({
    'osascript',
    '-e',
    [[tell application "Ghostty" to activate]],
    '-e',
    [[tell application "System Events" to keystroke "t" using {command down}]],
    '-e',
    [[delay 0.5]],
    '-e',
    [[tell application "System Events" to keystroke "visidata /tmp/vd_temp.csv"]],
    '-e',
    [[tell application "System Events" to key code 36]], -- Press "Enter"
  }, { detach = true })
  --
end
vim.api.nvim_set_keymap('n', '<leader>vd', '<cmd>lua Open_in_visidata()<CR>', { noremap = true, silent = true })

function _G.set_terminal_keymaps()
  --local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', '<cmd>ToggleTerm<cr>', opts)
  vim.api.nvim_buf_set_keymap(0, 't', 'jk', [[<C-\><C-n>]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

vim.keymap.set('n', '<A-f>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'toggle floating terminal' })
vim.keymap.set('n', '<A-h>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'toggle horizontal terminal' })
vim.keymap.set('n', '<A-v>', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'toggle vertical terminal' })
-- vim.keymap.set('n', '<A-t>', '<cmd>ToggleTerm<cr>')

-- Lspaga code action
vim.keymap.set('n', '<leader>ca', '<cmd>Lspsaga code_action<cr>', opts)

-- Neogen annotation keymap

vim.api.nvim_set_keymap('n', '<Leader>cn', ":lua require('neogen').generate()<CR>", { desc = '[c]ode a[n]otation' })
-- [[ Basic Autocommands ]]
--  See `:help lua-guide-autocommands`

-- Highlight when yanking (copying) text
--  Try it with `yap` in normal mode
--  See `:help vim.highlight.on_yank()`
vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.highlight.on_yank()
  end,
})

-- vim: ts=2 sts=2 sw=2 et
