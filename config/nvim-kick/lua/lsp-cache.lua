local M = {}

local lsp_symbol_cache = {}

local function update_symbol_cache(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  if not vim.api.nvim_buf_is_valid(bufnr) then
    return
  end

  local clients = vim.lsp.get_clients { bufnr = bufnr, method = 'textDocument/documentSymbol' }
  if #clients == 0 then
    return
  end

  vim.lsp.buf_request(bufnr, 'textDocument/documentSymbol', {
    textDocument = { uri = vim.uri_from_bufnr(bufnr) },
  }, function(err, result, _, _)
    if err or not result then
      return
    end
    lsp_symbol_cache[bufnr] = result
  end)
end

function M.setup()
  vim.api.nvim_create_autocmd({ 'BufEnter', 'BufWritePost', 'InsertLeave' }, {
    group = vim.api.nvim_create_augroup('LlmLspContext', { clear = true }),
    callback = function(args)
      vim.defer_fn(function()
        update_symbol_cache(args.buf)
      end, 100)
    end,
  })
end

function M.get_context(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  local symbols = lsp_symbol_cache[bufnr]

  if not symbols then
    return ''
  end

  local line = vim.api.nvim_win_get_cursor(0)[1] - 1

  local function find_symbol(items)
    for _, symbol in ipairs(items or {}) do
      if line >= symbol.range.start.line and line <= symbol.range['end'].line then
        return find_symbol(symbol.children) or symbol
      end
    end
  end
  local symbol = find_symbol(symbols)
  return symbol and symbol.name or ''
end

return M
