local M = {}

function M.configure_lsp(capabilities)
  vim.lsp.config("ruby_lsp", {
    capabilities = capabilities,
    init_options = {
      addonSettings = {
        ["Ruby LSP Rails"] = { enablePendingMigrationsPrompt = false },
      },
    },
  })
  vim.lsp.enable("ruby_lsp")
end

function M.lsp_packages()
  return {
    "ruby_lsp",
    "solargraph",
  }
end

function M.lint_config()
  return {
    ruby = { "rubocop", stop_after_first = true },
  }
end

function M.lint_packages()
  return {
    "rubocop",
  }
end

function M.debug_config()
  local dap = require("dap")
  dap.adapters.ruby = function(callback, _)
    callback({
      type = "server",
      host = "127.0.0.1",
      port = "38698",
    })
  end
  dap.configurations.ruby = {
    {
      type = "ruby",
      name = "Debug current file",
      request = "launch",
      program = "${file}",
    },
  }
end

return M
