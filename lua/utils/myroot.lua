local root_spec = { "lsp", { ".git", "lua" }, "cwd" }

local M = {}

function M.detect_lsp(bufnr)
  local clients = vim.lsp.get_active_clients({ bufnr = bufnr })
  for _, c in ipairs(clients) do
    local rd = c.config.root_dir
    if rd then return rd end
  end
end

function M.detect_pattern(bufnr, patterns)
  local path = vim.api.nvim_buf_get_name(bufnr)
  path = path ~= "" and vim.fn.fnamemodify(path, ":p:h") or vim.loop.cwd()
  local match = vim.fs.find(patterns, { path = path, upward = true })[1]
  if match then return vim.fs.dirname(match) end
end

function M.detect_cwd()
  return vim.loop.cwd()
end

function M.get_root(bufnr)
  bufnr = bufnr or vim.api.nvim_get_current_buf()
  for _, spec in ipairs(root_spec) do
    if spec == "lsp" then
      local root = M.detect_lsp(bufnr)
      if root then return root end
    elseif spec == "cwd" then
      return M.detect_cwd()
    elseif type(spec) == "table" then
      local root = M.detect_pattern(bufnr, spec)
      if root then return root end
    elseif type(spec) == "string" then
      local root = M.detect_pattern(bufnr, { spec })
      if root then return root end
    elseif type(spec) == "function" then
      local root = spec(bufnr)
      if root then return root end
    end
  end
end

return M

