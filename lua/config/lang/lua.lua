local M = {}

function M.configure_lsp(capabilities)
  vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    settings = {
      Lua = {
        diagnostics = { globals = { "vim", "Snacks" } },
        completion = { callSnippet = "Replace" },
      },
    },
  })
  vim.lsp.enable("lua_ls")
end

function M.lsp_packages()
  return {
    "lua_ls",
  }
end

function M.lint_config()
  return {
    lua = { "stylua", stop_after_first = true },
  }
end

function M.lint_packages()
  return {
    "stylua",
  }
end

function M.configure_dap()
  return nil
end

function M.dap_dependencies()
  return nil
end

return M
