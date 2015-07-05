-- {{{ Wibox
mytextclock = awful.widget.textclock()
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
   right_layout:add(mytextclock)
   right_layout:add(mylayoutbox[s])

   local layout = wibox.layout.align.horizontal()
   layout:set_left(left_layout)
   layout:set_right(right_layout)

   mywibox[s]:set_widget(layout)
end
-- }}}
