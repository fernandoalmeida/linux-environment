function volume_widget()
   local widget = wibox.widget.textbox()

   vicious.register(
      widget,
      vicious.widgets.volume,
      text_widget("$1"),
      0.3,
      "Master"
   )

   return widget
end
