local llama = require 'llama-cpp-server'

return {
  {
    'ggml-org/llama.vim',
    enabled = false,
    init = function()
      llama.start()

      vim.g.llama_config = {
        endpoint_fim = llama.base_url .. '/infill',
        endpoint_inst = llama.base_url .. '/v1/chat/completions',
        show_info = 1,
        info_compact = 4,
        fim_debounce_ms = 1800,
        max_line_suffix = 10,
        enable_at_startup = false,
        auto_fim = false,

        keymap_fim_trigger = '<leader>llf',
        keymap_fim_accept_full = '<Tab>',
        keymap_fim_accept_line = '<S-Tab>',
        keymap_fim_accept_word = '<A-]>',

        keymap_inst_trigger = '<leader>lli',
        keymap_inst_rerun = '<leader>llr',
        keymap_inst_continue = '<leader>llc',
        keymap_inst_accept = '<Tab>',
        keymap_inst_cancel = '<Esc>',
      }
    end,
    dependencies = {
      'folke/which-key.nvim',
    },
    config = function()

      vim.keymap.set('n', '<leader>taf', '<cmd>silent LlamaToggleAutoFim<cr>', { noremap = true, silent = true, desc = '[T]oggle LLM [A]uto-[F]IM' })

      vim.api.nvim_set_hl(0, 'llama_hl_fim_hint', { fg = '#808080', italic = true,})
      vim.api.nvim_set_hl(0, 'llama_hl_fim_info', { link = 'DiagnosticHint'})

      vim.api.nvim_set_hl(0, 'llama_hl_inst_src', { fg = '#808080', italic = true,})
      vim.api.nvim_set_hl(0, 'llama_hl_inst_info', { link = 'DiagnosticHint'})

      local status_ok, wk = pcall(require, 'which-key')
      if status_ok then
        wk.add {
          { vim.g.llama_config.keymap_fim_trigger, desc = '[LL]M: Trigger [F]IM completion' },
          { vim.g.llama_config.keymap_inst_trigger, desc = '[LL]M: Trigger [I]nstructtion' },
          { vim.g.llama_config.keymap_inst_rerun, desc = '[LL]M [R]erun Instructtion' },
          { vim.g.llama_config.keymap_inst_continue, desc = '[LL]M [C]ontinue Instructtion' },
        }
      end
    end,
  },
}
