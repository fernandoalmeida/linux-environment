-- {{{ Autostarts
function run_once(name, command)
   awful.util.spawn_with_shell(
      "ps faux | grep '" .. name .. "' | grep -v grep || (command -v " .. name .. " && " .. command .. ")"
   )
end

-- Setup keyboard
awful.util.spawn_with_shell('$HOME/.bashrc.d/utils/setup-abnt-keyboard.sh')
awful.util.spawn_with_shell('$HOME/.bashrc.d/utils/setup-international-keyboard.sh')

-- xscreensaver
run_once("xscreensaver", "xscreensaver -nosplash")

-- Dropbox
awful.util.spawn_with_shell('$HOME/.dropbox-dist/dropboxd')

-- RescueTime
run_once("rescuetime", "rescuetime")

-- Bluetooth Manager
run_once('blueberry-tray', 'blueberry-tray')

-- Sound Switcher
run_once('indicator-sound-switcher', 'indicator-sound-switcher')

-- Volume control
run_once('volumeicon', 'volumeicon')

-- Toggl
-- run_once('toggldesktop', 'toggldesktop')
--}}}
