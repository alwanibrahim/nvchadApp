
return {
  "rcarriga/nvim-notify",
  lazy = false,

  opts = {
    stages = "static",  -- NO slomo
    timeout = 800,      -- cepat hilang
    render = "minimal",
    max_height = 5,
    max_width = 100,
    fps = 60,
  },

  init = function()
    vim.notify = require("notify")
  end,
}

