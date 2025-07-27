/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
xrandr -r 170 
pactl load-module module-echo-cancel 
pactl load-module module-echo-cancel source_name=default aec_method=webrtc
xrandr --output DisplayPort-1 --primary --mode 1920x1080 --rate 170.00 --output HDMI-A-0 --mode 1600x900 --right-of DisplayPort-1

exec dwm
