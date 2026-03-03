-- Conform.nvim unified plugin spec for lazy.nvim
return {
  "stevearc/conform.nvim",
  opts = function()
    return {
      formatters_by_ft = require("config.lang").lint_config(),
      format_on_save = { lsp_fallback = true, timeout_ms = 500 },
    }
  end,
}
