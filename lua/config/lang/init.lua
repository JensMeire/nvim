local M = {}

local languages = {
  "ruby",
  "javascript",
  "lua",
  "python",
}

local function language_config(language)
  return require("config.lang." .. language)
end

function M.setup_lsp(capabilities)
  for _, lang in ipairs(languages) do
    local lang_config = require("config.lang." .. lang)
    lang_config.configure_lsp(capabilities)
  end
end

function M.lsp_packages()
  local packages = {}
  for _, lang in ipairs(languages) do
    local lang_config = language_config(lang)
    local lang_packages = lang_config.lsp_packages()
    if lang_packages then
      vim.list_extend(packages, lang_packages)
    end
  end
  return packages
end

function M.lint_config()
  local config = {}
  for _, lang in ipairs(languages) do
    local lang_config = language_config(lang)
    local lang_lint_config = lang_config.lint_config()
    if lang_lint_config then
      config = vim.tbl_deep_extend("force", config, lang_lint_config)
    end
  end
  return config
end

function M.lint_packages()
  local packages = {}
  for _, lang in ipairs(languages) do
    local lang_config = language_config(lang)
    local lang_packages = lang_config.lint_packages()
    if lang_packages then
      vim.list_extend(packages, lang_packages)
    end
  end
  return packages
end

return M
