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
map('n', '<S-tab>', '<Cmd>bprevious<CR>', { desc = 'Previous Buffer', noremap = true, silent = true })
map('n', '<tab>', '<Cmd>bnext<CR>', { desc = 'Next Buffer', noremap = true, silent = true })

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', opts)
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', opts)

-- Go to buffer in position...
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
map('n', '<leader>x', '<Cmd>bd<CR>', { desc = 'Close Buffer', noremap = true, silent = true })
map('n', '<leader>X', '<Cmd>bd!<CR>', { desc = 'Close Buffer (No Save)', noremap = true, silent = true })
-- Open new buffer
map('n', '<leader>n', '<Cmd>enew<CR>', { desc = 'New Buffer', noremap = true, silent = true })

-- Magic buffer-picking mode
map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<C-s-p>', '<Cmd>BufferPickDelete<CR>', opts)

--telescope
map('n', '<leader>fm', '<cmd>Telescope marks<CR>', { desc = '[F]ind [M]arks' })
vim.keymap.set('n', '<Leader>fs', '<cmd>Telescope symbols<cr>', { desc = '[F]ind [S]ymbols' })
vim.keymap.set('n', '<Leader>fy', '<cmd>Telescope neoclip<cr>', { desc = '[F]ind [Y]anks' })
--database ui keymaps
function Close_snacks_dashboard_and_toggle_dbui()
  -- Iterate over all buffers to find the snacks.nvim dashboard
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    -- Use vim.bo to get the filetype of the buffer
    if vim.bo[buf].filetype == 'snacks_dashboard' then
      -- Close the snacks.nvim dashboard buffer
      vim.api.nvim_buf_delete(buf, { force = true })
      break
    end
  end
  -- Toggle dadbod-ui
  vim.cmd 'DBUIToggle'
end

-- Map the function to a key combination, e.g., <leader>db
vim.api.nvim_set_keymap('n', '<leader>db', ':lua Close_snacks_dashboard_and_toggle_dbui()<CR>', { desc = 'Toggle DB', noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<Leader>df', ':DBUIFindBuffer<CR>', { noremap = true, silent = true })

-- iron also has a list of commands, see :h iron-commands for all available commands
vim.keymap.set('n', '<Leader>rs', '<cmd>IronRepl<cr>')
vim.keymap.set('n', '<Leader>rr', '<cmd>IronRestart<cr>')
vim.keymap.set('n', '<Leader>rf', '<cmd>IronFocus<cr>')
vim.keymap.set('n', '<Leader>rh', '<cmd>IronHide<cr>')

vim.keymap.set('n', '<Leader>gg', '<cmd>LazyGit<cr>')

vim.keymap.set('n', '<Leader>cp', '<cmd>CopilotChatToggle<cr>')

function Open_in_visidata()
  -- Write the current buffer to a temporary file
  vim.cmd 'write! /tmp/vd_temp.csv'
  -- Open the temporary file in visidata
  vim.cmd 'TermExec cmd="visidata /tmp/vd_temp.csv" direction=float name="Visidata"'
end

vim.api.nvim_set_keymap('n', '<leader>vd', '<cmd>lua Open_in_visidata()<CR>', { desc = '[V]iew [D]ata', noremap = true, silent = true })

-- Toggleterm keymaps
function _G.set_terminal_keymaps()
  --local opts = { noremap = true }
  vim.api.nvim_buf_set_keymap(0, 't', '<esc>', '<cmd>ToggleTerm<cr>', opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-h>', [[<C-\><C-n><C-W>h]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-j>', [[<C-\><C-n><C-W>j]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-k>', [[<C-\><C-n><C-W>k]], opts)
  vim.api.nvim_buf_set_keymap(0, 't', '<C-l>', [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd 'autocmd! TermOpen term://* lua set_terminal_keymaps()'

vim.keymap.set('n', '<A-f>', '<cmd>ToggleTerm direction=float<cr>', { desc = 'toggle floating terminal' })
vim.keymap.set('n', '<A-h>', '<cmd>ToggleTerm direction=horizontal<cr>', { desc = 'toggle horizontal terminal' })
vim.keymap.set('n', '<A-v>', '<cmd>ToggleTerm direction=vertical<cr>', { desc = 'toggle vertical terminal' })

-- Lspaga code action
vim.keymap.set('n', '<leader>la', '<cmd>Lspsaga code_action<cr>', { desc = 'Code [A]ction' })

-- Neogen annotation keymap

vim.api.nvim_set_keymap('n', '<Leader>ln', ":lua require('neogen').generate()<CR>", { desc = 'Code a[N]otation' })

-- dial increment keymaps
vim.keymap.set('n', '<C-a>', function()
  require('dial.map').manipulate('increment', 'normal')
end)
vim.keymap.set('n', '<C-x>', function()
  require('dial.map').manipulate('decrement', 'normal')
end)
vim.keymap.set('n', 'g<C-a>', function()
  require('dial.map').manipulate('increment', 'gnormal')
end)
vim.keymap.set('n', 'g<C-x>', function()
  require('dial.map').manipulate('decrement', 'gnormal')
end)
vim.keymap.set('v', '<C-a>', function()
  require('dial.map').manipulate('increment', 'visual')
end)
vim.keymap.set('v', '<C-x>', function()
  require('dial.map').manipulate('decrement', 'visual')
end)
vim.keymap.set('v', 'g<C-a>', function()
  require('dial.map').manipulate('increment', 'gvisual')
end)
vim.keymap.set('v', 'g<C-x>', function()
  require('dial.map').manipulate('decrement', 'gvisual')
end)

-- window management
vim.keymap.set('n', '<leader>sv', '<C-w>v', { desc = 'Split window vertically' }) -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s', { desc = 'Split window horizontally' }) -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=', { desc = 'Make splits equal size' }) -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', '<cmd>close<CR>', { desc = 'Close current split' }) -- close current split window
-- vim.keymap.set('n', '<leader>to', '<cmd>tabnew<CR>', { desc = 'Open new tab' }) -- open new tab
-- vim.keymap.set('n', '<leader>tx', '<cmd>tabclose<CR>', { desc = 'Close current tab' }) -- close current tab
-- vim.keymap.set('n', '<leader>tn', '<cmd>tabn<CR>', { desc = 'Go to next tab' }) --  go to next tab
-- vim.keymap.set('n', '<leader>tp', '<cmd>tabp<CR>', { desc = 'Go to previous tab' }) --  go to previous tab
-- vim.keymap.set('n', '<leader>tf', '<cmd>tabnew %<CR>', { desc = 'Open current buffer in new tab' }) --  move current buffer to new tab

-- vim.keymap.set.('n','<leader>u', "<cmd>lua require('undotree').toggle()<cr>", { desc = 'toggle undotree' } )
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

local function augroup(name)
  return vim.api.nvim_create_augroup('lazyvim_' .. name, { clear = true })
end
-- resize splits if window got resized
-- vim.api.nvim_create_autocmd({ 'VimResized' }, {
--   group = augroup 'resize_splits',
--   callback = function()
--     local current_tab = vim.fn.tabpagenr()
--     vim.cmd 'tabdo wincmd ='
--     vim.cmd('tabnext ' .. current_tab)
--   end,
-- })

-- close some filetypes with <q>
vim.api.nvim_create_autocmd('FileType', {
  group = augroup 'close_with_q',
  pattern = {
    'PlenaryTestPopup',
    'checkhealth',
    'dbout',
    'gitsigns-blame',
    'grug-far',
    'help',
    'lspinfo',
    'neotest-output',
    'neotest-output-panel',
    'neotest-summary',
    'notify',
    'qf',
    'spectre_panel',
    'startuptime',
    'tsplayground',
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.schedule(function()
      vim.keymap.set('n', 'q', function()
        vim.cmd 'close'
        pcall(vim.api.nvim_buf_delete, event.buf, { force = true })
      end, {
        buffer = event.buf,
        silent = true,
        desc = 'Quit buffer',
      })
    end)
  end,
})

-- Auto create dir when saving a file, in case some intermediate directory does not exist
vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  group = augroup 'auto_create_dir',
  callback = function(event)
    if event.match:match '^%w%w+:[\\/][\\/]' then
      return
    end
    local file = vim.uv.fs_realpath(event.match) or event.match
    vim.fn.mkdir(vim.fn.fnamemodify(file, ':p:h'), 'p')
  end,
})
-- vim: ts=2 sts=2 sw=2 et
