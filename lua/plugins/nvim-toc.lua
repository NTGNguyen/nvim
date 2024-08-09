---@type NvPluginSpec
return {
  "richardbizik/nvim-toc",
  cmd = {
    "TOCList",
    "TOC",
  },
  keys = {
    { "<leader>ml", "<cmd>TOCList<cr>", desc = "Markdown | List", ft = "markdown", silent = true },
    { "<leader>mn", "<cmd>TOC<cr>", desc = "Markdown | Number", ft = "markdown", silent = true },
  },
  opts = {
    toc_header = "TABLE OF CONTENTS",
  },
  config = function(_, opts)
    require("nvim-toc").setup(opts)
  end,
}
