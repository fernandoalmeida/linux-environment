awful.rules.rules = {
    -- All clients will match this rule.
   {
      rule = { },
      properties = {
	 border_width = beautiful.border_width,
	 border_color = beautiful.border_normal,
	 focus = awful.client.focus.filter,
	 raise = true,
	 keys = awful.util.table,
	 buttons = awful.util.table
      }
   }
}
