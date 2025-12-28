-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

-- Normal and visual mode: copy to system clipboard
vim.keymap.set({}, "<C-c>", '"+y', { noremap = true, silent = true })

-- Make normal and visual p/P paste from system clipboard (+ register)
vim.keymap.set({'n','v'}, 'p', '"+p', { noremap = true, silent = true })
vim.keymap.set({'n','v'}, 'P', '"+P', { noremap = true, silent = true })

-- Move lines up/down in normal mode
vim.keymap.set("n", "<M-Up>", function()
  vim.cmd("move .-2")
  vim.cmd("normal! ==")
end, { desc = "Move line up" })

vim.keymap.set("n", "<M-Down>", function()
  vim.cmd("move .+1")
  vim.cmd("normal! ==")
end, { desc = "Move line down" })

-- Move selection up/down in visual mode
vim.keymap.set("v", "<M-Up>", function()
  vim.cmd("move '<-2")
  vim.cmd("normal! gv=gv")
end, { desc = "Move selection up" })

vim.keymap.set("v", "<M-Down>", function()
  vim.cmd("move '>+1")
  vim.cmd("normal! gv=gv")
end, { desc = "Move selection down" })

-- Go to buffer 1-9 with Alt+number
local bufferline = require("bufferline")
for i = 1, 9 do
  vim.keymap.set("n", "<M-" .. i .. ">", function()
    bufferline.go_to(i, true)
  end, { desc = "Go to buffer " .. i })
end

-- Close buffer
vim.keymap.set("n", "<C-w>", function()
  local buf = vim.api.nvim_get_current_buf()
  -- Delete current buffer, keep window open
  vim.api.nvim_buf_delete(buf, { force = false })
end, { desc = "Close buffer" })
