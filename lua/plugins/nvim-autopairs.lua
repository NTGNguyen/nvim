---@type NvPluginSpec
-- NOTE: autopairs for neovim written in lua
return {
  "windwp/nvim-autopairs",
  dependencies = {
    "hrsh7th/nvim-cmp",
  },
  event = {
    "InsertEnter",
  },
  config = function(_, opts)
    require("nvim-autopairs").setup(opts)

    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
  end,
}
