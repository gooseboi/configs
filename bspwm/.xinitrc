transmission-daemon &

nm-applet &
xrdb ~/.Xresources &
picom &
nitrogen ~/.config/wall.png &
flameshot &
fcitx -d &
dunst &
xbanish &
sxhkd &
xsetroot -cursor_name left_ptr &
xrdb -load ~/.config/X11/xresources &
xmodmap ~/.config/X11/xmodmap &

exec bspwm
