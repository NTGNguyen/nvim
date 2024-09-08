---@type NvPluginSpec
-- NOTE: Regex Explainer
return {
  "bennypowers/nvim-regexplainer",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "MunifTanjim/nui.nvim",
  },
  opts = {
    mappings = {
      toggle = "gR",
    },
    popup = {
      border = {
        style = vim.g.border_enabled and "rounded" or "single",
      },
    },
  },
  cmd = {
    "RegexplainerToggle",
  },
  init = function()
    vim.keymap.set("n", "gR", "<cmd>RegexplainerToggle<cr>", { desc = "Regexplainer | Toggle", silent = true })
  end,
}
