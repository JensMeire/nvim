return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    "folke/which-key.nvim",
    { "antosha417/nvim-lsp-file-operations", config = true },
  },
  config = function()
    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require("cmp_nvim_lsp")
    local whichkey = require("which-key")

    local keymap = vim.keymap -- for conciseness
    vim.api.nvim_create_autocmd("LspAttach", {
      group = vim.api.nvim_create_augroup("UserLspConfig", {}),
      callback = function(ev)
        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf, silent = true }

        -- set keybinds
        opts.desc = "Show LSP references"
        keymap.set("n", "<F8>", vim.lsp.buf.references, opts) -- show definition, references

        opts.desc = "Go to declaration"
        keymap.set("n", "<F9>", vim.lsp.buf.declaration, opts) -- go to declaration

        opts.desc = "Show LSP definitions"
        keymap.set("n", "<F11>", vim.lsp.buf.definition, opts) -- show lsp definitions

        opts.desc = "Show LSP implementations"
        keymap.set("n", "<F10>", vim.lsp.buf.implementation, opts) -- show lsp implementations

        opts.desc = "Show LSP type definitions"
        keymap.set("n", "<F12>", vim.lsp.buf.type_definition, opts) -- show lsp type definitions

        opts.desc = "See available code actions"
        keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

        opts.desc = "Smart rename"
        keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

        opts.desc = "Show buffer diagnostics"
        keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

        opts.desc = "Show line diagnostics"
        keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

        opts.desc = "Go to previous diagnostic"
        keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

        opts.desc = "Go to next diagnostic"
        keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

        opts.desc = "Show documentation for what is under cursor"
        keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

        opts.desc = "Restart LSP"
        keymap.set("n", "<leader>gr", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
      end,
    })

    vim.diagnostic.config({
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = " ",
          [vim.diagnostic.severity.WARN] = " ",
          [vim.diagnostic.severity.HINT] = "󰠠 ",
          [vim.diagnostic.severity.INFO] = " ",
        },
      },
    })

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config("eslint", {
      capabilities = capabilities,
      filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
    })
    vim.lsp.enable("eslint")

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

    vim.lsp.config("ruby_lsp", {
      capabilities = capabilities,
      init_options = {
        addonSettings = {
          ["Ruby LSP Rails"] = { enablePendingMigrationsPrompt = false },
        },
      },
    })
    vim.lsp.enable("ruby_lsp")

    vim.lsp.config("pyright", {
      capabilities = capabilities,
    })
    vim.lsp.enable("pyright")
  end,
}
