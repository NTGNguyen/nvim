---@type NvPluginSpec
return {
  "alohaia/fcitx.nvim",
  cond = false and (vim.fn.executable "fcitx5" == 1 or vim.fn.executable "fcitx" == 1),
  event = "BufFilePost",
  opts = {},
  config = function(_, opts)
    require "fcitx"(opts)
  end,
}
