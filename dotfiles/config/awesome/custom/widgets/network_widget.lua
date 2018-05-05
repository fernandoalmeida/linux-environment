function network_widget()
   local widget = wibox.widget.textbox()

   awful.spawn.easy_async(
      'bash -c "ip -f inet route | grep default | cut -d \' \' -f 5"',
      function(stdout, stderr, reason, exit_code)
	 local interface = stdout:gsub('[^a-zA-Z0-9]', '');

         vicious.register(
            widget,
            vicious.widgets.net,
            text_widget(
               '  <span color="#7F9F7F">${'.. interface ..' up_kb}↑</span>'..
               '  <span color="#CC9393">${'.. interface ..' down_kb}↓</span>'
            ),
            5
         )
      end
   )

   return widget
end
