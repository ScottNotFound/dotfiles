-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  {
    'Crysthamus/nvim-file-operations',
    dependencies = {
      -- Uncomment whichever supported plugin(s) you use
      -- "nvim-tree/nvim-tree.lua",
      'nvim-neo-tree/neo-tree.nvim',
      -- "simonmclean/triptych.nvim"
    },
    opts = {},
  },
  {
    'nvim-neo-tree/neo-tree.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'MunifTanjim/nui.nvim',
      's1n7ax/nvim-window-picker',
      'nvim-tree/nvim-web-devicons',
    },
    lazy = false,
    opts = {
      sources = {
        'filesystem',
        'buffers',
        'git_status',
        'document_symbols',
      },
      source_selector = {
        winbar = true,
      },
      default_component_configs = {
        window = {
          mappings = {
            ['\\'] = 'close_window',
            ['<C-\\>'] = 'next_source',
          },
        },
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
        window = {
          mappings = {
            ['%'] = 'add',
            ['<del>'] = 'delete',
            ['l'] = 'open',
            ['h'] = 'close_node',
            ['E'] = 'expand_all_nodes',
            ['C'] = 'close_all_nodes',
            ['<F5>'] = 'refresh',
            ['P'] = { 'toggle_preview', config = { use_float = true } },
          },
        },
        filtered_items = {
          visible = true,
          hide_dotfiles = false,
        },
        hijack_netrw_behavior = 'open_current',
      },
      buffers = {
        show_unloaded = true,
      },
      add_blank_line_at_top = true,
      auto_clean_after_session_restore = true,
      close_if_last_window = false,
    },
    keys = {
      { '\\', '<Cmd>Neotree reveal source=last<CR>', { desc = 'NeoTree reveal', silent = true } },
      {
        '<leader>e',
        function()
          require('neo-tree.command').execute { toggle = true, dir = vim.uv.cwd() }
        end,
        { desc = 'NeoTree Explorer' },
      },
      {
        '<leader>ge',
        function()
          require('neo-tree.command').execute { source = 'git_status', toggle = true }
        end,
        { desc = 'Git Explorer' },
      },
      {
        '<leader>be',
        function()
          require('neo-tree.command').execute { source = 'buffers', toggle = true }
        end,
        { desc = 'Buffer Explorer' },
      },
    },
  },
}
