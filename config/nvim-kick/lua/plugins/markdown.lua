return {
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.nvim' }, -- if you use the mini.nvim suite
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-mini/mini.icons' },        -- if you use standalone mini plugins
    -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' }, -- if you prefer nvim-web-devicons
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
    config = function()
      local mkd = require 'render-markdown'
      mkd.setup {
        enabled = true,
        preset = 'none',
        heading = {
          enabled = true,
        },
      }
      vim.keymap.set('n', '<leader>md', mkd.toggle, { desc = 'Toggle Render [M]ark[d]own' })
    end,
  },
}
