
return {
  {
    "folke/which-key.nvim",
    opts = {
      preset = "helix", -- mirip LazyVim
      delay = 300,

      plugins = {
        marks = false,
        registers = false,
        spelling = { enabled = false },
      },

      win = {
        border = "rounded",
        padding = { 1, 2 },
        title = false,
      },

      layout = {
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "left",
      },

      icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
      },

      show_help = false,
      show_keys = false,
    },
  },
}
