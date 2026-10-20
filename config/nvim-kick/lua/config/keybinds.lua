local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- toggling line numbers
map('n', '<F2>', '<cmd>exe !&rnu? "se nu!" : "se nornu <bar> se nu!"<CR>', { desc = 'Toggle line [n]umbers' })
map('n', '<leader>tn', '<cmd>exe !&rnu? "se nu!" : "se nornu <bar> se nu!"<CR>', { desc = '[T]oggle line [n]umbers' })
map(
  'n',
  '<leader>tl',
  '<cmd>exe &nu? "se rnu!" : "se nu <bar> se rnu"<CR>',
  { desc = '[T]oggle relative [l]ine numbers' }
)
--map('n', '<leader>L', '<cmd>set relativenumber! <bar> set nu!<CR>')

map('n', '<leader>tw', '<cmd>exe &wrap? "set nowrap" : "set wrap"<CR>', { desc = '[T]oggle line [w]rap' })

-- Diagnostic keymaps
map('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
map('n', '<leader>td', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = '[T]oggle [d]iagnostics' })
map('n', '<leader>tv', function()
  vim.diagnostic.config { virtual_text = not vim.diagnostic.config().virtual_text }
end, { desc = '[T]oggle diagnostics [v]irtual text' })

map('n', '<leader>hi', '<cmd>Inspect<cr>', { desc = 'Inspect [h]ighlighted symbol' })
map('n', '<leader>ht', '<cmd>InspectTree<cr>', { desc = 'Inspect [h]ighlighted tree' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- Move lines up and down using Alt + j/k
map('n', '<A-j>', ':m .+1<CR>==', { desc = 'Move line down' })
map('n', '<A-k>', ':m .-2<CR>==', { desc = 'Move line up' })
map('i', '<A-j>', '<Esc>:m .+1<CR>==gi', { desc = 'Move line down (insert)' })
map('i', '<A-k>', '<Esc>:m .-2<CR>==gi', { desc = 'Move line up (insert)' })
map('v', '<A-j>', ":m '>+1<CR>gv=gv", { desc = 'Move selection down' })
map('v', '<A-k>', ":m '<-2<CR>gv=gv", { desc = 'Move selection up' })

-- TIP: Disable arrow keys in normal mode
-- map('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
-- map('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
-- map('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
-- map('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
--  See `:help wincmd` for a list of all window commands
map('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

map('n', '<leader>tms', function()
  require('minuet-server').toggle()
end, { desc = '[T]oggle [m]inuet llm [s]erver' })
map('n', '<leader>tmb', function()
  require('minuet-server').toggle()
end, { desc = '[T]oggle [m]inuet llm [b]ehavior' })
