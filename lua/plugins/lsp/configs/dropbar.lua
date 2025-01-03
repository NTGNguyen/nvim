---@type NvPluginSpec
-- NOTE: IDE-like breadcrumbs, out of the box
return {
  "Bekaboo/dropbar.nvim",
  cond = false,
  event = "LspAttach",
  -- optional, but required for fuzzy finder support
  dependencies = {
    "nvim-telescope/telescope-fzf-native.nvim",
  },
}
