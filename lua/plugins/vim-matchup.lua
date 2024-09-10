---@type NvPluginSpec
-- NOTE: vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen. Supports both vim and neovim + tree-sitter.
return {
  "andymass/vim-matchup",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      matchup = {
        enable = true, -- mandatory, false will disable the whole extension
        enable_quotes = true,
      },
    },
  },
  event = "BufReadPost",
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
}
