local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    javascript = { "prettier" },
    typescript = { "prettier" },
    sh = { "shfmt" },
    c = { "clang_format" },
    cpp = { "clang_format" },
  },
}

return options
