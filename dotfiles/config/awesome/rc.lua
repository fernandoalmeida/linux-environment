local gears = require("gears")
awful = require("awful")
wibox = require("wibox")
beautiful = require("beautiful")
local naughty = require("naughty")
menubar = require("menubar")

awful.rules = require("awful.rules")
require("awful.autofocus")
require("debian.menu")

-- {{{ Error handling
if awesome.startup_errors then
   naughty.notify(
      {
         preset = naughty.config.presets.critical,
         title = "Oops, there were errors during startup!",
         text = awesome.startup_errors
      }
   )
end

do
   local in_error = false
   awesome.connect_signal(
      "debug::error",
      function (err)
         if in_error then return end
         in_error = true

         naughty.notify(
            {
               preset = naughty.config.presets.critical,
               title = "Oops, an error happened!",
               text = err
            }
         )
         in_error = false
      end
   )
end
-- }}}

-- {{{ Theme
beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/bamboo/theme.lua")

if beautiful.wallpaper then
   for s = 1, screen.count() do
      gears.wallpaper.maximized(beautiful.wallpaper, s, true)
   end
end
-- }}}

-- {{{ Variable definitions
terminal = "x-terminal-emulator"

editor = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. editor

modkey = "Mod4"

layouts = {
   awful.layout.suit.tile,
   awful.layout.suit.fair,
   awful.layout.suit.max
}

tags = {}
for s = 1, screen.count() do
   tags[s] = awful.tag({ 1, 2, 3, 4 }, s, layouts[1])
end
-- }}}

require("custom/menu")
require("custom/widgets")
require("custom/rules")

-- {{{ Signals
client.connect_signal(
   "manage",
   function (c, startup)
      c:connect_signal(
         "mouse::enter",
         function(c)
            if awful.layout.get(c.screen) ~= awful.layout.suit.magnifier
            and awful.client.focus.filter(c) then
               client.focus = c
            end
         end
      )

      if not startup then
         if not c.size_hints.user_position and not c.size_hints.program_position
         then
            awful.placement.no_overlap(c)
            awful.placement.no_offscreen(c)
         end
      end

      local titlebars_enabled = false
      if titlebars_enabled and (c.type == "normal" or c.type == "dialog") then
         local buttons = awful.util.table.join(
            awful.button(
               {},
               1,
               function()
                  client.focus = c
                  c:raise()
                  awful.mouse.client.move(c)
               end
            ),
            awful.button(
               {},
               3,
               function()
                  client.focus = c
                  c:raise()
                  awful.mouse.client.resize(c)
               end
            )
         )

         -- Widgets that are aligned to the left
         local left_layout = wibox.layout.fixed.horizontal()
         left_layout:add(awful.titlebar.widget.iconwidget(c))
         left_layout:buttons(buttons)

         -- Widgets that are aligned to the right
         local right_layout = wibox.layout.fixed.horizontal()
         right_layout:add(awful.titlebar.widget.floatingbutton(c))
         right_layout:add(awful.titlebar.widget.maximizedbutton(c))
         right_layout:add(awful.titlebar.widget.stickybutton(c))
         right_layout:add(awful.titlebar.widget.ontopbutton(c))
         right_layout:add(awful.titlebar.widget.closebutton(c))

         -- The title goes in the middle
         local middle_layout = wibox.layout.flex.horizontal()
         local title = awful.titlebar.widget.titlewidget(c)
         title:set_align("center")
         middle_layout:add(title)
         middle_layout:buttons(buttons)

         -- Now bring it all together
         local layout = wibox.layout.align.horizontal()
         layout:set_left(left_layout)
         layout:set_right(right_layout)
         layout:set_middle(middle_layout)

         awful.titlebar(c):set_widget(layout)
      end
   end
)

client.connect_signal(
   "focus",
   function(c)
      c.border_color = beautiful.border_focus
   end
)

client.connect_signal(
   "unfocus",
   function(c)
      c.border_color = beautiful.border_normal
   end
)
-- }}}

require("custom/bindings")
require("custom/autostart")
