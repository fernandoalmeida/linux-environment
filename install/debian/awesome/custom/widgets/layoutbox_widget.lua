function layoutbox_widget(s)
   local widget = awful.widget.layoutbox(s)

   widget:buttons(
      awful.util.table.join(
         awful.button(
            {},
            1,
            function ()
               awful.layout.inc(layouts, 1)
            end
         ),
         awful.button(
            {},
            3,
            function ()
               awful.layout.inc(layouts, -1)
            end
         ),
         awful.button(
            {},
            4,
            function ()
               awful.layout.inc(layouts, 1)
            end
         ),
         awful.button(
            {},
            5,
            function ()
               awful.layout.inc(layouts, -1)
            end
         )
      )
   )

   return widget
end
