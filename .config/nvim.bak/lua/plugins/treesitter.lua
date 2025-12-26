return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  main = 'nvim-treesitter.config', -- This tells Lazy to look here for the .setup()
  opts = {
    ensure_installed = { 'help', 'lua', 'python', 'javascript', 'typescript', 'rust', 'go' },
    highlight = { enable = true },
  },
}