gears = require("gears")
awful = require("awful")
wibox = require("wibox")
beautiful = require("beautiful")
naughty = require("naughty")
menubar = require("menubar")
awful.rules = require("awful.rules")
vicious = require("vicious")

require("awful.autofocus")

terminal = "urxvt"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

-- Tags
names  = { " web ", " dev ", " term ", " chat ", " play ", " other " }

layouts = {
   awful.layout.suit.max,
   awful.layout.suit.floating,
   awful.layout.suit.tile,
   awful.layout.suit.fair
}

tags = {}
for s = 1, screen.count() do
   tags[s] = awful.tag(names, s, layouts[1])
end

require("custom/debug")
require("custom/theme")
require("custom/menu")
require("custom/widgets")
require("custom/signals")
require("custom/bindings")
require("custom/autostart")
