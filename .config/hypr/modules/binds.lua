
---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty"
local fileManager = "dolphin"
local menu        = "hyprlauncher"
local browser 	  = "floorp"
local discord 	  = "discord"
local menu        = "./.config/rofi/type-2/launcher.sh"




---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more


-- Apps

hl.bind(mainMod .. " + RETURN", hl.dsp.exec_cmd(terminal)) -- kitty
local closeWindowBind = hl.bind(mainMod .. " + Q", hl.dsp.window.close()) -- close selected window
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager)) -- thunar
hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd(menu), {release = true}) -- wofi launcher
-- hl.bind(mainMod .. " + SPACE", hl.dsp.exec_cmd("pkill rofi || rofi -show drun"), {release = true}) -- wofi launcher
hl.bind(mainMod .. " + A", hl.dsp.exec_cmd(browser)) -- floorp
hl.bind(mainMod .. " + Z", hl.dsp.exec_cmd("vivaldi")) -- vivaldi
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd("discord")) -- discord
hl.bind(mainMod .. " + SHIFT + P", hl.dsp.exec_cmd("hyprpicker")) -- color picker
hl.bind(mainMod .. " + I", hl.dsp.exec_cmd("kitty -e sh -c '~/.config/hypr/modules/shortcut.sh; exec $SHELL'")) -- show shortcut sheet

-- Windows
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ action = "toggle" })) -- fullscreen active window
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" })) -- change active window to floating
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle layout only
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'")) -- exit hyprland

-- To switch between windows in a floating workspace:
hl.bind("SUPER + Tab", function()
hl.dispatch(hl.dsp.window.cycle_next())    -- Change focus to another window
hl.dispatch(hl.dsp.window.bring_to_top()) -- Bring it to the top
end)


-- Print screen
hl.bind("print", hl.dsp.exec_cmd("hyprshot -m output -D 5")) -- print current screen after 5 seconds
hl.bind("SHIFT + print", hl.dsp.exec_cmd("hyprshot -m region")) -- print selected region of screen

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    end

-- Change workspace with touchpad swipe
    hl.gesture({ fingers = 3, direction = "horizontal", action = "workspace"})
    -- Move active window to the RIGHT workspace (Swipe Left)
    hl.gesture({
        fingers = 3,
        direction = "left",
        mods = "SUPER",
        action = function()
        hl.dispatch(hl.dsp.window.move({ workspace = "r+1" }))
        end
    })

    -- Move active window to the LEFT workspace (Swipe Right)
    hl.gesture({
        fingers = 3,
        direction = "right",
        mods = "SUPER",
        action = function()
        hl.dispatch(hl.dsp.window.move({ workspace = "r-1" }))
        end
    })

-- scroll the tape
hl.bind(mainMod .. "+ SHIFT + period", hl.dsp.layout("swapcol r"))  --
hl.bind(mainMod .. "+ SHIFT + comma", hl.dsp.layout("swapcol l"))
hl.bind(mainMod .. " + period", hl.dsp.layout("focus right"))
hl.bind(mainMod .. " + comma", hl.dsp.layout("focus left"))

-- Lock the screen
hl.bind(mainMod .. " + SHIFT + L", hl.dsp.exec_cmd("hyprlock"))

-- Reload waybar
hl.bind(mainMod .. "+ SHIFT + B", hl.dsp.exec_cmd("~/.config/waybar/launch.sh"))


-- Example special workspace (scratchpad)
    hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
    hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
    hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
    hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
    hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
    hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
    hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
    hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
    hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
    hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
    hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
    hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
    hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
    hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })


-- Blue light filter
hl.bind("CTRL + XF86MonBrightnessDown", hl.dsp.exec_cmd("~/.config/swaync/lightfilter.sh")) -- turn on and off


-- Change resolution 2K into fullHD and vice versa
hl.bind(mainMod .. " + CTRL + R", function()
if is_high_res then
    -- If res is 2560x1440, change to 1920x1080
    hl.monitor({
        output   = "eDP-1",
        mode     = "1920x1080@60",
        position = "0x0",
        scale    = 1
    })
    is_high_res = false
    else
        -- If res is 1920x1080, go back to 2560x1440
        hl.monitor({
            output   = "eDP-1",
            mode     = "2560x1440@60",
            position = "0x0",
            scale    = 1
        })
        is_high_res = true
        end
        end)


-- Change layout (dwindle, master, scrolling)
-- Define aviable layouts
local layouts = {"scrolling", "dwindle", "master" }

-- Function to change layout
local function toggle_layout()
-- Get current layout
local current = hl.get_config("general.layout")
local next_layout = layouts[1]

-- Get next layout
for i, layout in ipairs(layouts) do
    if layout == current then
        next_layout = layouts[(i % #layouts) + 1]
        break
        end
        end

-- Dynamically change layout
hl.config({ general = { layout = next_layout } })
end

-- Bind to change layout - SUPER + CTRL + M
hl.bind(mainMod .. " + CTRL + M", toggle_layout)


hl.bind(mainMod .. " + O", hl.dsp.exec_cmd("notify-send Hello"))
