function cpu_widget()
   local widget = wibox.widget.textbox()

   vicious.register(
      widget,
      vicious.widgets.cpu,
      text_widget(string.format("%2s%%", "$1"))
   )

   return widget
end
