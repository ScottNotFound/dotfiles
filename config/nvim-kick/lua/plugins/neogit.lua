return {
  {
    'NeogitOrg/neogit',
    enabled = true,
    dependencies = {
      'sindrets/diffview.nvim',
      'nvim-telescope/telescope.nvim',
    },
    lazy = true,
    cmd = 'Neogit',
    keys = {
      { '<leader>gg', '<cmd>Neogit<cr>', desc = 'Open Neogit UI' },
    },
    opts = {
      integrations = {
        telescope = true,
      },
    },
  },
}
