local formatters_by_ft = {
  -- c = { "clang_format" },
  -- cpp = { "clang_format" },
  cs = { "clang_format" },
  css = { "prettier" },
  flow = { "prettier" },
  go = { "gofumpt" },
  graphql = { "prettier" },
  html = { "prettier" },
  javascript = { "prettier" },
  javascriptreact = { "prettier" },
  json = { "prettier" },
  jsonc = { "prettier" },
  less = { "prettier" },
  lua = { "stylua" },
  ["markdown.mdx"] = { "prettier", "doctoc" },
  markdown = { "prettier", "doctoc" },
  mysql = { "sql_formatter_mysql" },
  python = { "ruff_fix", "ruff_format" },
  scss = { "prettier" },
  sh = { "shfmt" },
  sqloracle = { "sql_formatter" },
  sql = { "sql_formatter" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
  vue = { "prettier" },
  -- yaml = { "yamlfmt" }, -- yaml-language-server handle formatting
  zsh = { "beautysh" },
}

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
  event = "BufReadPost",
  opts = {
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_after_save = {},
    formatters_by_ft = formatters_by_ft,
    formatters = formatters,
  },
}
