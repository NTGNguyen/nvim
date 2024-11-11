local fts = {
  "Avante",
  "help",
  "markdown",
  "norg",
  "org",
  "rmd",
  "vimwiki",
}

---@type NvPluginSpec
-- NOTE: Preview Markdown
return {
  "iamcco/markdown-preview.nvim",
  enabled = true,
  keys = {
    {
      "<leader>mp",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown Preview | Toggle",
      ft = fts,
      silent = true,
    },
    {
      "<leader>mt",
      function()
        if vim.g.mkdp_theme == "light" then
          vim.g.mkdp_theme = "dark"
          vim.notify("Dark Mode", vim.log.levels.INFO, { title = "Markdown Preview" })
        else
          vim.g.mkdp_theme = "light"
          vim.notify("Light Mode", vim.log.levels.INFO, { title = "Markdown Preview" })
        end
      end,
      desc = "Markdown Preview | Toggle Theme",
      ft = fts,
      silent = true,
    },
  },
  build = function()
    require("lazy").load { plugins = { "markdown-preview.nvim" } }
    vim.fn["mkdp#util#install"]()
  end,
  ft = fts,
  init = function()
    vim.g.mkdp_open_to_the_world = 1 -- Open for other to access
    vim.g.mkdp_port = 65530
  end,
}
