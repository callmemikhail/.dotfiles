/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
xrandr -r 170 
pactl load-module module-echo-cancel 
pactl load-module module-echo-cancel source_name=default aec_method=webrtc

exec dwm
