local M = {}

M.port = 14193
M.host = '127.0.0.1'
M.context = 1 << 13

M.models = {
  'ggml-org/Qwen2.5-Coder-1.5B-Q8_0-GGUF',
  'ggml-org/Qwen2.5-Coder-3B-Q8_0-GGUF',
  'ggml-org/Qwen2.5-Coder-7B-Q8_0-GGUF',
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

M.base_url = 'http://' .. M.host .. ':' .. M.port
M.models_url = M.base_url .. '/v1/models'
M.openai_url = M.base_url .. '/v1'

M.active = false

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
  M.active = pid ~= nil and pid ~= ''
  return M.active
end

function M.start()
  if M.running() then
    vim.notify 'Minuet server is already running'
    return
  end
  vim.system(M.command)
  vim.notify 'Started Minuet llama.cpp server'
  M.active = true
end

function M.stop()
  local pid = find_server_pid()
  M.active = pid == nil or pid == ''
  if M.active then
    vim.notify 'Minuet server is not running'
    return
  end
  vim.system { 'kill', tostring(pid) }
  vim.notify 'Stopped Minuet llama.cpp server'
  M.active = false
end

function M.toggle()
  if M.running() then
    M.stop()
  else
    M.start()
  end
end

return M
