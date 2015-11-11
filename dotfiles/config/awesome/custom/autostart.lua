-- {{{ Autostarts
-- xscreensaver
awful.util.spawn_with_shell("xscreensaver -nosplash")

-- Dropbox
awful.util.spawn_with_shell("dropbox start")

-- Emacs daemon
awful.util.spawn_with_shell('emacs --daemon')

-- Force keyboard layout
awful.util.spawn_with_shell(
   'setxkbmap -rules evdev -model evdev -layout us -variant altgr-intl'
)
--}}}
