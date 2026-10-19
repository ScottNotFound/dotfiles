local llama = require 'minuet-server'

return {
  {
    'meeehdi-dev/bropilot.nvim',
    dependencies = {
      'nvim-lua/plenary.nvim',
      'j-hui/fidget.nvim',
    },
    enabled = false,
    init = function()
      llama.start()
    end,
    opts = {
      auto_suggest = true,
      model = 'ggml-org/Qwen2.5-Coder-3B-Q8_0-GGUF',
      debounce = 600,
      provider = 'openai',
      openai_url = llama.openai_url,
      model_params = {
        temperature = 0.2,
        top_p = 0.95,
        stop = { '<|fim_pad|>', '<|endoftext|>', '\n\n' },
      },
      keymap = {
        accept_block = '<A-A>',
        accept_line = '<A-l>',
        accept_word = '<A-w>',
        suggest = '<A-s>',
      },
    },
  },
}
