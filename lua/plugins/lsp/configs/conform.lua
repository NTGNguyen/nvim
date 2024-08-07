local formatters_by_ft = {
  lua = { "stylua" },
  python = {
    "ruff_fix",
    "ruff_format",
  },
  -- cpp = { "clang_format" },
  -- c = { "clang_format" },
  -- go = { "gofumpt" },
  -- cs = { "csharpier" },
  sh = { "shfmt" },
  zsh = { "beautysh" },
  ["markdown"] = { "prettier", "doctoc" },
  ["markdown.mdx"] = { "prettier", "doctoc" },
  mysql = { "sqlfluff" },
  sql = { "sqlfluff" },
  sqloracle = { "sqlfluff" },
}

local prettier_ft = {
  "css",
  "flow",
  "graphql",
  "html",
  "json",
  "javascriptreact",
  "javascript",
  "less",
  "scss",
  "typescript",
  "typescriptreact",
  "vue",
  "yaml",
}

for _, filetype in pairs(prettier_ft) do
  formatters_by_ft[filetype] = { "prettier" }
end

local formatters = {
  ["doctoc"] = {
    append_args = {
      "--update-only",
    },
  },
  ["markdown-toc"] = {
    append_args = {
      "--bullets=-",
    },
  },
  ["prettier"] = {
    append_args = {
      "--ignore-gitignore", -- Format file which ignored by .gitignore
      "--single-quote",
      -- "--jsx-single-quote", -- NOTE: Don't use this if you want all jsx to be single quote
    },
  },
  ["beautysh"] = {
    append_args = {
      "--indent-size=2",
    },
  },
  ["clang_format"] = {
    append_args = {
      "--fallback-style=Microsoft",
    },
  },
  ["ruff_fix"] = {
    append_args = {
      "--select=I",
      "--ignore=F401",
    },
  },
  ["sql_formatter_mysql"] = {
    command = "sql-formatter",
    args = {
      "--language=mysql",
    },
  },
}

---@type NvPluginSpec
return {
  -- NOTE: Formatting
  "stevearc/conform.nvim",
  event = "User FilePost",
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_after_save = {},
    formatters_by_ft = formatters_by_ft,
    formatters = formatters,
  },
}
