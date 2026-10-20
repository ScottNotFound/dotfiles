return {
  { -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help ibl`
    main = 'ibl',
    opts = {},
  },

  {
    'NMAC427/guess-indent.nvim',
    event = 'BufReadPre',
    config = function()
      require('guess-indent').setup {}
      vim.api.nvim_create_autocmd('User', {
        pattern = 'ConformFormatPost',
        callback = function()
          vim.defer_fn(function()
            vim.cmd 'GuessIndent'
          end, 20)
        end,
      })
    end,
  },
}
