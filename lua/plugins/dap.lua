-- Central dap plugin spec, with modular language configs
return {
  "mfussenegger/nvim-dap",
  dependencies = require("config.lang").dap_dependencies(),
  config = function()
    require("config.lang").setup_dap()
    vim.fn.sign_define("DapBreakpoint", {
      text = "●",
      texthl = "DapBreakpoint",
    })

    vim.fn.sign_define("DapBreakpointCondition", {
      text = "◆",
      texthl = "DapBreakpointCondition",
    })

    vim.fn.sign_define("DapBreakpointRejected", {
      text = "",
      texthl = "DapBreakpointRejected",
    })

    vim.fn.sign_define("DapLogPoint", {
      text = "▶",
      texthl = "DapLogPoint",
    })

    vim.api.nvim_set_hl(0, "DapBreakpoint", { fg = "#FF0000" })
    vim.api.nvim_set_hl(0, "DapBreakpointCondition", { fg = "#FFA500" })
    vim.api.nvim_set_hl(0, "DapBreakpointRejected", { fg = "#888888" })
    vim.api.nvim_set_hl(0, "DapLogPoint", { fg = "#61AFEF" })
  end,
}
