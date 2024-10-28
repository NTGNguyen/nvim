---@type NvPluginSpec
-- NOTE: A Neovim plugin that displays interactive vertical scrollbars and signs
return {
  "dstein64/nvim-scrollview",
  event = "BufReadPost",
  opts = {
    excluded_filetypes = {
      "NvimTree",
    },
  },
  keys = {
    { "<leader>o<C-s>", "<cmd>ScrollViewToggle<cr>", desc = "Scrollview | Toggle", silent = true },
  },
}
