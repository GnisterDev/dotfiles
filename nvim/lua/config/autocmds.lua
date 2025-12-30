-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

-- Set Kitty font size to 5 when entering Neovim
vim.api.nvim_create_autocmd("BufEnter", {
  callback = function()
    if vim.env.KITTY_LISTEN_ON then
      vim.system({
        "kitty",
        "@",
        "--to",
        vim.env.KITTY_LISTEN_ON,
        "set-font-size",
        "8.0",
      })
    end
  end,
})
-- Restore Kitty font size to 10 when leaving Neovim
vim.api.nvim_create_autocmd("VimLeavePre", {
  callback = function()
    if vim.env.KITTY_LISTEN_ON then
      vim.system({
        "kitty",
        "@",
        "--to",
        vim.env.KITTY_LISTEN_ON,
        "set-font-size",
        "10.0",
      })
    end
  end,
})
