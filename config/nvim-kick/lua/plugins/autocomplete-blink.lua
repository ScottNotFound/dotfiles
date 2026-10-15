return {
  {
    'saghen/blink.cmp',
    event = 'VimEnter',
    version = '1.*',
    dependencies = {
      {
        'L3MON4D3/LuaSnip',
        version = '2.*',
        build = (function()
          if vim.fn.has 'win32' == 1 or vim.fn.executable 'make' == 0 then
            return
          end
          return 'make install_jsregexp'
        end)(),
        dependencies = {

          -- `friendly-snippets` contains a variety of premade snippets.
          --    See the README about individual language/framework/plugin snippets:
          --    https://github.com/rafamadriz/friendly-snippets
          --
          -- vim.pack.add { gh 'rafamadriz/friendly-snippets' }
          -- require('luasnip.loaders.from_vscode').lazy_load()
        },
        opts = {},
      },
      {
        'milanglacier/minuet-ai.nvim',
        init = function()
          require('minuet-server').start()
        end,
        opts = {
          provider = 'openai_fim_compatible',
          n_completions = 3,
          context_window = 16000,

          provider_options = {
            openai_fim_compatible = {
              name = 'llama.cpp',
              api_key = 'TERM',
              end_point = 'http://127.0.0.1:8081/v1/completions',
              model = 'ANY', -- doesn't need to be set
              optional = {
                max_tokens = 56,
                top_p = 0.9,
              },
              template = {
                prompt = function(before, after, _)
                  -- local function find_symbol(symbols, line)
                  --   for _, symbol in ipairs(symbols or {}) do
                  --     local start = symbol.range.start.line
                  --     local finish = symbol.range['end'].line
                  --     if line >= start and line <= finish then
                  --       local child = find_symbol(symbol.children, line)
                  --       return child or symbol
                  --     end
                  --   end
                  -- end
                  -- local function get_(bufnr, callback)
                  --   local clients = vim.lsp.get_clients {
                  --     bufnr = bufnr,
                  --     method = 'textDocument/documentSymbol',
                  --   }
                  --   if #clients == 0 then
                  --     callback ''
                  --     return
                  --   end
                  --   clients[1]:request('textDocument/documentSymbol', {
                  --     textDocument = {
                  --       uri = vim.uri_from_buffer(bufnr),
                  --     },
                  --   }, function(err, symbols)
                  --     if err or not symbols then
                  --       callback ''
                  --       return
                  --     end
                  --     local line = vim.api.nvim_win_get_cursor(0)[1] - 1
                  --     local symbol = find_symbol(symbols, line)
                  --     if symbol then
                  --       callback(symbol.name)
                  --     else
                  --       callback ''
                  --     end
                  --   end, bufnr)
                  -- end
                  local function get_lsp_context(bufnr)
                    local responses = vim.lsp.buf_request_sync(bufnr, 'textDocument/documentSymbol', {
                      textDocument = {
                        uri = vim.uri_from_bufnr(bufnr),
                      },
                    }, 1000)

                    if not responses then
                      return ''
                    end

                    for _, response in pairs(responses) do
                      local symbols = response.result
                      if symbols then
                        local line = vim.api.nvim_win_get_cursor(0)[1] - 1

                        local function find_symbol(items)
                          for _, symbol in ipairs(items or {}) do
                            if line >= symbol.range.start.line and line <= symbol.range['end'].line then
                              return find_symbol(symbol.children) or symbol
                            end
                          end
                        end

                        local symbol = find_symbol(symbols)

                        if symbol then
                          return symbol.name
                        end
                      end
                    end

                    return ''
                  end
                  local lsp_context = get_lsp_context(0)

                  return '<lsp_context>\n'
                    .. lsp_context
                    .. '\n</lsp_context>\n'
                    .. '<|fim_prefix|>'
                    .. before
                    .. '<|fim_suffix|>'
                    .. after
                    .. '<|fim_middle|>'
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
    },
    opts = {
      keymap = {
        preset = 'none',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },
        ['<Esc>'] = { 'hide', 'fallback' },

        ['<Tab>'] = { 'select_and_accept', 'fallback' },

        ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-Down>'] = { 'fallback' },
        ['<C-Up>'] = { 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },

        ['<C-/>'] = {
          function(cmp)
            cmp.show { providers = { 'minuet' } }
          end,
        },
      },
      delay = {
        completion = 100,
        providers = 50,
      },
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
        trigger = {
          prefetch_on_insert = false,
          show_on_insert_on_trigger_character = true,
          show_on_trigger_character = true,
          show_on_keyword = true,
        },
        list = {
          selection = {
            preselect = true,
            auto_insert = false,
          },
        },
      },
      sources = {
        default = { 'lsp', 'path', 'snippets', 'minuet' },
        providers = {
          lsp = { async = true, timeout_ms = 1000 },
          minuet = {
            name = 'minuet',
            module = 'minuet.blink',
            async = true,
            timeout_ms = 2000,
            score_offset = 50,
          },
        },
      },
      snippets = {
        preset = 'luasnip',
      },
      fuzzy = { implementation = 'prefer_rust_with_warning' },
      signature = { enabled = true },
    },
  },
}
