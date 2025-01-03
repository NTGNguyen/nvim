---@type NvPluginSpec
-- NOTE: Whenever cursor jumps some distance or moves between windows, it will flash so you can see where it is
return {
  "DanilaMihailov/beacon.nvim",
  cond = false,
  event = "VeryLazy",
}
