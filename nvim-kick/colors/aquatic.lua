-- ~/.config/nvim/colors/aquatic.lua
--
-- Aquatic
-- Port of the VS Code "aquatic" theme
--
-- Designed for:
--   * Tree-sitter highlighting
--   * LSP semantic tokens
--   * Modern Neovim highlight groups
--
-- Load with:
--   :colorscheme aquatic

-- local theme_file = vim.fn.expand("~/.config/nvim-kick/colors/aquatic.lua")
-- local last_mtime = vim.uv.fs_stat(theme_file).mtime.sec
--
-- vim.fn.timer_start(300, function()
--   local stat = vim.uv.fs_stat(theme_file)
--   if stat and stat.mtime.sec ~= last_mtime then
--     last_mtime = stat.mtime.sec
--     vim.cmd("silent! luafile " .. vim.fn.fnameescape(theme_file))
--   end
-- end, { ["repeat"] = -1 })

vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.g.colors_name = 'aquatic'

local white = '#ffffff'
local black = '#000000'

local grey_shades = {
  '#f2f2f2',
  '#d6d6d6',
  '#b3b3b3',
  '#8c8c8c',
  '#666666',
  '#4d4d4d',
  '#333333',
}
local grey_shades2 = {
  '#e0e0e0',
  '#c1c1c1',
  '#a3a3a3',
  '#7b7b7b',
  '#5c5c5c',
  '#4a4a4a',
  '#3b3b3b',
  '#2c2c2c',
  '#1e1e1e',
  '#121212',
}
local gentle_fog = {
  '#f9f9f9',
  '#e0e0e0',
  '#d1d1d1',
  '#c3c3c3',
  '#b7b7b7',
  '#a0a0a0',
  '#8b8b8b',
  '#757575',
}
local dusk_shades = {
  '#f3f4f5',
  '#e4e6e9',
  '#c4c9cf',
  '#a4aab3',
  '#7c7f8b',
  '#4c4e5d',
  '#3a3c47',
  '#262933',
  '#1e1f26',
  '#111213',
}
local shadow_elegance = {
  '#b0b3b7',
  '#7d8287',
  '#4b5057',
  '#2f353e',
  '#1d2125',
  '#14181b',
  '#0d1013',
  '#0a0c0f',
}
local blue_pastels = {
  '#134074',
  '#13315c',
  '#0b2545',
  '#8da9c4',
  '#eef4ed',
}
local purple_plurality = {
  '#10002b',
  '#240046',
  '#3c096c',
  '#5a189a',
  '#7b2cbf',
  '#9d4edd',
  '#c77dff',
  '#e0aaff',
}
local green_fields = {
  '#a5e6a0',
  '#82d66e',
  '#4cbf4a',
  '#3a9933',
  '#2a7421',
  '#1b4f16',
}
local elysian_nocturn = {
  '#e1e1e1',
  '#a8a8c7',
  '#6f6f93',
  '#4c4c7d',
  '#322f5d',
  '#1a1c3f',
  '#0b0e2e',
}
local sandy_shores = {
  '#f8e1b0',
  '#f3d09b',
  '#efc684',
  '#e7b661',
  '#d5a052',
  '#c59a43',
  '#b58e37',
  '#a07f2b',
  '#8a6f1e',
  '#6f5c14',
}
local deep_reds = {
  '#ff9999',
  '#ff6666',
  '#ff3333',
  '#ff0000',
  '#cc0000',
  '#990000',
  '#660000',
  '#330000',
  '#1a0000',
  '#000000',
}
local blossom_bloom = {
  '#f5c8d5',
  '#f1a7b6',
  '#ee8a9b',
  '#ed6f83',
  '#dc4e6e',
  '#c1355a',
  '#a0284e',
  '#871c43',
  '#6e1238',
}
local autumn_orange = {
  '#f6e0b5',
  '#f2b661',
  '#d89f4d',
  '#c37329',
  '#a84e24',
  '#8c3c1f',
  '#5b2e1a',
  '#3d1a12',
}
local soft_pastels = {
  '#eddcd2',
  '#fff1e6',
  '#fde2e4',
  '#fad2e1',
  '#c5dedd',
  '#dbe7e4',
  '#f0efeb',
  '#d6e2e9',
  '#bcd4e6',
  '#99c1de',
}
local soft_sands = {
  '#edede9',
  '#d6ccc2',
  '#f5ebe0',
  '#e3d5ca',
  '#d5bdaf',
}
local ether_eve = {
  '#e1a2d1',
  '#a57bb7',
  '#685d9b',
  '#4f4f8f',
  '#2e2a56',
}
local pastel_dreams = {
  '#f6d1e1',
  '#f1b3d7',
  '#e5a5e2',
  '#d09ee8',
  '#a78bd2',
  '#8c7ac5',
  '#5b5cbe',
  '#4b7cda',
  '#2b5b89',
}
local wisteria_twilight = {
  '#3e2e54',
  '#403865',
  '#424276',
  '#525286',
  '#7575a7',
  '#a8a7d7',
  '#748fd9',
  '#8798d9',
  '#99a0d8',
  '#a7a7d8',
  '#c6b5d6',
}
local vintage_lavendar = {
  '#3e2e54',
  '#4f3f65',
  '#605075',
  '#716185',
  '#827295',
  '#a494b6',
  '#c6b5d6',
  '#b7aed7',
  '#afabd8',
  '#a7a7d8',
}
local midnight_whisp = {
  '#c6b5d6',
  '#9f7fb8',
  '#7e5b99',
  '#5c3d7a',
  '#3e2e54',
}
local purple_hex = {
  '#e8d3f2',
  '#d1b5e0',
  '#b58bcf',
  '#9e69b9',
  '#7d4a8c',
  '#5d2c5e',
  '#3e0e49',
  '#2c0b3c',
  '#1e0a30',
  '#0f0a24',
}
local electric_blues = {
  '#a7d3e0',
  '#6ec6e9',
  '#4ab1df',
  '#3b9cd7',
  '#2a7dc4',
  '#1b5ea5',
  '#164f86',
  '#0f3b6c',
}
local royal_blues = {
  '#b3cde0',
  '#6a9bdc',
  '#4682b4',
  '#3a6ea5',
  '#2c4f78',
  '#1e3a65',
}
local ocean_depths = {
  '#a3c1e0',
  '#7db4e4',
  '#5aa4e0',
  '#3395d7',
  '#007bb8',
  '#005f8d',
  '#00496b',
  '#003344',
  '#002c3e',
  '#001e30',
}
local midnight_tide = {
  '#a4c8e1',
  '#6fa3c1',
  '#4184b9',
  '#2c6e99',
  '#1d4e78',
  '#1a3d5b',
  '#0f2d4b',
  '#0a1c30',
}
local sea_shades = {
  '#aeeeee',
  '#80d1e5',
  '#4db8d4',
  '#26a9c1',
  '#1e8ca0',
  '#1a707b',
  '#006d63',
  '#005b52',
  '#00454a',
  '#003c3f',
}
local ocean_serenity = {
  '#03045e',
  '#023e8a',
  '#0077b6',
  '#0096c7',
  '#00b4d8',
  '#48cae4',
  '#90e0ef',
  '#ade8f4',
  '#caf0f8',
}
local tropical_serenity = {
  '#b3e1dc',
  '#86d3c5',
  '#5cc7b4',
  '#3ab09f',
  '#27a58d',
  '#199b79',
  '#0f8e6f',
  '#0a7c62',
  '#056e56',
}
local abyssal_turquoise = {
  '#a0d6d6',
  '#75b3b3',
  '#4f8f9d',
  '#2b6b7f',
  '#1f4e64',
  '#1a3e50',
  '#16444a',
  '#0f2b2e',
  '#0a1b1e',
  '#001f28',
}
local teal_serenade = {
  '#a7e1e9',
  '#66b2b0',
  '#3c8f8f',
  '#2a7f7a',
  '#1f6868',
  '#18655d',
  '#165a53',
  '#144f49',
  '#0e3f3f',
}
local seaweed = {
  '#58a98c',
  '#46987b',
  '#34907c',
  '#368b71',
  '#39896b',
  '#36785f',
  '#336b55',
  '#2c5e4b',
  '#274f3f',
  '#1f4b3e',
  '#16443a',
  '#0e4039',
  '#083d3a',
  '#063d3d',
  '#043c3e',
  '#023a3c',
}
local seaflora = {
  '#2f621c',
  '#295c14',
  '#22550b',
  '#1d5004',
  '#184900',
  '#154300',
  '#113a00',
  '#003b17',
  '#00461d',
  '#005123',
  '#005e29',
  '#156933',
  '#23743d',
  '#298045',
  '#32853f',
  '#438535',
  '#268821',
  '#137b0f',
  '#017000',
  '#016600',
  '#015e00',
  '#005000',
  '#004200',
}
local seagrass = {
  '#7cc08f',
  '#74b887',
  '#6bb17f',
  '#56a970',
  '#45a064',
  '#359659',
  '#1f8549',
  '#006f37',
}
local seafoam = {
  '#0099da',
  '#26a7e9',
  '#3eb8fb',
  '#68c6ff',
  '#87d0ff',
  '#70d5ff',
  '#50daff',
  '#19defe',
  '#00e0f6',
  '#00e2ea',
  '#00e3de',
  '#22e4d0',
  '#0adbc3',
  '#00cbb5',
  '#00bda9',
  '#00ac99',
  '#009f8e',
  '#009e9a',
  '#009ca5',
  '#009aaf',
  '#0099b9',
  '#0097c0',
  '#0095cc',
  '#17adea',
  '#00c1f0',
  '#00d4f4',
  '#25ebfe',
  '#57eeff',
}
local dreamrise = {
  '#7697d5',
  '#8094d5',
  '#8a90d4',
  '#988cd0',
  '#9d8ace',
  '#a388cb',
}
local urchin = {
  '#afa3e9',
  '#988cd0',
  '#7669ad',
  '#5e5091',
  '#4d407c',
  '#40346a',
}
local mesopelagic = {
  '#2e9eec',
  '#068bd8',
  '#0080c8',
  '#0077bb',
  '#006caa',
  '#006098',
  '#005181',
}
local cuttlefish = {
  '#0099da',
  '#068bd8',
  '#0075c3',
  '#0868bb',
  '#145db2',
  '#124fa5',
  '#074da1',
}
local armada = {
  '#2173c9',
  '#0160b5',
  '#0055a1',
  '#004b8f',
  '#00407c',
  '#003366',
  '#002d5b',
  '#00244b',
  '#001b3b',
}
local exotic = {
  '#901144',
  '#94160d',
  '#7a3c00',
  '#654b00',
  '#465800',
  '#006126',
  '#005c5b',
  '#00528b',
  '#2445a6',
  '#463ba3',
  '#57359d',
  '#613097',
  '#702989',
  '#7f1f74',
  '#8b1658',
}
local tamed = {
  '#743e36',
  '#5a4e33',
  '#315756',
  '#474687',
  '#59417b',
  '#703767',
}
local starfish = {
  '#8a4580',
  '#8d5989',
  '#94558d',
  '#996295',
  '#ae75a9',
  '#c584c0',
  '#dca0d7',
  '#72518d',
}
local sponge = {
  '#bbb529',
  '#c1b107',
  '#7c6a00',
}
local spectral = {
  '#442824',
  '#3f2c18',
  '#393016',
  '#303319',
  '#253622',
  '#19372d',
  '#12373b',
  '#1b3444',
  '#263046',
  '#2c2e46',
  '#352b42',
  '#3a293d',
  '#412834',
  '#432829',
}

local c = {
  bg = '#222222',
  fg = '#a9b7c6',

  variable = '#a9b7c6',
  comment = '#808080',
  docstring = '#6793cc',

  keyword = cuttlefish[2],
  keyword_special = cuttlefish[3],
  bracket_special = cuttlefish[1],

  bool = cuttlefish[4],
  number = ocean_depths[2],
  string = seagrass[4],

  operator = exotic[13],
  punctuation = seafoam[8],
  type_alias = urchin[2],
  type_parameter = tamed[3],
  type_interface = dreamrise[1],
  type_definition = urchin[2],
  type_entity = urchin[3],
  type_abstract = dreamrise[2],
  type_inherited = dreamrise[1],
  type_builtin = urchin[1],
  type_construct = urchin[4],

  function_def = seaweed[2],
  function_call = seaweed[6],
  -- function_call = ocean_depths[2],
  function_generic = seaweed[4],
  function_builtin = seaweed[1],

  property = starfish[6],
  constant_caps = starfish[1],

  decoration = sponge[1],
  directive = sponge[2],
  macro = sponge[3],

  self = starfish[3],

  namespace = urchin[5],

  string_special = '#cc7832',
  string_format = '#cc7832',
  string_escape = '#cc7832',

  exception = '#8e343d',
  error = '#8e343d',

  diag_error = '#8e343d',
  diag_warn = sponge[3],

  keyword_arg = starfish[8],

  regex = '#388f40',
  regex_escape = '#f39418',
  regex_escape_special = '#e7f06f',
  regex_set = '#f6cb3f',
  regex_operator = '#1b71fa',
  regex_quantifier = '#4f92ff',
  regex_named_tag = '#9de5c1',
  regex_named_group = '#97fd44',
  regex_redundant = '#8f8596',

  attribute_cpp = '#434e9e',
  -- Bracket colors
  bracket1 = cuttlefish[1],
  bracket2 = cuttlefish[2],
  bracket3 = cuttlefish[3],
  bracket4 = cuttlefish[4],
  bracket5 = cuttlefish[5],
  bracket6 = cuttlefish[6],
  -- bracket1 = '#0072ff',
  -- bracket2 = '#0081dc',
  -- bracket3 = '#1aabd8',
  -- bracket4 = '#22c4c8',
  -- bracket5 = '#29b295',
  -- bracket6 = '#179387',
  bracket_bad = '#ca272d',

  sidebar_title = '#bbbbbb',
  badge = '#007acc',
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function fg(group, color)
  vim.api.nvim_set_hl(0, group, { fg = color })
end

local function bf(group, color)
  vim.api.nvim_set_hl(0, group, { fg = color, bold = true })
end

local function it(group, color)
  vim.api.nvim_set_hl(0, group, { fg = color, italic = true })
end

local function fgm(groups, color)
  for _, group in ipairs(groups) do
    fg(group, color)
  end
end

-- ============================================================================
-- Traditional Vim syntax groups
--
-- These provide fallback support for syntax highlighting and plugins that
-- still use the traditional highlight groups.
-- ============================================================================

fg('Comment', c.comment)
fg('String', c.string)
fg('Character', c.string)
fg('Number', c.number)
fg('Boolean', c.bool)
fg('Constant', c.constant_caps)
fg('Identifier', c.variable)
fg('Variable', c.variable)
fg('Function', c.function_call)
fg('Statement', c.keyword)
fg('Conditional', c.keyword)
fg('Repeat', c.keyword)
fg('Label', c.keyword)
fg('Operator', c.operator)
fg('Keyword', c.keyword)
fg('Exception', c.exception)
fg('PreProc', c.macro)
fg('Include', c.directive)
fg('Define', c.macro)
fg('Macro', c.macro)
fg('Type', c.type_entity)
fg('StorageClass', c.type_entity)
fg('Structure', c.type_entity)
fg('Special', c.keyword_special)
fg('Delimiter', c.punctuation)

hi('Underlined', {
  underline = true,
})

fg('Error', c.bracket_bad)

hi('Todo', {
  fg = ocean_depths[3],
  bold = true,
})

fg('DiagnosticError', c.diag_error)
fg('DiagnosticWarn', c.diag_warn)
fg('DiagnosticInfo', ocean_depths[3])
fg('DiagnosticHint', soft_pastels[7])

hi('DiagnosticUnderlineError', {
  undercurl = true,
  sp = c.diag_error,
})

hi('DiagnosticUnderlineWarn', {
  undercurl = true,
  sp = c.diag_warn,
})

hi('DiagnosticUnderlineInfo', {
  undercurl = true,
  sp = ocean_depths[3],
})

hi('DiagnosticUnderlineHint', {
  undercurl = true,
  sp = soft_pastels[7],
})

fg('@variable', c.variable)
-- fg('@variable.parameter', c.variable)
-- fg('@variable.parameter.builtin', c.self)
fg('@variable.member', c.property)

fg('@comment', c.comment)
fg('@comment.documentation', c.docstring)

fg('@string', c.string)
fg('@string.documentation', c.docstring)
fg('@string.escape', c.escape)
fg('@string.special', c.format)
fg('@string.regexp', c.regex)

fg('@boolean', c.bool)

fg('@number', c.number)
-- fg('@number.float', c.number)

fg('@keyword', c.keyword)

fgm({
  '@keyword',
  -- '@keyword.type',
  -- '@keyword.operator',
  -- '@keyword.return',
  -- '@keyword.repeat',
  -- '@keyword.conditional',
  -- '@keyword.modifier',
  -- '@keyword.exception',
  -- '@keyword.import',
  -- '@keyword.function',
  -- '@keyword.storage',
}, c.keyword)

it('@keyword.function', c.keyword)

fg('@constant.builtin.cpp', c.keyword_special)
fg('@type.builtin.cpp', c.keyword_special)

bf('@keyword.directive', c.directive)
fg('@keyword.import.c', c.directive)
fg('@keyword.import.cpp', c.directive)

fg('@property', c.property)

fgm({
  '@function.call',
  '@function.method.call',
  '@lsp.type.function',
  '@lsp.type.method',
}, c.function_call)

fgm({
  '@lsp.typemod.method.definition',
  '@lsp.typemod.method.declaration',
  '@lsp.typemod.function.definition',
  '@lsp.typemod.function.declaration',
}, c.function_def)

fgm({
  '@macro',
  '@function.macro',
  '@constant.macro',
  '@lsp.type.macro',
  '@lsp.typemod.macro',
}, c.macro)

fg('@type', c.type_entity)
fg('@type.builtin', c.type_builtin)
fg('@type.definition', c.type_def)
fg('@type.parameter', c.type_parameter)
fg('@lsp.type.type', c.type_alias)
fg('@lsp.type.class', c.type_entity)
fg('@lsp.type.typeParameter', c.type_parameter)
fg('@lsp.typemod.class.definition', c.type_definition)
fg('@lsp.typemod.class.declaration', c.type_definition)
fg('@lsp.typemod.class.constructorOrDestructor', c.type_construct)

fg('@constructor', c.type_construct)

fg('@operator', c.operator)
fg('@keyword.operator', c.operator)

fg('@punctuation.delimiter', c.punctuation)
fg('@punctuation.bracket', c.bracket_special)
fg('@punctuation.special', c.punctuation)

fg('@label', c.variable)

-- fg('@attribute', c.attribute_cpp)
fg('@attribute.cpp', c.attribute_cpp)

fg('@module', c.namespace)
fg('@namespace', c.namespace)

-- fg('@tag', c.type)
-- fg('@tag.builtin', c.type)
-- fg('@tag.attribute', c.property)
-- fg('@tag.delimiter', c.punctuation)

fg('@variable.builtin.python', c.self)

fg('@string.regexp', c.regex)
fg('@punctuation.bracket.regexp', c.regex_set)
fg('@punctuation.delimiter.regexp', c.regex_set)
fg('@operator.regexp', c.regex_operator)

bf('@string.escape.regexp', c.regex_escape)

bf('@string.special.regexp', c.regex_escape_special)

-- ============================================================================
-- Diff
-- ============================================================================

hi('DiffAdd', {
  fg = c.docstring,
  bg = '#263226',
})

hi('DiffChange', {
  fg = c.bracket3,
  bg = '#262d32',
})

hi('DiffDelete', {
  fg = c.bracket_bad,
  bg = '#322626',
})

hi('DiffText', {
  fg = c.bracket3,
  bg = '#303840',
})

-- ============================================================================
-- Git signs
-- ============================================================================

fg('GitSignsAdd', c.docstring)

fg('GitSignsChange', c.bracket3)

fg('GitSignsDelete', c.bracket_bad)

-- ============================================================================
-- Editor / UI
-- ============================================================================

hi('Normal', {
  fg = c.fg,
  bg = c.bg,
})

hi('NormalFloat', {
  fg = c.fg,
  bg = c.bg,
})

hi('FloatBorder', {
  fg = c.sidebar_title,
  bg = c.bg,
})

hi('Cursor', {
  reverse = true,
})

hi('CursorLine', {
  bg = '#282828',
})

hi('CursorColumn', {
  bg = '#282828',
})

hi('ColorColumn', {
  bg = '#2a2a2a',
})

hi('LineNr', {
  fg = '#555555',
})

hi('CursorLineNr', {
  fg = c.fg,
})

hi('SignColumn', {
  fg = c.fg,
  bg = c.bg,
})

hi('VertSplit', {
  fg = '#444444',
})

hi('WinSeparator', {
  fg = '#444444',
})

hi('StatusLine', {
  fg = c.fg,
  bg = '#292929',
})

hi('StatusLineNC', {
  fg = '#666666',
  bg = '#292929',
})

hi('TabLine', {
  fg = '#777777',
  bg = '#292929',
})

hi('TabLineFill', {
  bg = '#292929',
})

hi('TabLineSel', {
  fg = c.fg,
  bg = c.bg,
})

hi('Pmenu', {
  fg = c.fg,
  bg = '#292929',
})

hi('PmenuSel', {
  fg = c.fg,
  bg = '#3a3a3a',
})

hi('PmenuSbar', {
  bg = '#333333',
})

hi('PmenuThumb', {
  bg = '#666666',
})

hi('Search', {
  fg = c.bg,
  bg = soft_pastels[4],
})

hi('IncSearch', {
  fg = c.bg,
  bg = soft_pastels[4],
})

hi('CurSearch', {
  fg = c.bg,
  bg = soft_pastels[9],
})

hi('Visual', {
  bg = '#3a3f45',
})

hi('MatchParen', {
  fg = c.cyan,
  bold = true,
})

hi('Directory', {
  fg = ocean_depths[3],
})

hi('Title', {
  fg = c.sidebar_title,
  bold = true,
})

hi('Question', {
  fg = c.teal,
})

hi('ErrorMsg', {
  fg = c.bracket_bad,
})

hi('WarningMsg', {
  fg = c.directive,
})

hi('MoreMsg', {
  fg = c.teal,
})

-- ============================================================================
-- Brackets
-- ============================================================================

hi('RainbowDelimiter1', {
  fg = c.bracket1,
})

hi('RainbowDelimiter2', {
  fg = c.bracket2,
})

hi('RainbowDelimiter3', {
  fg = c.bracket3,
})

hi('RainbowDelimiter4', {
  fg = c.bracket4,
})

hi('RainbowDelimiter5', {
  fg = c.bracket5,
})

hi('RainbowDelimiter6', {
  fg = c.bracket6,
})

