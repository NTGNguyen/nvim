---@type NvPluginSpec
-- NOTE: Show Better Diagnostic Inline
return {
  "rachartier/tiny-inline-diagnostic.nvim",
  event = "BufReadPost",
  opts = {
    overflow = {
      mode = "oneline", -- wrap, none, oneline
    },
  },
}
