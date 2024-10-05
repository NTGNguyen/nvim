local fts = {
  "Avante",
  "help",
  "markdown",
  "norg",
  "org",
  "rmd",
  "vimwiki",
}

---@type NvPluginSpec
-- NOTE: Better Markdown
return {
  "OXY2DEV/markview.nvim",
  -- lazy = false, -- Recommended
  ft = fts,
  dependencies = {
    -- You will not need this if you installed the
    -- parsers manually
    -- Or if the parsers are in your $RUNTIMEPATH
    "nvim-treesitter/nvim-treesitter",
    "nvim-tree/nvim-web-devicons",
  },
  cmd = {
    "Markview",
  },
  keys = {
    {
      "<leader>mv",
      "<cmd>Markview<cr>",
      desc = "Markdown | Toggle View",
      ft = fts,
      silent = true,
    },
  },
  opts = {
    filetypes = fts,
  },
  config = function(_, opts)
    require("markview").setup(opts)
    -- vim.cmd "Markview disableAll"
  end,
}
