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

vim.cmd 'highlight clear'
if vim.fn.exists 'syntax_on' then
  vim.cmd 'syntax reset'
end

vim.g.colors_name = 'aquatic-old'

local c = {
  bg = '#1c1c1c',
  fg = '#a9b7c6',

  -- Colors

  variable = '#a9b7c6',

  bool = '#377dff',
  number = '#6897bb',
  string = '#248732',

  string_special = '#cc7832',
  string_format = '#cc7832',
  string_escape = '#cc7832',

  keyword = '#068bd8',
  operator = '#a100c7',
  punct_bright = '#25f8ff',
  punct_dark = '#3745af',

  magic_function = '#b200b2',

  decoration = '#bbb529',
  directive = '#c1b107',
  macro = '#7c6a00',

  self = '#94558d',

  frenchblue = '#0570AD',

  -- UI
  sidebar_title = '#bbbbbb',
  badge = '#007acc',

  -- Bracket colors
  bracket1 = '#0072ff',
  bracket2 = '#0081dc',
  bracket3 = '#1aabd8',
  bracket4 = '#22c4c8',
  bracket5 = '#29b295',
  bracket6 = '#179387',
  bracket_bad = '#ca272d',

  -- Semantic
  namespace = '#614383',

  type_alias = '#3791aa',
  type_parameter = '#257583',
  type_interface = '#12595c',
  type_def = '#8888c6',
  type_entity = '#735991',
  type_abstract = '#798ccb',
  type_inherited = '#045250',
  type_builtin = '#8888c6',

  function_def = '#0d9d92',
  function_call = '#3d7760',
  function_generic = '#5caeb9',
  function_builtin = '#8888c6',

  property = '#cb85c2',
  constant_caps = '#9876aa',

  exception = '#8e343d',
  error = '#8e343d',

  comment = '#808080',
  docstring = '#629755',

  keyword_arg = '#72518d',

  regex = '#388f40',
  regex_escape = '#f39418',
  regex_escape_special = '#e7f06f',
  regex_set = '#f6cb3f',
  regex_operator = '#1b71fa',
  regex_quantifier = '#4f92ff',
  regex_named_tag = '#9de5c1',
  regex_named_group = '#97fd44',
  regex_redundant = '#8f8596',

  attribute_cpp = "#434e9e",
}

local function hi(group, opts)
  vim.api.nvim_set_hl(0, group, opts)
end

local function fg(group, color)
  vim.api.nvim_set_hl(0, group, { fg = color })
end

local function fgm(groups, color)
  for _, group in ipairs(groups) do
    fg(group, color)
  end
end

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
  bg = c.bracket3,
})

hi('IncSearch', {
  fg = c.bg,
  bg = c.cyan,
})

hi('CurSearch', {
  fg = c.bg,
  bg = c.cyan,
})

hi('Visual', {
  bg = '#3a3f45',
})

hi('MatchParen', {
  fg = c.cyan,
  bold = true,
})

hi('Directory', {
  fg = c.keyword,
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

hi('RainbowDelimiterRed', {
  fg = c.bracket1,
})

hi('RainbowDelimiterYellow', {
  fg = c.bracket2,
})

hi('RainbowDelimiterBlue', {
  fg = c.bracket3,
})

hi('RainbowDelimiterOrange', {
  fg = c.bracket4,
})

hi('RainbowDelimiterGreen', {
  fg = c.bracket5,
})

hi('RainbowDelimiterViolet', {
  fg = c.bracket6,
})

hi('RainbowDelimiterCyan', {
  fg = c.bracket3,
})

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
fg('Boolean', c.constant)
fg('Constant', c.constant)
fg('Identifier', c.variable)
fg('Function', c.function_def)
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
fg('Type', c.type)
fg('StorageClass', c.storage)
fg('Structure', c.type)
fg('Special', c.format)
fg('Delimiter', c.punctuation)

hi('Underlined', {
  underline = true,
})

fg('Error', c.bracket_bad)

hi('Todo', {
  fg = c.directive,
  bold = true,
})

-- ============================================================================
-- Tree-sitter
-- ============================================================================

-- Comments
fg('@comment', c.comment)
fg('@comment.documentation', c.docstring)

hi('@comment.todo', {
  fg = c.directive,
  bold = true,
})

fg('@comment.note', c.docstring)

hi('@comment.warning', {
  fg = c.directive,
  bold = true,
})

hi('@comment.error', {
  fg = c.bracket_bad,
  bold = true,
})

-- Strings
fg('@string', c.string)
fg('@string.documentation', c.docstring)
fg('@string.escape', c.escape)
fg('@string.special', c.format)
fg('@string.regexp', c.regex)

fg('@boolean', c.bool)

-- Constants
fg('@constant', c.constant_caps)

fg('@constant.builtin', c.constant)

-- Numbers
fg('@number', c.number)
fg('@number.float', c.number)

-- Variables
fg('@variable', c.variable)
fg('@variable.builtin', c.keyword)
fg('@variable.parameter', c.variable)
fg('@variable.parameter.builtin', c.self)
fg('@variable.member', c.property)

-- Properties
fg('@property', c.property)

-- Functions
fgm({
  '@function',
  '@function.call',
  '@function.method.call',
  '@lsp.type.function',
  '@lsp.typemod.function',
}, c.function_call)

fg('@function.builtin', c.builtin_type)

fg('@function.method', c.function_def)

fgm({
  '@function.macro',
  '@constant.macro',
  '@lsp.type.macro',
  '@lsp.typemod.macro',
}, c.macro)

-- Methods / constructors
fg('@constructor', c.type)

-- Types
fg('@type', c.type_entity)
fg('@type.builtin', c.type_builtin)
fg('@type.definition', c.type_def)
fg('@type.parameter', c.type_parameter)

fgm({
  '@lsp.type.type',
}, c.type_alias)

fgm({
  '@lsp.type.class',
}, c.type_entity)

fgm({
  '@lsp.type.typeParameter',
}, c.type_parameter)


-- Keywords
fgm({
  '@keyword',
  '@keyword.type',
  '@keyword.operator',
  '@keyword.return',
  '@keyword.repeat',
  '@keyword.conditional',
  '@keyword.modifier',
  '@keyword.exception',
  '@keyword.import',
  '@keyword.function',
  '@keyword.storage',
}, c.keyword)

fgm({
  '@keyword.directive',
  '@keyword.import.c',
  '@keyword.import.cpp',
}, c.directive)

hi('@keyword.directive', {
  fg = c.directive,
  bold = true,
})

-- Operators
fg('@operator', c.operator)

-- Punctuation
fg('@punctuation.delimiter', c.punct_bright)

fg('@punctuation.bracket', c.punct_dark)

fg('@punctuation.special', c.punct_dark)

-- Labels
fg('@label', c.keyword)

-- Attributes / annotations
fg('@attribute', '#bbb529')
fg('@attribute.cpp', c.attribute_cpp)

-- Namespace
fg('@module', c.namespace)

fg('@namespace', c.namespace)

-- Macros
fg('@macro', c.macro)

-- Tags (HTML/XML/etc.)
fg('@tag', c.type)
fg('@tag.builtin', c.type)
fg('@tag.attribute', c.property)
fg('@tag.delimiter', c.punctuation)

-- ============================================================================
-- Language-specific Tree-sitter overrides
-- ============================================================================

-- C / C++
-- fg('@type.cpp', c.type)
-- fg('@type.builtin.cpp', c.builtin_type)
-- fg('@function.cpp', c.function_def)
-- fg('@function.call.cpp', c.function_call)
-- fg('@function.method.cpp', c.function_def)
-- fg('@function.method.call.cpp', c.function_call)
-- fg('@variable.member.cpp', c.property)
-- fg('@keyword.cpp', c.keyword)
-- fg('@keyword.return.cpp', c.keyword)
-- fg('@operator.cpp', c.operator)
-- fg('@number.cpp', c.number)
-- fg('@comment.cpp', c.comment)

-- C preprocessor
-- hi('@keyword.directive.cpp', {
--   fg = c.directive,
--   bold = true,
-- })

-- fg('@preproc.cpp', c.macro)
-- fg('@function.macro.cpp', c.macro)

-- Python
-- fg('@type.python', c.type)
-- fg('@type.builtin.python', c.builtin_type)
-- fg('@function.python', c.function_def)
-- fg('@function.call.python', c.function_call)
-- fg('@function.method.python', c.function_def)
-- fg('@function.method.call.python', c.function_call)
-- fg('@variable.parameter.python', c.variable)
-- fg('@keyword.python', c.keyword)
-- fg('@string.python', c.string)
-- fg('@string.documentation.python', c.docstring)
-- fg('@attribute.python', '#bbb529')
fg('@variable.builtin.python', c.self)

-- Python lambda
-- hi('@keyword.function.python', {
--   fg = c.keyword,
--   italic = true,
-- })

-- ============================================================================
-- LSP semantic tokens
--
-- These correspond closely to the semanticTokenColors section of the VS Code
-- theme.
-- ============================================================================

-- fg('@lsp.type.namespace', c.namespace)
-- fg('@lsp.type.macro', c.macro)
-- fg('@lsp.type.variable', c.variable)
-- fg('@lsp.type.type', c.type)
-- fg('@lsp.type.typeParameter', c.type)
-- fg('@lsp.type.property', c.property)
-- fg('@lsp.type.parameter', c.variable)
-- fg('@lsp.type.function', c.function_def)
-- fg('@lsp.type.method', c.function_def)
-- fg('@lsp.type.class', c.type)
-- fg('@lsp.type.enum', c.type)
-- fg('@lsp.type.enumMember', c.constant)
-- fg('@lsp.type.interface', c.type)
-- fg('@lsp.type.decorator', c.decoration)
-- fg('@lsp.type.comment', c.comment)

-- Static readonly variables/properties
-- fg('@lsp.mod.readonly', c.property)
-- fg('@lsp.mod.static', c.property)

-- More specific combinations
-- fg('@lsp.typemod.variable.readonly', c.property)
-- fg('@lsp.typemod.variable.static', c.property)
-- fg('@lsp.typemod.variable.static.readonly', c.property)
-- fg('@lsp.typemod.function.definition', c.function_def)

-- ============================================================================
-- Regex
-- ============================================================================

fg('@string.regexp', c.regex)
fg('@punctuation.bracket.regexp', c.regex_set)
fg('@punctuation.delimiter.regexp', c.regex_set)
fg('@operator.regexp', c.regex_operator)

hi('@string.escape.regexp', {
  fg = c.regex_escape,
  bold = true,
})

hi('@string.special.regexp', {
  fg = c.regex_escape_special,
  bold = true,
})

-- ============================================================================
-- Diagnostics
-- ============================================================================

fg('DiagnosticError', c.bracket_bad)
fg('DiagnosticWarn', c.directive)
fg('DiagnosticInfo', c.bracket3)
fg('DiagnosticHint', c.teal)

hi('DiagnosticUnderlineError', {
  undercurl = true,
  sp = c.bracket_bad,
})

hi('DiagnosticUnderlineWarn', {
  undercurl = true,
  sp = c.directive,
})

hi('DiagnosticUnderlineInfo', {
  undercurl = true,
  sp = c.bracket3,
})

hi('DiagnosticUnderlineHint', {
  undercurl = true,
  sp = c.teal,
})

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
