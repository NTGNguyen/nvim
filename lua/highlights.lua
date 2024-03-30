-- NOTE: NvChad Related Highlights
-- To find any highlight groups: "<cmd> Telescope highlights"
-- Each highlight group can take a table with variables fg, bg, bold, italic, etc
-- base30 variable names can also be used as colors

local M = {}

print("test")
---@type Base46HLGroupsList
M.override = {
  Comment = {
    italic = true,
  },
  Search = { fg = "black", bg = "blue" },
  IncSearch = { fg = "black", bg = "red" },
  CurSearch = { fg = "black", bg = "blue" },
  Substitute = { fg = "black", bg = "green" },
  NvDashAscii = { bg = "NONE", fg = "blue" },
  NvDashButtons = { bg = "NONE" },
  FoldColumn = { bg = "NONE" },
  LspReferenceRead = { link = "Underlined" },
  LspReferenceText = { link = "Underlined" },
  LspReferenceWrite = { link = "Underlined" },
  TblineFill = { link = "Normal" },
}

---@type HLTable
M.add = {
  WinBar = { link = "Normal" },
  WinBarNC = { link = "Normal" },
  NvimTreeOpenedFolderName = { fg = "green", bold = false },
  DiffviewDiffAdd = { fg = "black", bg = "green" },
  DiffviewDiffChange = { fg = "black", bg = "green" },
  DiffviewDiffDelete = { fg = "black", bg = "red" },
  DiffviewDiffAddAsDelete = { fg = "black", bg = "red" },
}

return M
