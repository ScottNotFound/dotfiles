-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

vim.pack.add {
  { src = 'https://github.com/nvim-neo-tree/neo-tree.nvim', version = vim.version.range '3' },
  { src = 'https://github.com/vim-lua/plenary.nvim' },
  { src = 'https://github.com/MunifTanjim/nui.nvim' },
--  '1n7ax/'unvim-window-picker',
}

vim.keymap.set('n', '\\', '<Cmd>Neotree reveal<CR>', { desc = 'NeoTree reveal', silent = true })
vim.keymap.set('n',
  '<leader>e',
  function()
    require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
  end,
  {  desc = 'NeoTree Explorer'}
)
vim.keymap.set('n',
  '<leader>ge',
  function()
    require('neo-tree.command').execute { source = 'git_status', toggle = true }
  end,
  {desc = 'Git Explorer'}
)
vim.keymap.set('n',
  '<leader>be',
  function()
    require('neo-tree.command').execute { source = 'buffers', toggle = true }
  end,
  {desc = 'Buffer Explorer'}
)

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

