/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/pipewire-media-session &
xrandr -r 170 
pactl load-module module-echo-cancel 
systemctl --user restart pipewire
pactl load-module module-echo-cancel source_name=default aec_method=webrtc

slstatus &
exec dwm
