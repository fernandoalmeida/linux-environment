function battery_widget()
   local widget = wibox.widget.textbox()

   vicious.register(
      widget,
      vicious.widgets.bat,
      text_widget("$1$2% $3h"),
      10,
      "BAT0"
   )

   return widget
end
