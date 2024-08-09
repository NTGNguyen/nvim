---@type NvPluginSpec
-- NOTE: For switching between Python venv
return {
  "linux-cultist/venv-selector.nvim",
  branch = "regexp",
  cmd = { "VenvSelect", "VenvSelectCached" },
  keys = {
    { "<leader>vs", "<cmd>VenvSelect<cr>", desc = "Venv Selector | Select Python venv", ft = "python", silent = true },
  },
  opts = {},
  config = function(_, opts)
    require("venv-selector").setup(opts)
  end,
}
