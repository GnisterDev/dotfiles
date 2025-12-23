vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.api.nvim_create_augroup('FileTypeIndent', { clear = true })

vim.api.nvim_create_autocmd('FileType', {
  group = 'FileTypeIndent',
  pattern = { 'python' },
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

vim.api.nvim_create_autocmd('FileType', {
  group = 'FileTypeIndent',
  pattern = { 'html', 'css', 'javascript', 'typescript', 'json', 'yaml' },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})