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
  mysql = { "mysql_formatter" },
  python = { "ruff_fix", "ruff_format" },
  scss = { "prettier" },
  sh = { "shfmt" },
  sqloracle = { "sql_formatter" },
  sql = { "sql_formatter" },
  tsql = { "tsql_formatter" },
  typescript = { "prettier" },
  typescriptreact = { "prettier" },
  vue = { "prettier" },
  yaml = { "prettier" },
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
      -- "--ignore=F401", -- Unused import
    },
  },
  ["mysql_formatter"] = {
    command = "sql-formatter",
    args = {
      "--language=mysql",
    },
  },
  ["tsql_formatter"] = {
    command = "sql-formatter",
    args = {
      "--language=tsql",
    },
  },
}

---@type NvPluginSpec
return {
  -- NOTE: Formatting
  "stevearc/conform.nvim",
  event = "User FilePost",
  opts = {
    format_after_save = function(bufnr) -- Async format
      -- Disable with a global or buffer-local variable
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      -- Disable autoformat for files in a certain path
      local bufname = vim.api.nvim_buf_get_name(bufnr)
      if bufname:match "/node_modules/" then
        return
      end
      return { lsp_format = "fallback" }
    end,
    formatters_by_ft = formatters_by_ft,
    formatters = formatters,
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
