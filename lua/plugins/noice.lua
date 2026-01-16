return {
  "folke/noice.nvim",
  lazy = false,
  enabled = false,
  dependencies = {
    "MunifTanjim/nui.nvim",
    -- "rcarriga/nvim-notify",
  },

  opts = {
    messages = {
      enabled = true,
      view = "notify",
      view_error = "notify",
      view_warn = "notify",
      view_history = "messages",
    },

    notify = {
      enabled = true,
      view = "notify",
    },
    cmdline = {
      enabled = true,
      view = "cmdline_popup",

      opts = {
        position = {
          row = "5%", -- tengah atas (turunin kalau mau)
          col = "50%",
        },
        size = {
          width = 60,
          height = "auto",
        },
        border = {
          style = "rounded",
        },
      },

      format = {
        cmdline = { pattern = "^:", icon = "", lang = "vim" },

        search_down = {
          kind = "search",
          pattern = "^/",
          icon = " ",
          lang = "regex",
        },

        search_up = {
          kind = "search",
          pattern = "^%?",
          icon = " ",
          lang = "regex",
        },

        filter = {
          pattern = "^:%s*!",
          icon = "$",
          lang = "bash",
        },

        lua = {
          pattern = {
            "^:%s*lua%s+",
            "^:%s*lua%s*=%s*",
            "^:%s*=%s*",
          },
          icon = "",
          lang = "lua",
        },

        help = {
          pattern = "^:%s*he?l?p?%s+",
          icon = "",
        },

        input = {
          view = "cmdline_input",
          icon = "󰥻 ",
        },
      },
    },

    popupmenu = {
      enabled = true,
      backend = "nui",
    },

    lsp = {
      progress = { enabled = false },
      signature = { enabled = false },
      hover = { enabled = false },
      completion = { enabled = false },
    },

    routes = {
      {
        filter = { event = "msg_showmode" },
        opts = { skip = true },
      },
    },
  },
}
