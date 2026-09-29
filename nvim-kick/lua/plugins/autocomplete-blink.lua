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
        preset = 'default',
      },
    },
    appearance = {
      nerd_font_variant = 'mono',
    },
    completion = {
      documentation = { auto_show = false, auto_show_delay_ms = 500 },
    },
    sources = {
      default = { 'lsp', 'path', 'snippits' },
    },
    snippets = {
      preset = 'luasnip',
    },
    fuzzy = { implementation = 'lua' },
    signature = { enabled = true },
  },
}
