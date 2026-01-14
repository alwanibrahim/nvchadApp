
return {
  "folke/noice.nvim",
  lazy = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  opts = {
    messages = {
      enabled = true,
    },
    notify = {
      enabled = true,
    },

    cmdline = {
      enabled = true,
      view = "cmdline_popup",
      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },
        search_down = { pattern = "^/", icon = "", lang = "regex" },
        search_up = { pattern = "^%?", icon = "", lang = "regex" },
      },
    },

    popupmenu = {
      enabled = true,
      backend = "nui",
    },

    routes = {
      {
        filter = { event = "msg_showmode" },
        opts = { skip = true },
      },
    },
  },
}

