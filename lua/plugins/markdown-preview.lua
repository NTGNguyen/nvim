---@type NvPluginSpec
-- NOTE: Preview Markdown
return {
  "iamcco/markdown-preview.nvim",
  enabled = true,
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
    require("lazy").load { plugins = { "markdown-preview.nvim" } }
    vim.fn["mkdp#util#install"]()
  end,
  ft = "markdown",
  init = function()
    vim.g.mkdp_open_to_the_world = 1 -- Open for other to access
  end,
}
