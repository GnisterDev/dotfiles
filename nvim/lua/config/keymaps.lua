local keymap = vim.keymap

-- Set leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Better indenting
keymap.set("v", "<", "<gv")
keymap.set("v", ">", ">gv")

-- Move lines
keymap.set("n", "<A-j>", "<cmd>m .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", "<cmd>m .-2<CR>==", { desc = "Move line up" })
keymap.set("v", "<A-j>", ":m '>+1<CR>gv=gv", { desc = "Move line down" })
keymap.set("v", "<A-k>", ":m '<-2<CR>gv=gv", { desc = "Move line up" })