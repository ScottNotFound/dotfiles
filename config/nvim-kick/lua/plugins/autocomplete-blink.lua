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
      {
        'brenoprata10/nvim-highlight-colors',
        opts = {},
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
      appearance = {
        nerd_font_variant = 'mono',
      },
      completion = {
        documentation = { auto_show = false, auto_show_delay_ms = 500 },
        menu = {
          auto_show = true,
          auto_show_delay_ms = 100,
          draw = {
            components = {
              kind_icon = {
                text = function(ctx)
                  local icon = ctx.kind_icon
                  if ctx.item.source_name == 'LSP' then
                    local color_item =
                      require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr ~= '' then
                      icon = color_item.abbr
                    end
                  end
                  return icon .. ctx.icon_gap
                end,
                highlight = function(ctx)
                  local highlight = 'BlinkCmpKind' .. ctx.kind
                  if ctx.item.source_name == 'LSP' then
                    local color_item =
                      require('nvim-highlight-colors').format(ctx.item.documentation, { kind = ctx.kind })
                    if color_item and color_item.abbr_hl_group then
                      highlight = color_item.abbr_hl_group
                    end
                  end
                  return highlight
                end,
              },
            },
          },
        },
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
