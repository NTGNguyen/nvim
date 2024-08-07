---@type NvPluginSpec
-- NOTE: Better Markdown
return {
  "OXY2DEV/markview.nvim",
  -- lazy = false, -- Recommended
  ft = "markdown", -- If you decide to lazy-load anyway
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
  init = function()
    vim.keymap.set("n", "<leader>mv", function()
      if vim.bo.filetype == "markdown" then
        vim.cmd "Markview"
      else
        vim.notify("Only available in markdown", vim.log.levels.WARN, { title = "Markdown-Render" })
      end
    end, { desc = "Markview | Toggle View", silent = true })
  end,
  config = function(_, opts)
    require("markview").setup(opts)
    vim.cmd "Markview disableAll"
  end,
}
