beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/wombat/theme.lua")

if beautiful.wallpaper then
   for s = 1, screen.count() do
      gears.wallpaper.maximized(beautiful.wallpaper, s, true)
   end
end

-- {{{ Borders
beautiful.border_width  = "2"
beautiful.border_normal = "#2d4113"
beautiful.border_focus  = "#a2bf36"
-- }}}

-- {{{ Titlebars
theme.bg_focus  = "#a2bf36"
theme.fg_focus  = "#000000"
-- }}}
