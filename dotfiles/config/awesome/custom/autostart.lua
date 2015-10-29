-- {{{ Autostarts
-- xscreensaver
awful.util.spawn_with_shell("xscreensaver -nosplash")

-- Dropbox
awful.util.spawn_with_shell("dropbox start")

-- Emacs daemon
awful.util.spawn_with_shell('emacs --daemon')
--}}}
