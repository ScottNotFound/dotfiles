
local kind_icons = {
    -- LLM Provider icons
    claude = '',
    openai = '',
    gemini = '󰪁',
    ['llama.cpp'] = '',
}

return {
  {
    'saghen/blink.cmp',
    event = 'InsertEnter',
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

        -- ['<CR>'] = { 'select_and_accept', 'fallback' },

        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-Down>'] = { 'fallback' },
        ['<C-Up>'] = { 'fallback' },
        ['<Down>'] = { 'select_next', 'fallback' },
        ['<Up>'] = { 'select_prev', 'fallback' },
        ['<Left>'] = { 'select_prev', 'fallback' },
        ['<Right>'] = { 'select_next', 'fallback' },

        -- ['<C-/>'] = {
        --   function(cmp)
        --     cmp.show { providers = { 'minuet' } }
        --   end,
        -- },
      },
      appearance = {
        use_nvim_cmp_as_default = true,
        nerd_font_variant = 'mono',
        kind_icons = kind_icons,
      },
      completion = {
        accept = {
          auto_brackets = { enabled = true },
        },
        keyword = {
          range = 'full',
        },
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
          prefetch_on_insert = true,
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
        default = { 'lsp', 'path', 'snippets', },
        providers = {
          lsp = { async = true, timeout_ms = 1000 },
          -- minuet = {
          --   name = 'minuet',
          --   module = 'minuet.blink',
          --   async = true,
          --   timeout_ms = 2000,
          --   score_offset = 50,
          -- },
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
