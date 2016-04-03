-- Date widget
function date_widget()
   local widget = wibox.widget.textbox()

   vicious.register(
      widget,
      vicious.widgets.date,
      text_widget("%a - %d/%m - %T"),
      1
   )

   return widget
end
