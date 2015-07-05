-- {{{ Rules
awful.rules.rules = {
   {
      rule = {},
      properties = {
         border_width = beautiful.border_width,
         border_color = beautiful.border_normal,
         focus = awful.client.focus.filter,
         raise = true,
         keys = clientkeys,
         buttons = clientbuttons
      }
   },
   {
      rule = {
         class = "Firefox"
      },
      properties = {
         tag = tags[1][1]
      }
   }
}
-- }}}
