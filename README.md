![preview](https://github.com/skafiend/polybar-cmus/blob/main/preview.png)

- config.ini
```
[module/cmus]
[module/cmus]
type = custom/script
exec = ~/.config/polybar/cmus.sh
exec-if = pgrep -x cmus
interval = 1
tail = true
click-left = cmus-remote --pause
click-right = pkill -f cmus
scroll-up = cmus-remote --volume +5%
scroll-down = cmus-remote --volume -5%
```
