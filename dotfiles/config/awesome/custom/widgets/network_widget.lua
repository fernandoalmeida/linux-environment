function network_widget()
   local widget = wibox.widget.textbox()
   local interface = awful.util.pread(
      "ip -f inet route | awk '/default/ { print $5 }'"
   ):gsub("[^a-za-Z0-9]", "")

   vicious.register(
      widget,
      vicious.widgets.net,
      text_widget(
	 '  <span color="#7F9F7F">${'.. interface ..' up_kb}↑</span>'..
	 '  <span color="#CC9393">${'.. interface ..' down_kb}↓</span>'
      ),
      3
   )

   return widget
end
