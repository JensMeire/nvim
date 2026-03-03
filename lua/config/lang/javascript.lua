local M = {}

function M.configure_lsp(capabilities)
  vim.lsp.config("eslint", {
    capabilities = capabilities,
    filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
  })
  vim.lsp.enable("eslint")
end

function M.lsp_packages()
  return {
    "ts_ls",
    "html",
    "cssls",
    "tailwindcss",
    "eslint",
  }
end

function M.lint_config()
  return {
    javascript = { "oxfmt" },
    typescript = { "oxfmt" },
    javascriptreact = { "oxfmt" },
    typescriptreact = { "oxfmt" },
    json = { "oxfmt" },
    html = { "oxfmt" },
    css = { "oxfmt" },
    scss = { "oxfmt" },
    less = { "oxfmt" },
  }
end

function M.lint_packages()
  return {
    "oxfmt",
    "prettier",
    "eslint_d",
  }
end

function M.debug_config()
  return nil
end

return M
