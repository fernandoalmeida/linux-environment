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
require("custom/signals")
require("custom/bindings")
require("custom/autostart")
