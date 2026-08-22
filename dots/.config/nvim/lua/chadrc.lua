--@type ChadrcConfig
local M = {}
M.base46 = {
  theme = "wallsync",
  transparency = true,
  hl_override = {
    -- TbFill = { bg = "base00", },
    -- TbBufOff = { bg = "base00", },
    -- TbBufOffClose = { bg = "base00" },
    -- NvimTreeNormal = { bg = "base00" },
    -- NvimTreeNormalNC = { bg = "base00" },
    -- NvimTreeCursorLine = { bg = "base00" },
    -- NormalFloat = { bg = "base00" },
    -- StatusLine = { bg = "base00" },
    Comment = { italic = true },
    ["@comment"] = { italic = true },
  },
}

M.nvdash = {
  header = { "  󰥳  " },
  load_on_startup = true,

}
M.ui = {
  telescope = { style = "borderless" }, -- borderless / bordered
  tabufline = {
    enabled = true,
    lazyload = true,
    treeOffsetFt = "NvimTree",
    order = { "buffers", "treeOffset" },
    modules = nil,
    bufwidth = 21,
  }
}

return M
