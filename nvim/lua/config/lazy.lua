-- Bootstrap lazy.nvim

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)

-- lua/config/lazy.lua
require("lazy").setup({
  -- Import all plugin specs from lua/plugins
  -- This will automatically load all .lua files in plugins/ and its subdirectories
  spec = {
    { import = "plugins.coding" },
    { import = "plugins.colorscheme" },
    { import = "plugins.editor" },
    { import = "plugins.extras" },
    { import = "plugins.formatting" },
    { import = "plugins.linting" },
    { import = "plugins.lsp" },
    { import = "plugins.treesitter" },
    { import = "plugins.ui" },
    { import = "plugins.util" },
  },
  defaults = {
    lazy = false, -- Plugins will not be lazy-loaded by default
    version = false, -- Always use the latest git commit
  },
  install = { colorscheme = { "tokyonight" } },
  checker = { enabled = true }, -- Automatically check for plugin updates
  performance = {
    rtp = {
      -- Disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})