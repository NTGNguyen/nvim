local formatters_by_ft = {
  -- c = { "clang_format" },
  -- cpp = { "clang_format" },
  -- cs = { "clang_format" },
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
    format_on_save = function(bufnr)
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500, lsp_format = "fallback" }
    end,
  },
  init = function()
    vim.api.nvim_create_user_command("FormatDisable", function(args)
      if args.bang then
        -- FormatDisable! will disable formatting just for this buffer
        vim.b.disable_autoformat = true
        vim.notify("Disable Autoformat (Local)", vim.log.levels.INFO, { title = "Conform" })
      else
        vim.g.disable_autoformat = true
        vim.notify("Disable Autoformat", vim.log.levels.INFO, { title = "Conform" })
      end
    end, {
      desc = "Conform | Disable Autoformat On Save",
      bang = true,
    })

    vim.api.nvim_create_user_command("FormatEnable", function(args)
      if args.bang then
        vim.b.disable_autoformat = false
        vim.notify("Enable Autoformat (Local)", vim.log.levels.INFO, { title = "Conform" })
      else
        vim.g.disable_autoformat = false
        vim.notify("Enable Autoformat", vim.log.levels.INFO, { title = "Conform" })
      end
    end, {
      desc = "Conform | Enable Autoformat On Save",
      bang = true,
    })

    vim.keymap.set("n", "<leader>lF", function()
      if vim.b.disable_autoformat then
        vim.cmd "FormatEnable!"
      else
        vim.cmd "FormatDisable!"
      end
    end, { desc = "Conform | Toggle Autoformat", silent = true })
  end,
}
