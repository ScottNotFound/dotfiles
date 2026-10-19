return {
  {
    'milanglacier/minuet-ai.nvim',
    init = function()
      require('minuet-server').start()
    end,
    opts = {
      provider = 'openai_fim_compatible',
      n_completions = 3,
      context_window = require('minuet-server').context / 4,

      provider_options = {
        openai_fim_compatible = {
          name = 'llama.cpp',
          api_key = 'TERM',
          end_point = 'http://127.0.0.1:14193/v1/completions',
          model = 'ANY', -- doesn't need to be set
          optional = {
            max_tokens = 56,
            top_p = 0.9,
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
        enable_auto_complete = true,
      },
      virtualtext = {
        keymap = {
          accept = '<Tab>',
          next = '<C-S-n>',
          prev = '<C-S-p>',
          dismiss = '<C-e>',
        },
        show_on_completion_menu = true,
      },
      after_cursor_filter_length = 15,
    },
  },
}
