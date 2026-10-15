local M = {}

M.port = 14193
M.host = '127.0.0.1'
M.context = 1 << 13

M.models = {
  'ggml-org/Qwen25-Coder-1.5B-Q8_0-GGUF',
  'ggml-org/Qwen25-Coder-3B-Q8_0-GGUF',
  'ggml-org/Qwen25-Coder-7B-Q8_0-GGUF',
}

M.model_index = 2

M.command = {
  'llama-server',
  '-hf',
  M.models[M.model_index],
  '-ngl',
  '99',
  '-c',
  tostring(M.context),
  '--host',
  M.host,
  '--port',
  tostring(M.port),
  '--cache-reuse',
  '256',
  '-fa',
  'on',
}

M.models_url = 'http://' .. M.host .. ':' .. M.port .. '/v1/models'

local function find_server_pid()
  local result = vim
    .system({
      'pgrep',
      '-f',
      'llama-server.*ggml-org.*--port ' .. M.port,
    }, { text = true })
    :wait()
  if result.code ~= 0 then
    return nil
  end
  local pid = tonumber(vim.trim(result.stdout))
  return pid
end

function M.running()
  local pid = find_server_pid()
  return pid ~= nil and pid ~= ''
end

function M.start()
  if M.running() then
    vim.notify 'Minuet server is already running'
    return
  end
  vim.system(M.command, { detach = false })
  vim.notify 'Started Minuet llama.cpp server'
end

function M.stop()
  local pid = find_server_pid()
  if pid == nil or pid == '' then
    vim.notify 'Minuet server is not running'
    return
  end
  vim.system { 'kill', tostring(pid) }
  vim.notify 'Stopped Minuet llama.cpp server'
end

function M.toggle()
  if M.running() then
    M.stop()
  else
    M.start()
  end
end

return M
