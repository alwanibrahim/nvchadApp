local ls = require "luasnip"
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

return {
  s("rfc", {
    t "type Props = {};\n\n",
    t "export default function ",
    i(1, "Component"),
    t "({}: Props) {\n  return (\n    <div>\n      ",
    i(0),
    t "\n    </div>\n  );\n}",
  }),
}
