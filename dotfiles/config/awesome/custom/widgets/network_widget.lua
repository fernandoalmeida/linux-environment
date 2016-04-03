function network_widget()
   local widget = wibox.widget.textbox()

   vicious.register(
      widget,
      vicious.widgets.net,
      text_widget(
	 '<span color="#7F9F7F">${wlp7s0 up_kb}↑</span>  '..
	 '<span color="#CC9393">${wlp7s0 down_kb}↓</span>'
      ),
      3
   )

   return widget
end
