---@type NvPluginSpec
-- NOTE: Map keys without delay when typing
return {
  "max397574/better-escape.nvim",
  event = "VeryLazy",
  enabled = true,
  opts = {
    default_mappings = false,
    mappings = {
      i = {
        j = {
          k = "<Esc>",
        },
      },
    },
  },
  config = true,
}
