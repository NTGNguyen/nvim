---@type NvPluginSpec
-- NOTE: Screensaver plugins
-- But it's WIP
return {
  "tamton-aquib/zone.nvim",
  cond = false,
  event = "VeryLazy",
  opts = {
    after = 60, -- Seconds
  },
}
