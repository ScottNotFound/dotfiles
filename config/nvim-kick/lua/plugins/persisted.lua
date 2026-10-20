return {
  {
    'olimorris/persisted.nvim',
    lazy = false,
    dependencies = { 'nvim-telescope/telescope.nvim' },
    opts = {
      autostart = false,
      autoload = false,
      autosave = true,
      follow_cwd = true,
      save_dir = vim.fn.expand(vim.fn.stdpath 'data' .. '/persisted_sessions/'),
    },
    config = function(opts)
      local persisted = require 'persisted'
      persisted.setup(opts)

      require('telescope').load_extension 'persisted'
      vim.keymap.set('n', '<leader>sp', '<cmd>Telescope persisted<cr>', {
        desc = '[S]earch [P]ersisted Sessions',
      })
    end,
  },
}
