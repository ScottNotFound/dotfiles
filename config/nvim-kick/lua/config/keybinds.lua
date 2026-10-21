-- Thanks to LazyVim and nvim-kickstart as well as their contributors, many keymaps are taken from them.

local map = vim.keymap.set

-- Clear highlights on search when pressing <Esc> in normal mode
--  See `:help hlsearch`
map('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- toggling line numbers
map('n', '<leader>tln', '<cmd>exe !&rnu? "se nu!" : "se nornu <bar> se nu!"<CR>', { desc = '[T]oggle [l]ine [n]umbers' })
map(
  'n',
  '<leader>trln',
  '<cmd>exe &nu? "se rnu!" : "se nu <bar> se rnu"<CR>',
  { desc = '[T]oggle [r]elative [l]ine [n]umbers' }
)
map('n', '<leader>tlw', '<cmd>exe &wrap? "set nowrap" : "set wrap"<CR>', { desc = '[T]oggle [l]ine [w]rap' })

map('n', '<leader>ihs', '<cmd>Inspect<cr>', { desc = '[I]nspect [h]ighlighted [s]ymbol' })
map('n', '<leader>iht', '<cmd>InspectTree<cr>', { desc = '[I]nspect [h]ighlighted [t]ree' })

-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
map('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

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

map('n', '<C-Left>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
map('n', '<C-Right>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
map('n', '<C-Down>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
map('n', '<C-up>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- better up/down
map({ 'n', 'x' }, 'j', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, '<Down>', "v:count == 0 ? 'gj' : 'j'", { desc = 'Down', expr = true, silent = true })
map({ 'n', 'x' }, 'k', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })
map({ 'n', 'x' }, '<Up>', "v:count == 0 ? 'gk' : 'k'", { desc = 'Up', expr = true, silent = true })

-- Resize window using <ctrl> arrow keys
map('n', '<C-S-Up>', '<cmd>resize +2<cr>', { desc = 'Increase Window Height' })
map('n', '<C-S-Down>', '<cmd>resize -2<cr>', { desc = 'Decrease Window Height' })
map('n', '<C-S-Left>', '<cmd>vertical resize -2<cr>', { desc = 'Decrease Window Width' })
map('n', '<C-S-Right>', '<cmd>vertical resize +2<cr>', { desc = 'Increase Window Width' })

-- Move Lines
map('n', '<A-j>', "<cmd>execute 'move .+' . v:count1<cr>==", { desc = 'Move Lines Down' })
map('n', '<A-k>', "<cmd>execute 'move .-' . (v:count1 + 1)<cr>==", { desc = 'Move Lines Up' })
map('i', '<A-j>', '<esc><cmd>m .+1<cr>==gi', { desc = 'Move Lines Down' })
map('i', '<A-k>', '<esc><cmd>m .-2<cr>==gi', { desc = 'Move Lines Up' })
map('v', '<A-j>', ":<C-u>execute \"'<,'>move '>+\" . v:count1<cr>gv=gv", { desc = 'Move Lines Down' })
map('v', '<A-k>', ":<C-u>execute \"'<,'>move '<-\" . (v:count1 + 1)<cr>gv=gv", { desc = 'Move Lines Up' })

-- buffers
map('n', '<leader>bd', '<cmd>bp|bd #<cr>', { desc = '[B]uffer [D]elete' })
map('n', '<leader>bfd!', '<cmd>bfd!<cr>', { desc = '[B]uffer [F]orce [K]ill [!]' })
map('n', '<leader>bs', '<cmd>w<cr>', { desc = '[B]uffer [S]ave' })

-- https://github.com/mhinz/vim-galore#saner-behavior-of-n-and-n
map('n', 'n', "'Nn'[v:searchforward].'zv'", { expr = true, desc = 'Next Search Result' })
map('x', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('o', 'n', "'Nn'[v:searchforward]", { expr = true, desc = 'Next Search Result' })
map('n', 'N', "'nN'[v:searchforward].'zv'", { expr = true, desc = 'Prev Search Result' })
map('x', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })
map('o', 'N', "'nN'[v:searchforward]", { expr = true, desc = 'Prev Search Result' })

-- save file
map({ 'i', 'x', 'n', 's' }, '<C-s>', '<cmd>w<cr><esc>', { desc = 'Save File' })

-- comment
map({ 'i', 'n' }, '<C-/>', 'gcc', { remap = true, desc = 'Toggle comment line' })
map({ 'x' }, '<C-/>', 'gc', { remap = true, desc = 'Toggle comment' })
map('n', 'gcA', function()
  local suffix = '  ' .. string.format(vim.bo.commentstring, '')
  local win = vim.api.get_current_win()
  local row, _ = unpack(vim.api.nvim_win_get_cursor(win))
  local eol_col = string.len(vim.api.nvim_get_current_line())
  vim.api.nvim_buf_set_text(0, row - 1, eol_col, row - 1, eol_col, { suffix })
  local new_col = eol_col + string.len(suffix)
  vim.api.nvim_win_set_cursor(win, { row, new_col })
  vim.cmd 'startinsert'
end, { desc = 'Append comment' })

map('n', '<leader>nf', '<cmd>enew<cr>', { desc = '[N]ew [F]ile' })

-- diagnostic
local diagnostic_goto = function(next, severity)
  return function()
    vim.diagnostic.jump {
      count = (next and 1 or -1) * vim.v.count1,
      severity = severity and vim.diagnostic.severity[severity] or nil,
      float = true,
    }
  end
end
map('n', ']e', diagnostic_goto(true, 'ERROR'), { desc = 'Next Error' })
map('n', '[e', diagnostic_goto(false, 'ERROR'), { desc = 'Prev Error' })
map('n', ']w', diagnostic_goto(true, 'WARN'), { desc = 'Next Warning' })
map('n', '[w', diagnostic_goto(false, 'WARN'), { desc = 'Prev Warning' })

map('n', '<leader>dq', vim.diagnostic.setloclist, { desc = 'Open [D]iagnostic [Q]uickfix list' })
map('n', '<leader>td<leader>', function()
  vim.diagnostic.enable(not vim.diagnostic.is_enabled())
end, { desc = '[T]oggle [d]iagnostics [ ]' })
map('n', '<leader>tdvt', function()
  vim.diagnostic.config { virtual_text = not vim.diagnostic.config().virtual_text }
end, { desc = '[T]oggle [d]iagnostics [v]irtual [t]ext' })

-- tabs
map('n', '<leader><tab>l', '<cmd>tablast<cr>', { desc = '[Tab] -> [L]ast' })
map('n', '<leader><tab>o', '<cmd>tabonly<cr>', { desc = '[Tab] -> Quit [O]thers' })
map('n', '<leader><tab>f', '<cmd>tabfirst<cr>', { desc = '[Tab] -> [F]irst' })
map('n', '<leader><tab>]', '<cmd>tabnext<cr>', { desc = '[Tab] -> ] Next' })
map('n', '<leader><tab>[', '<cmd>tabprevious<cr>', { desc = '[Tab] -> [ Prev' })
map('n', '<leader><tab>q', '<cmd>tabclose<cr>', { desc = '[Tab] -> [Q]uit' })
map('n', '<leader><tab>c', '<cmd>tabnew<cr>', { desc = '[Tab] -> [C]reate' })
map('n', '<leader><tab><tab>', '<cmd>tabnew<cr>', { desc = '[Tab] -> New [Tab]' })

-- splits
map('n', '<leader>%', '<C-W>v', { desc = 'vertical split', remap = true })
map('n', '<leader>"', '<C-W>s', { desc = 'horizontal split', remap = true })
map('n', '<leader>X', '<C-W>c', { desc = 'close pane', remap = true })

map('n', '<leader>tls', function()
  require('llama-cpp-server').toggle()
end, { desc = '[T]oggle [l]lama llm [s]erver' })
map('n', '<leader>tlb', function()
  require('llama-cpp-server').toggle()
end, { desc = '[T]oggle [l]lama llm [b]ehavior' })
