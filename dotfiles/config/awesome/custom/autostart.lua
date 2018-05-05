-- {{{ Autostarts
-- xscreensaver
awful.util.spawn_with_shell("xscreensaver -nosplash")

-- Dropbox
awful.util.spawn_with_shell("dropbox start")


-- Setup keyboard
awful.util.spawn_with_shell('keyboard-setup')

-- RescueTime
awful.util.spawn_with_shell("rescuetime")
--}}}
