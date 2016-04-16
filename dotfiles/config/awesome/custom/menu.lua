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
         { "Conkeror", "conkeror" },
         { "Spotify", "spotify" },
         { "", nil },
         { "Debian", debian.menu.Debian_menu.Debian },
         { "Awesome", myawesomemenu, beautiful.awesome_icon },
         { "", nil },
         { "screen lock", "xscreensaver-command -lock" },
         { "logout", awesome.quit },
         { "", nil },
         { "suspend", "sudo systemctl suspend" },
         { "hibernate", "sudo systemctl hibernate" },
         { "reboot", "sudo systemctl reboot" },
         { "shutdown", "sudo systemctl poweroff" }
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
