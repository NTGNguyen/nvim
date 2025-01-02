---@type NvPluginSpec
-- NOTE: Smooth scrolling with Cinnamon
return {
  "declancm/cinnamon.nvim",
  event = "VeryLazy",
  enabled = false,
  opts = {
    keymaps = {
      basic = true, -- Enable the basic keymaps
      extra = false, -- Enable the extra keymaps
    },
    options = {
      delay = 7, -- Delay between each movement step (in ms)
      max_delta = {
        line = 150, -- Maximum delta for line movements
        column = 200, -- Maximum delta for column movements
      },
      mode = "cursor", ---@type "cursor" | "window"
    },
  },
}
