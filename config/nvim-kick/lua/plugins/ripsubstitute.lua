return {
  {
    'chrisgrieser/nvim-rip-substitute',
    enabled = true,
    cmd = 'RipSubstitute',
    opts = {
      keymaps = { abort = '<Esc>' },
    },
    keys = {
      {
        '<leader>rs',
        function()
          require('rip-substitute').sub()
        end,
        mode = { 'n', 'x' },
        desc = '[R]ip [S]ubstitute',
      },
    },
  },
}
