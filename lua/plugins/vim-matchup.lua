---@type NvPluginSpec
-- NOTE: vim match-up: even better % 👊 navigate and highlight matching words 👊 modern matchit and matchparen. Supports both vim and neovim + tree-sitter.
return {
  "andymass/vim-matchup",
  event = "BufReadPost",
  init = function()
    vim.g.matchup_matchparen_offscreen = { method = "popup" }
  end,
  opts = {
    matchup = {
      enable = true, -- mandatory, false will disable the whole extension
    },
  },
}
