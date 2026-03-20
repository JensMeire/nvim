return {
  {
    "igorlfs/nvim-dap-view",
    -- let the plugin lazy load itself
    lazy = false,
    ---@module 'dap-view'
    ---@type dapview.Config
    opts = {
      winbar = {
        controls = {
          enabled = true,
        },
      },
      auto_toggle = true,
    },
    config = function()
      local dap, dapview = require("dap"), require("dap-view")
      dap.listeners.after.event_initialized["dapui_config"] = function()
        --    dapview.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        --  dapview.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        -- dapview.close()
      end
    end,
  },
}
