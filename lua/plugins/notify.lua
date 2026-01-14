
return {
  "rcarriga/nvim-notify",
  lazy = false,
  opts = {
    stages = "static", -- ⬅️ jangan animasi
    timeout = 1500,
    max_height = 10,
    max_width = 60,
    render = "minimal",
  },
  config = function()
    local notify = require("notify")
    notify.setup({
      stages = "fade",
      timeout = 3000,
    })
    vim.notify = notify
  end,
}

