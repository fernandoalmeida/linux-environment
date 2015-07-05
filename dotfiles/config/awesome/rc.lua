local gears = require("gears")
awful = require("awful")
local wibox = require("wibox")
local beautiful = require("beautiful")
local naughty = require("naughty")
local menubar = require("menubar")

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

local layouts = {
   awful.layout.suit.tile,
   awful.layout.suit.fair,
   awful.layout.suit.max
}
-- }}}

-- {{{ Tags
tags = {}
for s = 1, screen.count() do
   tags[s] = awful.tag({ 1, 2, 3, 4 }, s, layouts[1])
end
-- }}}

-- {{{ Menu
myawesomemenu = {
   { "manual", terminal .. " -e man awesome" },
   { "edit config", editor_cmd .. " " .. awesome.conffile },
   { "restart", awesome.restart },
   { "quit", awesome.quit }
}

mymainmenu = awful.menu(
   {
      items = {
         { "Emacs", "emacs" },
         { "Bash", terminal },
         { "Firefox", "firefox" },
         { "Spotify", "spotify" },
         { "", nil },
         { "Debian", debian.menu.Debian_menu.Debian },
         { "Awesome", myawesomemenu, beautiful.awesome_icon },
         { "", nil },
         { "screen lock", "xscreensaver-command -lock" },
         { "logout", awesome.quit },
         { "", nil },
         { "suspend", "suspend" },
         { "reboot", "shutdown -r now" },
         { "shutdown", "shutdown -h now" }
      }
   }
)

mylauncher = awful.widget.launcher(
   {
      image = beautiful.awesome_icon,
      menu = mymainmenu
   }
)

menubar.utils.terminal = terminal
-- }}}

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

-- {{{ Mouse bindings
root.buttons(
   awful.util.table.join(
      awful.button(
         {},
         3,
         function ()
            mymainmenu:toggle()
         end
      ),
      awful.button(
         {},
         4,
         awful.tag.viewnext
      ),
      awful.button(
         {},
         5,
         awful.tag.viewprev
      )
   )
)
-- }}}

-- {{{ Key bindings
globalkeys = awful.util.table.join(
   awful.key(
      { modkey,           },
      "Left",
      awful.tag.viewprev
   ),
   awful.key(
      { modkey,           },
      "Right",
      awful.tag.viewnext
   ),
   awful.key(
      { modkey,           },
      "Escape",
      awful.tag.history.restore
   ),
   awful.key(
      { modkey,           },
      "/",
      function ()
         mymainmenu:toggle()
      end
   ),
   awful.key(
      { modkey, "Control" },
      "l",
      function ()
         awful.util.spawn("xscreensaver-command -lock")
      end
   ),
   awful.key(
      { modkey,           },
      "j",
      function ()
         awful.client.focus.byidx( 1)
         if client.focus then
            client.focus:raise()
         end
      end
   ),
   awful.key({ modkey,           },
      "k",
      function ()
         awful.client.focus.byidx(-1)
         if client.focus then
            client.focus:raise()
         end
      end
   ),
   awful.key(
      { modkey,           },
      "w",
      function ()
         mymainmenu:show()
      end
   ),

   -- Layout manipulation
   awful.key(
      { modkey, "Shift"   },
      "j",
      function ()
         awful.client.swap.byidx(  1)
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "k",
      function ()
         awful.client.swap.byidx( -1)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "j",
      function ()
         awful.screen.focus_relative( 1)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "k",
      function ()
         awful.screen.focus_relative(-1)

      end

   ),
   awful.key(
      { modkey,           },
      "u",
      awful.client.urgent.jumpto
   ),
   awful.key(
      { modkey,           },
      "Tab",
      function ()
         awful.client.focus.history.previous()
         if client.focus then
            client.focus:raise()
         end
      end
   ),

   -- Standard program
   awful.key(
      { modkey,           },
      "Return",
      function ()
         awful.util.spawn(terminal)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "r",
      awesome.restart
   ),
   awful.key(
      { modkey, "Shift"   },
      "q",
      awesome.quit
   ),

   awful.key(
      { modkey,           },
      "l",
      function ()
         awful.tag.incmwfact( 0.05)
      end
   ),
   awful.key(
      { modkey,           },
      "h",
      function ()
         awful.tag.incmwfact(-0.05)
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "h",
      function ()
         awful.tag.incnmaster( 1)
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "l",
      function ()
         awful.tag.incnmaster(-1)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "h",
      function ()
         awful.tag.incncol( 1)
      end
   ),
   awful.key(
      { modkey, "Control" },
      "l",
      function ()
         awful.tag.incncol(-1)
      end
   ),
   awful.key(
      { modkey,           },
      "space",
      function ()
         awful.layout.inc(layouts,  1)
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "space",
      function ()
         awful.layout.inc(layouts, -1)
      end
   ),

   awful.key(
      { modkey, "Control" },
      "n",
      awful.client.restore
   ),

   -- Prompt
   awful.key(
      { modkey },
      "r",
      function ()
         mypromptbox[mouse.screen]:run()
      end
   ),

   awful.key(
      { modkey },
      "x",
      function ()
         awful.prompt.run(
            { prompt = "Run Lua code: " },
            mypromptbox[mouse.screen].widget,
            awful.util.eval, nil,
            awful.util.getdir("cache") .. "/history_eval"
         )
      end
   ),

   -- Menubar
   awful.key(
      { modkey },
      "p",
      function()
         menubar.show()
      end
   )
)

clientkeys = awful.util.table.join(
   awful.key(
      { modkey, },
      "f",
      function (c)
         c.fullscreen = not c.fullscreen
      end
   ),
   awful.key(
      { modkey, "Shift"   },
      "c",
      function (c)
         c:kill()
      end
   ),
   awful.key(
      { modkey, "Control" },
      "space",
      awful.client.floating.toggle
   ),
   awful.key(
      { modkey, "Control" },
      "Return",
      function (c)
         c:swap(awful.client.getmaster())
      end
   ),
   awful.key(
      { modkey,           },
      "o",
      awful.client.movetoscreen
   ),
   awful.key(
      { modkey,           },
      "t",
      function (c)
         c.ontop = not c.ontop
      end
   ),
   awful.key(
      { modkey,           },
      "n",
      function (c)
         c.minimized = true
      end
   ),
   awful.key(
      { modkey,           },
      "m",
      function (c)
         c.maximized_horizontal = not c.maximized_horizontal
         c.maximized_vertical   = not c.maximized_vertical
      end
   )
)

-- Bind all key numbers to tags.
for i = 1, 9 do
   globalkeys = awful.util.table.join(
      globalkeys,
      -- View tag only.
      awful.key(
         { modkey },
         "#" .. i + 9,
         function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
               awful.tag.viewonly(tag)
            end
         end
      ),
      -- Toggle tag.
      awful.key(
         { modkey, "Control" },
         "#" .. i + 9,
         function ()
            local screen = mouse.screen
            local tag = awful.tag.gettags(screen)[i]
            if tag then
               awful.tag.viewtoggle(tag)
            end
         end
      ),
      -- Move client to tag.
      awful.key(
         { modkey, "Shift" },
         "#" .. i + 9,
         function ()
            if client.focus then
               local tag = awful.tag.gettags(client.focus.screen)[i]
               if tag then
                  awful.client.movetotag(tag)
               end
            end
         end
      ),
      -- Toggle tag.
      awful.key(
         { modkey, "Control", "Shift" },
         "#" .. i + 9,
         function ()
            if client.focus then
               local tag = awful.tag.gettags(client.focus.screen)[i]

               if tag then
                  awful.client.toggletag(tag)
               end
            end
         end
      )
   )
end

clientbuttons = awful.util.table.join(
   awful.button(
      { },
      1,
      function (c)
         client.focus = c; c:raise()
      end
   ),
   awful.button(
      { modkey },
      1,
      awful.mouse.client.move
   ),
   awful.button(
      { modkey },
      3,
      awful.mouse.client.resize
   )
)

-- Set keys
root.keys(globalkeys)
-- }}}

-- {{{ Rules
awful.rules.rules = {
   {
      rule = {},
      properties = {
         border_width = beautiful.border_width,
         border_color = beautiful.border_normal,
         focus = awful.client.focus.filter,
         raise = true,
         keys = clientkeys,
         buttons = clientbuttons
      }
   },
   {
      rule = {
         class = "Firefox"
      },
      properties = {
         tag = tags[1][1]
      }
   }
}
-- }}}

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

require("custom/autostart")
