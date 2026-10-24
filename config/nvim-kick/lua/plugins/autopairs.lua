-- autopairs
-- https://github.com/windwp/nvim-autopairs

return {
  {
    'windwp/nvim-autopairs',
    event = 'InsertEnter',
    config = function()
      require('nvim-autopairs').setup {
        check_ts = true,
      }
    end,
  },
  {
    'RRethy/nvim-treesitter-endwise',
    ft = { 'lua', 'ruby', 'bash', 'vim', 'elixer' },
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
  },
}
