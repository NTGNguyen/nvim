---@type NvPluginSpec
-- NOTE: Better Markdown
return {
  "MeanderingProgrammer/render-markdown.nvim",
  enabled = false,
  -- ft = "markdown",
  -- dependencies = { 'nvim-treesitter/nvim-treesitter', 'echasnovski/mini.icons' }, -- if you use standalone mini plugins
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" }, -- if you prefer nvim-web-devicons
  cmd = {
    "RenderMarkdown",
  },
  init = function()
    vim.keymap.set("n", "<leader>mr", function()
      if vim.bo.filetype == "markdown" then
        vim.cmd "RenderMarkdown toggle"
      else
        vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Render" })
      end
    end, { desc = "Markdown | Toggle Render", silent = true })
  end,
  opts = {
    enabled = false,
  },
}
