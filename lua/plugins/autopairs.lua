-- File: lua/plugins/nvim-autopairs.lua
return {
  "windwp/nvim-autopairs",
  event = "InsertEnter",
  config = function()
    local npairs = require("nvim-autopairs")
    npairs.setup({
      check_ts = true, -- enable treesitter
      ts_config = {
        lua = { "string" },
        javascript = { "template_string" },
        tsx = { "jsx_element", "jsx_self_closing_element" },
      },
      fast_wrap = {}, -- ALT+e untuk wrap
    })
  end,
}
