local llama = require 'minuet-server'

return {
  {
    'huggingface/llm.nvim',
    enabled = false,
    init = function()
      llama.start()
    end,
    opts = {
      backend = 'openai',
      url = llama.openai_url .. '/completions',
      model = llama.models[llama.model_index],

      debounce_ms = 500,
      accept_keymap = '<A-A>',

      fim = {
        enabled = true,
        prefix = '<|fim_prefix|>',
        middle = '<|fim_suffix|>',
        suffix = '<|fim_middle|>',
      },
      context_window = llama.context / 2,
    },
  },
}
