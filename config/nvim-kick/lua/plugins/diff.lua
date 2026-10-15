-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'sindrets/diffview.nvim',
  config = function()
    require('diffview').setup {
      view = {
        merge_tool = {
          layout = 'diff3_mixed',
        },
      },
    }
  end,
}
