return {
  "L3MON4D3/LuaSnip",
  event = "InsertEnter",
  dependencies = {
    "rafamadriz/friendly-snippets",
  },
  config = function()
    local ls = require "luasnip"

    -- load vscode snippets (friendly + custom)
    require("luasnip.loaders.from_vscode").lazy_load()

    -- load custom vscode snippets
    require("luasnip.loaders.from_vscode").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/snippets" },
    }

    -- load lua snippets
    require("luasnip.loaders.from_lua").lazy_load {
      paths = { vim.fn.stdpath "config" .. "/lua/lua_snippets" },
    }

    ls.config.set_config {
      history = true,
      updateevents = "TextChanged,TextChangedI",
      delete_check_events = "TextChanged",
    }
  end,
}
