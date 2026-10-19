return {
  {
    'milanglacier/minuet-ai.nvim',
    dependencies = { 'nvim-lua/plenary.nvim' },
    enabled = false,
    init = function()
      local minuet_vt = require 'minuet.virtualtext'
      local neotab = require 'neotab'

      vim.keymap.set('i', '<Tab>', function()
        if minuet_vt.is_visible then
          minuet_vt.accept()
        else
          local stepped_out = neotab.tabout()
          if not stepped_out then
            vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes('<Tab>', true, true, true), 'n', true)
          end
        end
      end, { silent = true, desc = 'Master Tab Pipeline: Minuet -> Neotab -> Indent' })

      require('minuet-server').start()
    end,
    opts = {
      provider = 'openai_fim_compatible',
      n_completions = 1,
      context_window = require('minuet-server').context / 2,

      debounce_delay = 1.0,
      throttle_delay = 2.0,

      provider_options = {
        openai_fim_compatible = {
          name = 'llama.cpp',
          api_key = 'TERM',
          end_point = 'http://127.0.0.1:14193/v1/completions',
          model = 'ANY', -- doesn't need to be set
          optional = {
            max_tokens = 64,
            top_p = 0.96,
            stop = { '\n\n' },
          },
          template = {
            prompt = function(before, after, _)
              return '<|fim_prefix|>' .. before .. '<|fim_suffix|>' .. after .. '<|fim_middle|>'
            end,
            suffix = false,
          },
        },
      },
      blink = {
        enable_auto_complete = false,
      },
      virtualtext = {
        auto_trigger_ft = {},
        keymap = {
          accept = '<A-Tab>',
          accept_line = '<Tab>',
          next = '<A-]>',
          prev = '<A-[>',
          dismiss = '<A-e>',
        },
        show_on_completion_menu = true,
      },
      after_cursor_filter_length = 0,
    },
    enable_predicates = {
      function()
        return require('minuet-server').active
      end,
      function()
        local line = vim.api.nvim_get_current_line()
        local cursor = vim.api.nvim_win_get_cursor(0)
        -- local row = cursor[1]
        local col = cursor[2]
        -- local prev_char = line:sub(col - 1, col - 1)
        local next_char = line:sub(col + 1, col + 1)

        if line:match('^%s*$') then
          return false
        end

        local text_before_cursor = line:sub(1, col)
        if text_before_cursor:match('^%s*$') then
          return false
        end

        if text_before_cursor:match("[%s%(%[{,=+%-/*]$") then
          return false
        end

        local blocked_chars = { [')'] = true, [']'] = true, ['}'] = true, [';'] = true, ['"'] = true, ["'"] = true }

        if blocked_chars[next_char] then
          return false
        end
        return true
      end,
    },
  },
}
