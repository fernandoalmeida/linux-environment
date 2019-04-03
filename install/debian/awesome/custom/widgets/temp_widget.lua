function temp_widget()
   local widget = wibox.widget.textbox()

   vicious.register(
      widget,
      vicious.widgets.thermal,
      text_widget(string.format("$1°С")),
      37,
      "thermal_zone0"
   )

   return widget
end
