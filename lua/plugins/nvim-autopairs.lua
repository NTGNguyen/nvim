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

    -- If you want insert `(` after select function or method item
    local cmp_autopairs = require "nvim-autopairs.completion.cmp"
    local cmp = require "cmp"
    cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())

    local handlers = require "nvim-autopairs.completion.handlers"

    cmp.event:on(
      "confirm_done",
      cmp_autopairs.on_confirm_done {
        filetypes = {
          -- "*" is a alias to all filetypes
          ["*"] = {
            ["("] = {
              kind = {
                cmp.lsp.CompletionItemKind.Function,
                cmp.lsp.CompletionItemKind.Method,
              },
              handler = handlers["*"],
            },
          },
          lua = {
            ["("] = {
              kind = {
                cmp.lsp.CompletionItemKind.Function,
                cmp.lsp.CompletionItemKind.Method,
              },
            },
          },
          -- Disable for tex
          tex = false,
        },
      }
    )
  end,
}
