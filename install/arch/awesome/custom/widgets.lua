-- {{{ Wibox
text_widget = function(value)
   local val = "<span color='#F9FFC4'>" .. value .. "</span>"
   local sep = "<span color='#447799'>  |  </span>"

   return val .. sep
end

require("custom/widgets/taglist_widget")
require("custom/widgets/tasklist_widget")
require("custom/widgets/date_widget")
require("custom/widgets/time_widget")
require("custom/widgets/battery_widget")
require("custom/widgets/memory_widget")
require("custom/widgets/cpu_widget")
require("custom/widgets/network_widget")
require("custom/widgets/temp_widget")
require("custom/widgets/layoutbox_widget")

mywibox = {}
mypromptbox = {}
mylayoutbox = {}

for s = 1, screen.count() do
   mypromptbox[s] = awful.widget.prompt()

   mywibox[s] = awful.wibox({ position = "top", screen = s })

   local left_layout = wibox.layout.fixed.horizontal()
   left_layout:add(mylauncher)
   left_layout:add(taglist_widget(s))
   left_layout:add(mypromptbox[s])
   left_layout:add(tasklist_widget(s))

   local right_layout = wibox.layout.fixed.horizontal()
   if s == 1 then
      right_layout:add(wibox.widget.systray())
   end
   -- right_layout:add(network_widget())
   -- right_layout:add(temp_widget())
   right_layout:add(cpu_widget())
   right_layout:add(memory_widget())
   right_layout:add(battery_widget())
   right_layout:add(date_widget())
   right_layout:add(time_widget(" BR: ", 0))
   right_layout:add(time_widget(" UK: ", 3))
   right_layout:add(layoutbox_widget(s))

    local layout = wibox.layout.align.horizontal()
    layout:set_left(left_layout)
    layout:set_right(right_layout)

    mywibox[s]:set_widget(layout)
end
-- }}}
