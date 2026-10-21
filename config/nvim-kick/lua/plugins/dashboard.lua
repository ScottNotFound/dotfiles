return {
  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function()
      local alpha = require 'alpha'
      local dashboard = require 'alpha.themes.dashboard'

      -- Custom helper to build clean, consistent layout buttons
      local function button(sc, txt, keybind)
        local b = dashboard.button(sc, txt, keybind)
        -- Give the text padding so it stretches out visually
        b.opts.hl = 'Function'
        b.opts.hl_short = 'Control'
        return b
      end

      -- The interactive element console
      dashboard.section.buttons.val = {
        button('w', '     Workspace Projects (neovim-project)        ', '<cmd>Telescope neovim-project history<cr>'),
        button('p', '     Persisted Projects (persisted)             ', '<cmd>Telescope persisted<cr>'),
        button('f', '     Find Files                                 ', '<cmd>Telescope find_files<cr>'),
        button('r', '     Recent Buffers                             ', '<cmd>Telescope oldfiles<cr>'),
        button('t', '     Telescope Built-Ins                        ', '<cmnd>Telescope builtin<cr>'),
        button('g', '     Neogit                                     ', '<cmd>Neogit<cr>'),
        button('q', '     Quit                                       ', '<cmd>qa<cr>'),
      }

      -- Set visual decorations and alignment parameters
      dashboard.section.header.opts.hl = 'Type'
      dashboard.section.buttons.opts.hl = 'Keyword'

      -- Force structural vertical layout adjustments
      dashboard.opts.layout = {
        { type = 'padding', val = 4 }, -- Pushes header down from top line boundary
        dashboard.section.header,
        { type = 'padding', val = 3 }, -- Spaces out title header block from operations console
        dashboard.section.buttons,
        { type = 'padding', val = 2 },
        dashboard.section.footer,
      }

      alpha.setup(dashboard.opts)

      -- UX Fix: Ensure options like line numbers, signcolumns, and statuslines
      -- are stripped off entirely so the screen elements render completely flush.
      vim.api.nvim_create_autocmd('User', {
        pattern = 'AlphaReady',
        callback = function()
          vim.opt_local.number = false
          vim.opt_local.relativenumber = false
          vim.opt_local.laststatus = 0 -- Hides statusline completely for true full screen
          vim.opt_local.signcolumn = 'no'
        end,
      })

      -- Automatically restore statuslines when shifting out of Dashboard space
      vim.api.nvim_create_autocmd('BufUnload', {
        buffer = 0,
        callback = function()
          vim.opt.laststatus = 3 -- Restores globally shared layout status block
        end,
      })
    end,
  },
}
