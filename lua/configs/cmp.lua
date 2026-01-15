
local cmp = require("cmp")

return {
  formatting = {
    format = function(entry, item)
      -- icon source
      item.menu = ({
        nvim_lsp = "[LSP]",
        buffer = "[BUF]",
        path = "[PATH]",
        luasnip = "[SNIP]",
      })[entry.source.name]

      return item
    end,
  },

  window = {
    documentation = cmp.config.window.bordered(),
  },

  experimental = {
    ghost_text = true,
  },
}
