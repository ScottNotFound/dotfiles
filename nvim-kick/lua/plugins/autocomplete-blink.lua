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
    },
    opts = {
      keymap = {
        preset = 'none',
        ['<C-space>'] = { 'show', 'show_documentation', 'hide_documentation' },
        ['<C-e>'] = { 'hide' },

        ['<Tab>'] = { 'select_and_accept', 'fallback' },
        ['<S-Tab>'] = { 'fallback' },

        ['<CR>'] = { 'fallback' },

        ['<C-n>'] = { 'select_next', 'fallback' },
        ['<C-p>'] = { 'select_prev', 'fallback' },
        ['<C-Down>'] = { 'select_next', 'fallback' },
        ['<C-Up>'] = { 'select_prev', 'fallback' },
      },
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
      default = { 'lsp', 'path', 'snippits' },
      providers = { lsp = { async = true } },
    },
    snippets = {
      preset = 'luasnip',
    },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
