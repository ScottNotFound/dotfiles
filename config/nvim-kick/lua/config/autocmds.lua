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

vim.api.nvim_create_autocmd({ 'BufLeave', 'FocusLost' }, {
  pattern = '*',
  callback = function()
    if vim.bo.modified and vim.bo.buftype == '' and vim.fn.filereadable(vim.api.nvim_buf_get_name(0)) == 1 then
      vim.cmd 'noautocmd write'
    end
  end,
  desc = 'Auto-save on buffer or focus leave',
})
