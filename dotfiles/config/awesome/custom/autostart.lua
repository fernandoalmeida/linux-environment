-- {{{ Autostarts
function run_once(name, command)
   awful.util.spawn_with_shell(
      "pgrep " .. name .. " || (command -v " .. name .. " && " .. command .. ")"
   )
end

-- Setup keyboard
awful.util.spawn_with_shell('$HOME/.bashrc.d/utils/keyboard-setup.sh')

-- xscreensaver
run_once("xscreensaver", "xscreensaver -nosplash")

-- Dropbox
run_once("dropbox", "dropbox start")

-- Volume icon
run_once('volumeicon', 'volumeicon')

-- RescueTime
run_once("rescuetime", "rescuetime")
--}}}
