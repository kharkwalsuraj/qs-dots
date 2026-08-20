require "nvchad.mappings"

local map = vim.keymap.set
local nomap = vim.keymap.del

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")


map({"n", "i"}, "<A-j>", ":m .+1<CR>==", { desc = "Move line down" })
map({"n","i"}, "<A-k>", ":m .-2<CR>==", { desc = "Move line up" })

map("n", "<leader>ch", "<CMD>e ~/.local/share/nvim/lazy/NvChad/lua/nvchad/mappings.lua <CR>",
  { desc = "Goat's Cheatsheet" })
map("n", "<leader>e", "<cmd>NvimTreeToggle<CR>", { desc = "Nvimtree toggle window" })
map("n", "<leader><leader>", "<cmd>Telescope find_files<cr>", { desc = "Telescope find files" })

nomap("n", "<C-n>")
nomap({ "n", "v" }, "<leader>/")


nomap({ "n", "t" }, "<A-h>")
nomap({ "n", "t" }, "<A-v>")

map({ "n", "t" }, "<leader>v", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm" }
end, { desc = "terminal toggleable vertical term" })

map({ "n", "t" }, "<leader>h", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm" }
end, { desc = "terminal toggleable horizontal term" })
