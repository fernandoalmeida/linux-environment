gears = require("gears")
awful = require("awful")
wibox = require("wibox")
beautiful = require("beautiful")
naughty = require("naughty")
menubar = require("menubar")
awful.rules = require("awful.rules")
vicious = require("vicious")

require("awful.autofocus")
require("debian.menu")

terminal = "x-terminal-emulator"
editor = os.getenv("EDITOR") or "emacs"
editor_cmd = terminal .. " -e " .. editor
modkey = "Mod4"

-- Tags
names  = { " 1:web ", " 2:dev ", " 3:term ", " 4:chat ", " 5:play ", "6:other" }

layouts = {
   awful.layout.suit.fair,
   awful.layout.suit.tile,
   awful.layout.suit.max
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
