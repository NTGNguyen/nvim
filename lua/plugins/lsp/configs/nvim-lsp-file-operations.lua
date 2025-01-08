---@type NvPluginSpec
-- NOTE: Neovim plugin that adds support for file operations using built-in LSP
return {
  "antosha417/nvim-lsp-file-operations",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-tree.lua",
  },
  config = true,
}
