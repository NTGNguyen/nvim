---@type NvPluginSpec
-- NOTE: Colorful Window Separator
return {
  "nvim-zh/colorful-winsep.nvim",
  cond = false,
  event = "WinLeave",
  opts = {
    -- Highlight group is defined in highlight.lua
  },
}
