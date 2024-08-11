return {
  filetypes = {
    -- NOTE: Those commented filetypes use tsserver.
    -- "javascript",
    -- "javascriptreact",
    -- "javascript.jsx",
    -- "typescript",
    -- "typescriptreact",
    -- "typescript.tsx",
    "vue",
    "svelte",
    "astro",
  },
  on_attach = function(client, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
  settings = {
    eslint = {
      format = {
        enable = false,
      },
      rules = {
        customizations = {
          -- Your Rules
        },
      },
    },
  },
}
