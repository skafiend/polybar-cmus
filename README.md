# polybar-cmus

- config.ini

[module/cmus]
type = custom/script
exec = ~/.config/polybar/cmus.sh
exec-if = pgrep -x cmus
interval = 1
tail = true
label-foreground = ${colors.primary}
