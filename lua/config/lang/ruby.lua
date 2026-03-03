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

function M.configure_dap()
  require("dap-ruby").setup()
end

function M.dap_dependencies()
  return {
    "suketa/nvim-dap-ruby",
  }
end

return M
