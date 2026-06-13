-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
hl.on("hyprland.start", function () 
   hl.exec_cmd("waybar & swaync")
   hl.exec_cmd("nm-applet --indicator")
--   hl.exec_cmd("kitty -e sh -c '~/.config/hypr/modules/shortcut.sh; exec $SHELL'")
   hl.exec_cmd("hyprsunset & hyprpaper & hypridle")
   hl.dispatch(hl.dsp.exec_cmd([[notify-send "SUPER + I" "Keybinds sheet"]]))
end)
