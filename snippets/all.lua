
local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node

ls.add_snippets("all", {
  s("makan", {
    t("🍽️ Makan teratur, minum air, fokus kerja."),
  }),
})


