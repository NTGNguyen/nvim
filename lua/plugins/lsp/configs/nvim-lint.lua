---@type NvPluginSpec
-- NOTE: Linting
return {
  "mfussenegger/nvim-lint",
  event = "User FilePost",
  enabled = true,
  config = function()
    local linters = require("lint").linters
    vim.list_extend(linters.ruff.args, { "--select=I", "--ignore=F401" })

    -- NOTE: Used eslint-lsp already
    require("lint").linters_by_ft = {
      -- cpp = { "cpplint" },
      -- javascript = { "eslint" },
      -- markdown = { "markdownlint" },
      -- typescript = { "eslint" },
      bash = { "shellcheck" },
      ghaction = { "actionlint" },
      latex = { "vale" },
      python = { "ruff" },
      sh = { "shellcheck" },
    }

    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost", "InsertLeave" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
}
