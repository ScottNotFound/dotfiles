return {
  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2',
    dependencies = { 'nvim-lua/plenary.nvim', 'nvim-telescope/telescope.nvim' },
    keys = {
      { '<leader>a', nil, desc = 'Hardpoon [a]dd file' },
    },
    config = function()
      local harpoon = require 'harpoon'
      harpoon:setup()
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end, { desc = 'Harpoon [a]dd file' })
      for i = 1, 9 do
        vim.keymap.set('n', '<leader>j' .. i, function()
          harpoon:list():select(i)
        end, { desc = 'Harpoon jump [' .. i .. ']' })
      end

      local conf = require('telescope.config').values
      local toggle_telescope = function(harpoon_files)
        local file_paths = {}
        for _, item in ipairs(harpoon_files.items) do
          table.insert(file_paths, item.value)
        end

        require('telescope.pickers')
          .new({}, {
            prompt_title = 'Harpoon',
            finder = require('telescope.finders').new_table {
              results = file_paths,
            },
            previewer = conf.file_previewer {},
            sorter = conf.generic_sorter {},
          })
          :find()
      end

      vim.keymap.set('n', '<C-e>', function()
        toggle_telescope(harpoon:list())
      end, { desc = 'Open harpoon in t[e]lescope' })
    end,
  },
}
