---@type NvPluginSpec
-- NOTE: Preview Markdown
return {
  "iamcco/markdown-preview.nvim",
  keys = {
    {
      "<leader>mp",
      "<cmd>MarkdownPreviewToggle<cr>",
      desc = "Markdown | Preview",
      ft = "markdown",
      silent = true,
    },
  },
  build = function()
    vim.fn["mkdp#util#install"]()
  end,
  ft = "markdown",
}
