/usr/bin/pipewire &
/usr/bin/pipewire-pulse &
/usr/bin/wireplumber &
xrandr -r 170 
pactl load-module module-echo-cancel 
systemctl --user restart pipewire pipewire-audio 
pactl load-module module-echo-cancel source_name=default aec_method=webrtc

slstatus &
exec dwm
