return {
  {
    'folke/flash.nvim',
    enabled = true,
    opts = {
      jump = {
        autojump = false,
      },
    },
    keys = {
      {
        '<leader>?',
        function()
          require('flash').jump {
            search = {
              mode = 'search',
              incremental = true,
            },
            search_match = function(pattern)
              return vim.fn.fuzzy_match and pattern or pattern
            end,
          }
        end,
        mode = { 'n', 'x', 'o' },
        desc = 'Fuzzy Flash Jump',
      },
    },
  },
}
