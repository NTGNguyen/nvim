---@type NvPluginSpec
-- NOTE: Neovim plugin to animate the cursor with a smear effect in all terminals
return {
  "sphamba/smear-cursor.nvim",
  cond = false,
  event = "VeryLazy",
  opts = {
    -- Smear cursor when switching buffers or windows.
    smear_between_buffers = true,
    -- Smear cursor when moving within line or to neighbor lines.
    smear_between_neighbor_lines = false,
    -- Draw the smear in buffer space instead of screen space when scrolling
    scroll_buffer_space = false,
    -- Set to `true` if your font supports legacy computing symbols (block unicode symbols).
    -- Smears will blend better on all backgrounds.
    legacy_computing_symbols_support = false,
  },
  config = true,
}
