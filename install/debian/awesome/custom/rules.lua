clientkeys = awful.util.table.join(
   awful.key(
      { modkey, },
      "f",
      function (c)
	 c.fullscreen = not c.fullscreen
      end
   ),
   awful.key(
      { modkey, "Shift" },
      "c",
      function (c)
	 c:kill()
      end
   ),
   awful.key(
      { modkey, "Control" },
      "space",
      awful.client.floating.toggle
   ),
   awful.key(
      { modkey, "Control" },
      "Return",
      function (c)
	 c:swap(awful.client.getmaster())
      end
   ),
   awful.key(
      { modkey, },
      "o",
      awful.client.movetoscreen
   ),
   awful.key(
      { modkey, },
      "t",
      function (c)
	 c.ontop = not c.ontop
      end
   ),
   awful.key(
      { modkey, },
      "n",
      function (c)
	 c.minimized = true
      end
   ),
   awful.key(
      { modkey, },
      "m",
      function (c)
	 c.maximized_horizontal = not c.maximized_horizontal
	 c.maximized_vertical   = not c.maximized_vertical
      end
   )
)

clientbuttons = awful.util.table.join(
   awful.button(
      { },
      1,
      function (c)
	 client.focus = c;
	 c:raise()
      end
   ),
   awful.button(
      { modkey },
      1,
      awful.mouse.client.move
   ),
   awful.button(
      { modkey },
      3,
      awful.mouse.client.resize
   )
)

awful.rules.rules = {
   -- All clients will match this rule.
   {
      rule = { },
      properties = {
	 border_width = beautiful.border_width,
	 border_color = beautiful.border_normal,
	 focus = awful.client.focus.filter,
	 raise = true,
	 keys = clientkeys,
	 buttons = clientbuttons
      }
   }
}
