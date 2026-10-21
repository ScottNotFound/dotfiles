return {
  {
    'coffebar/neovim-project',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'nvim-telescope/telescope.nvim',
      'Shatur/neovim-session-manager',
    },
    lazy = false,
    priority = 100,
    opts = {
      -- Tell the plugin where your projects live so it can find them
      -- Supports glob patterns like "~/Projects/*"
      projects = {
        '~/projects/*',
        '~/.dotfiles/*',
        -- '~/Development/*',
        -- You can also add explicit individual paths:
        -- "~/work/repo-name",
      },
      -- Automatically save the session when you close Neovim
      last_session_on_startup = false, -- Disabled so you see the dashboard first!
      dashboard_mode = false,
      picker = {
        type = 'telescope',
      },
      datapath = vim.fn.stdpath 'data' .. '/project_sessions/',
    },
    config = function(_, opts)
      -- Enable restoring global variables if you want to keep plugin states
      -- vim.opt.sessionoptions:append 'globals'

      require('neovim-project').setup(opts)

      -- KEYMAPS
      vim.keymap.set(
        'n',
        '<leader>dp',
        '<cmd>Telescope neovim-project discover<cr>',
        { desc = '[D]iscover [P]rojects' }
      )
      vim.keymap.set(
        'n',
        '<leader>dh',
        '<cmd>Telescope neovim-project history<cr>',
        { desc = '[D]iscover Project [H]istory' }
      )
    end,
  },
}
