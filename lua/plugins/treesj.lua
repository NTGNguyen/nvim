---@type NvPluginSpec
-- NOTE: Neovim plugin for splitting/joining blocks of code
return {
  "Wansmer/treesj",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  }, -- if you install parsers with "nvim-treesitter"
  cmd = {
    "TSJToggle",
  },
  init = function()
    vim.keymap.set("n", "<leader>ut", "<cmd>TSJToggle<cr>", { desc = "TreeSJ | Toggle", silent = true })
  end,
  config = true,
}
