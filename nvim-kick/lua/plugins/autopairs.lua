-- autopairs
-- https://github.com/windwp/nvim-autopairs

vim.pack.add { 
  gh 'windwp/nvim-autopairs',
  gh 'hrsh7th/nvim-cmp',
}

require('nvim-autopairs').setup {}

event = 'InsertEnter'
local cmp_autopairs = require 'nvim-autopairs.completion.cmp'
local cmp = require 'cmp'
cmp.event:on('confirm_done', cmp_autopairs.on_confirm_done())

