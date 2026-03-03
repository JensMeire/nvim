local M = {}

function M.configure_lsp(capabilities)
  vim.lsp.config("pyright", {
    capabilities = capabilities,
  })
  vim.lsp.enable("pyright")
end

function M.lsp_packages()
  return {
    "pyright",
  }
end

function M.lint_config()
  return {
    javascript = { "prettier" },
    typescript = { "prettier" },
    javascriptreact = { "prettier" },
    typescriptreact = { "prettier" },
    json = { "prettier" },
    html = { "prettier" },
    css = { "prettier" },
    scss = { "prettier" },
    less = { "prettier" },
  }
end

function M.lint_packages()
  return {
    "isort",
    "black",
  }
end

function M.configure_dap()
  return nil
end

function M.dap_dependencies()
  return nil
end

return M
