---@type NvPluginSpec
-- NOTE: Linting
return {
  "mfussenegger/nvim-lint",
  event = "BufReadPost",
  enabled = true,
  config = function()
    local linters = require("lint").linters
    vim.list_extend(linters.ruff.args, { "--select=I", "--ignore=F401" })

    require("lint").linters_by_ft = {
      -- cpp = { "cpplint" },
      -- markdown = { "markdownlint" },
      bash = { "shellcheck" },
      ghaction = { "actionlint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      latex = { "vale" },
      python = { "ruff" },
      sh = { "shellcheck" },
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
