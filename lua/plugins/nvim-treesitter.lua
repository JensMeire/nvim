return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPre", "BufNewFile" }, -- load early, but not at startup
  main = "nvim-treesitter.configs",
  opts = {
    ensure_installed = {
      "ruby",
      -- add more if you want:
      -- "lua", "vim", "vimdoc", "bash", "json", "yaml"
    },
    highlight = { enable = true },
    indent = { enable = true },
  },
}
