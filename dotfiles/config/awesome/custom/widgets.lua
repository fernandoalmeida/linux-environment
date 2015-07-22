-- {{{ Wibox
text_widget = function(label, value)
   local sep = "<span color='#447799'>  |  </span>"
   local key = "<span color='#9EBABA'>" .. label .. "</span>"
   local val = "<span color='#F9FFC4'>" .. value .. "</span>"

   return key .. val .. sep
end

-- Date widget
date_widget = wibox.widget.textbox()
vicious.register(
   date_widget,
   vicious.widgets.date,
   text_widget("", "%a - %d/%m - %T"),
   1
)

-- Battery widget
local bat_widget = wibox.widget.textbox()
vicious.register(
   bat_widget,
   vicious.widgets.bat,
   text_widget("BAT: ", "$1$2% $3h"),
   10,
   "BAT0"
)

-- Memory widget
memory_widget = wibox.widget.textbox()
vicious.register(
   memory_widget,
   vicious.widgets.mem,
   text_widget("MEM: ", "$2 MB")
)

-- CPU widget
cpu_widget = wibox.widget.textbox()
vicious.register(
   cpu_widget,
   vicious.widgets.cpu,
   text_widget("CPU: ", string.format("%2s%%", "$1"))
)

-- Volume widget
volume_widget = wibox.widget.textbox()
vicious.register(
   volume_widget,
   vicious.widgets.volume,
   text_widget("VOL: ", "$1"),
   0.3,
   "Master"
)

-- Network widget
 net_widget = wibox.widget.textbox()
 vicious.register(
    net_widget,
    vicious.widgets.net,
    text_widget(
       "  NET: ",
       '<span color="#7F9F7F">${wlan0 up_kb}↑</span>  '..
       '<span color="#CC9393">${wlan0 down_kb}↓</span>'
    ),
    3
 )

mywibox = {}
mypromptbox = {}
mylayoutbox = {}
mytaglist = {}
mytaglist.buttons = awful.util.table.join(
   awful.button({}, 1, awful.tag.viewonly),
   awful.button({ modkey }, 1, awful.client.movetotag),
   awful.button({}, 3, awful.tag.viewtoggle),
   awful.button({ modkey }, 3, awful.client.toggletag),
   awful.button(
      {},
      4,
      function(t)
         awful.tag.viewnext(awful.tag.getscreen(t))
      end
   ),
   awful.button(
      {},
      5,
      function(t)
         awful.tag.viewprev(awful.tag.getscreen(t))
      end
   )
)

for s = 1, screen.count() do
   mypromptbox[s] = awful.widget.prompt()
   mylayoutbox[s] = awful.widget.layoutbox(s)
   mylayoutbox[s]:buttons(
      awful.util.table.join(
         awful.button(
            {},
            1,
            function ()
               awful.layout.inc(layouts, 1)
            end
         ),
         awful.button(
            {},
            3,
            function ()
               awful.layout.inc(layouts, -1)
            end
         ),
         awful.button(
            {},
            4,
            function ()
               awful.layout.inc(layouts, 1)
            end
         ),
         awful.button(
            {},
            5,
            function ()
               awful.layout.inc(layouts, -1)
            end
         )
      )
			 )

   mytaglist[s] = awful.widget.taglist(
      s,
      awful.widget.taglist.filter.all,
      mytaglist.buttons
   )

   mywibox[s] = awful.wibox({ position = "top", screen = s })

   local left_layout = wibox.layout.fixed.horizontal()
   left_layout:add(mylauncher)
   left_layout:add(mytaglist[s])
   left_layout:add(mypromptbox[s])

   local right_layout = wibox.layout.fixed.horizontal()
   if s == 1 then
      right_layout:add(wibox.widget.systray())
   end
   right_layout:add(net_widget)
   right_layout:add(cpu_widget)
   right_layout:add(memory_widget)
   right_layout:add(bat_widget)
   right_layout:add(volume_widget)
   right_layout:add(date_widget)
   right_layout:add(mylayoutbox[s])

   local layout = wibox.layout.align.horizontal()
   layout:set_left(left_layout)
   layout:set_right(right_layout)

   mywibox[s]:set_widget(layout)
end
-- }}}
