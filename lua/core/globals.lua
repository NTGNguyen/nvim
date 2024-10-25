-- NOTE: Global Variables
local sysname = vim.uv.os_uname().sysname
local os = sysname:match "Windows" and "Windows" or sysname:match "Linux" and "Linux" or sysname -- Windows, Linux, Darwin, NetBSD,...

local global = {
  markdown_recommended_style = 0, -- Disable recommend style to make tab space 2 in markdown
  mkdp_auto_close = false, -- Don't Exit Preview When Switching Buffers
  snipmate_snippets_path = vim.fn.stdpath "config" .. "/snippets/snipmate", -- path to snipmate snippets
  vscode_snippets_path = vim.fn.stdpath "config" .. "/snippets/vscode", -- path to vscode snippets
  startup_message = false, -- Show startup message
  random_header = false, -- Show random header
  skip_ts_context_commentstring_module = true, -- disable treesitter context commentstring
  toggle_cmp = true, -- enable nvim-cmp
  ["loaded_node_provider"] = 0, -- disable node provider
  ["loaded_python3_provider"] = 0, -- disable python3 provider
  ["loaded_perl_provider"] = 0, -- disable perl provider
  ["loaded_ruby_provider"] = 0, -- disable ruby provider
  toggle_theme_icon = "   ",
  base46_cache = vim.fn.stdpath "data" .. "/nvchad/base46/",
  border_enabled = true, -- NOTE: Toggle border for LSP Windows, nvim-cmp, lazy, which-key, mason
  mapleader = " ",
  maplocalleader = "\\",
  bigfile_size = 1024 * 1024 * 1.5, -- 1.5 MB
  disable_autoformat = false,
  os = os,
  path_delimiter = os == "Windows" and ";" or ":",
  path_separator = os == "Windows" and "\\" or "/",
}

for name, value in pairs(global) do
  vim.g[name] = value
end
