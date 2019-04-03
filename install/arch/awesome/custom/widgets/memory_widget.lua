function memory_widget()
   local widget = wibox.widget.textbox()

   vicious.register(
      widget,
      vicious.widgets.mem,
      text_widget("$2 MB")
   )

   return widget
end
