return {
  {
    'stevearc/oil.nvim',
    opts = {
      view_options = {
        show_hidden = true,
      },
    },
    dependencies = { { 'nvim-mini/mini.icons', opts = {} } },
    lazy = false,
    keys = {
      {
        '<leader>o',
        '<Cmd>Oil<CR>',
        mode = { 'n' },
        desc = 'Open [o]il',
      },
    },
  },
}
