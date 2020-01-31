-- Date widget

function time_widget(prefix, offset)
   local widget = wibox.widget.textbox()

   vicious.register(
      widget,
      function(_)
         local time = os.date("%H:%M:%S ", os.time() + offset * 60 * 60)
         widget:set_text(prefix .. time)
      end,
      nil,
      1
   )

   return widget
end
