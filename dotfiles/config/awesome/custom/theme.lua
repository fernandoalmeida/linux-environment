beautiful.init(os.getenv("HOME") .. "/.config/awesome/themes/wombat/theme.lua")

if beautiful.wallpaper then
   for s = 1, screen.count() do
      gears.wallpaper.maximized(beautiful.wallpaper, s, true)
   end
end
