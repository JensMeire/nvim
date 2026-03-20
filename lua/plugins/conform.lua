-- Conform.nvim unified plugin spec for lazy.nvim
return {
  "stevearc/conform.nvim",
  opts = function()
    local util = require("conform.util")
    return {
      formatters_by_ft = require("config.lang").lint_config(),
      format_on_save = { lsp_fallback = false, timeout_ms = 500 },
      formatters = {
        oxfmt = {
          command = "oxfmt",
          cwd = util.root_file({
            ".oxfmtrc.json",
            ".git",
            "package.json",
          }),
        },
      },
    }
  end,
}
