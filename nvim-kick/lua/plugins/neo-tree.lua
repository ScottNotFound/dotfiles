-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'vim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
    },
    config = function()
      require('neo-tree').setup {
        filesystem = {
          window = {
            mappings = {
              ['\\'] = 'close_window',
              ['%'] = 'add',
              ['<del>'] = 'delete',
              ['l'] = 'open',
              ['h'] = 'close_node',
              ['E'] = 'expand_all_nodes',
              ['C'] = 'close_all_nodes',
              ['<F5>'] = 'refresh',
            },
          },
          filtered_items = {
            visible = true,
            hide_dotfiles = false,
          },
          hijack_netrw_behavior = 'open_current',
        },
      }

      vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
      vim.keymap.set('n', '<leader>e', function()
        require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
      end, { desc = 'NeoTree Explorer' })
      vim.keymap.set('n', '<leader>ge', function()
        require('neo-tree.command').execute { source = 'git_status', toggle = true }
      end, { desc = 'Git Explorer' })
      vim.keymap.set('n', '<leader>be', function()
        require('neo-tree.command').execute { source = 'buffers', toggle = true }
      end, { desc = 'Buffer Explorer' })
    end,
  },
}
