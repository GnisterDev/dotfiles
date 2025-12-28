return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            hidden = true, -- Show hidden files
            -- For width, use layout:
            layout = {
              layout = {
                width = 25,
              },
            },
          },
        },
      },
      dashboard = {
        enabled = vim.fn.argc() == 0, -- Only enable when no args
        preset = {
          header = [[
██████╗ ███╗   ██╗██╗███████╗████████╗███████╗██████╗
██╔════╝ ████╗  ██║██║██╔════╝╚══██╔══╝██╔════╝██╔══██╗
██║  ███╗██╔██╗ ██║██║███████╗   ██║   █████╗  ██████╔╝
██║   ██║██║╚██╗██║██║╚════██║   ██║   ██╔══╝  ██╔══██╗
╚██████╔╝██║ ╚████║██║███████║   ██║   ███████╗██║  ██║
 ╚═════╝ ╚═╝  ╚═══╝╚═╝╚══════╝   ╚═╝   ╚══════╝╚═╝  ╚═╝
]],
        },
      },
    },
  },
}
