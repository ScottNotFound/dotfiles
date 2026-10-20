return {
  {
    'lewis6991/gitsigns.nvim',
    opts = {
      -- signs = {
      --   add = { text = '+' },
      --   change = { text = '~' },
      --   delete = { text = '_' },
      --   topdelete = { text = '‾' },
      --   changedelete = { text = '~' },
      -- },
      on_attach = function(bufnr)
        local gitsigns = require 'gitsigns'

        local function map(mode, l, r, opts)
          opts = opts or {}
          opts.buffer = bufnr
          vim.keymap.set(mode, l, r, opts)
        end

        -- Navigation
        map('n', ']c', function()
          if vim.wo.diff then
            vim.cmd.normal { ']c', bang = true }
          else
            gitsigns.nav_hunk 'next'
          end
        end, { desc = 'Next git [c]hange' })

        map('n', '[c', function()
          if vim.wo.diff then
            vim.cmd.normal { '[c', bang = true }
          else
            gitsigns.nav_hunk 'prev'
          end
        end, { desc = 'Previous git [c]hange' })

        -- Actions
        -- visual mode
        map('v', '<leader>ghs', function()
          gitsigns.stage_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[g]it [h]unk [s]tage' })
        map('v', '<leader>ghr', function()
          gitsigns.reset_hunk { vim.fn.line '.', vim.fn.line 'v' }
        end, { desc = '[g]it [h]unk [r]eset' })
        -- normal mode
        map('n', '<leader>ghs', gitsigns.stage_hunk, { desc = '[g]it [h]unk [s]tage ' })
        map('n', '<leader>ghr', gitsigns.reset_hunk, { desc = '[g]it [h]unk  [r]eset' })
        map('n', '<leader>ghS', gitsigns.stage_buffer, { desc = '[g]it [h]unk [S]tage buffer' })
        map('n', '<leader>ghu', gitsigns.stage_hunk, { desc = '[g]it [h]unk [u]ndo stage hunk' })
        map('n', '<leader>ghR', gitsigns.reset_buffer, { desc = '[g]it [h]unk [R]eset buffer' })
        map('n', '<leader>ghp', gitsigns.preview_hunk, { desc = '[g]it [h]unk [p]review hunk' })
        map('n', '<leader>ghb', gitsigns.blame_line, { desc = '[g]it [h]unk [b]lame line' })
        map('n', '<leader>ghd', gitsigns.diffthis, { desc = '[g]it [h]unk [d]iff against index' })
        map('n', '<leader>ghD', function()
          gitsigns.diffthis '@'
        end, { desc = '[g]it [h]unk [D]iff against last commit' })
        map('n', '<leader>gsb', gitsigns.blame, { desc = '[g]it [s]how [b]lame' })
        -- Toggles
        map('n', '<leader>tlb', gitsigns.toggle_current_line_blame, { desc = '[T]oggle [l]ine [b]lame line' })
        map('n', '<leader>tgD', gitsigns.preview_hunk_inline, { desc = '[T]oggle [g]it show [D]eleted' })
      end,
    },
  },
}
