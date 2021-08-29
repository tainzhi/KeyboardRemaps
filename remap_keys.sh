#!/bin/bash
# remaps keys:
# Return to ctrl when held, to return when released
# CapsLock to ctrl when held, to Esc when released
# left Ctrl to CapsLock
#
# 
# depends xmodmap xcape
# https://github.com/alols/xcape

# referencs: https://www.reddit.com/r/vim/comments/4d6iym/what_do_you_all_do_with_caps_lock_control_and/
# https://www.emacswiki.org/emacs/MovingTheCtrlKey#h5o-5
# https://wiki.archlinux.org/title/Xmodmap#Keymap_table
# https://www.cnblogs.com/yinheyi/p/10146900.html
# https://my.oschina.net/swanf/blog/1549976

# This is read into window managers as follows:

# - exwm: in .xession

# - i3: in ~/.config/i3/config

# - xfce4: not done yet...

# clear all mappings:
setxkbmap -option '' # That's 2 single quotes...
# reset xcape
killall xcape

# Set basic keyboard variant (gb mac)
# Caps Lock to
# 1. Escape when tapped
# 2. Ctrl when held

# gb is layout US keyboard
# setxkbmap -layout gb -option caps:ctrl_modifier level3:rwin terminate:ctrl_alt_bksp compose:prsc 
# xcape -e 'Caps_Lock=Escape'
setxkbmap -option ctrl:swapcaps
xcape -e 'Control_L=Escape'

# assign return to control on press, return on release

# remove all modiiers fun, shift/lock/control/mod1/mod2/mod3/mo4/mod5
xmodmap -e 'clear lock'
xmodmap -e 'keycode 66 = Control_L NoSymbol NoSymbol NoSymbol'
xmodmap -e 'add Control = Control_L'

# # make a fake escape key (so we can map it with xcape)
xmodmap -e 'keycode 999 = Escape'
xcape -e 'Control_L=Escape'

# assign return to control on press, return on release
xmodmap -e 'keycode 36 = 0x1234'
xmodmap -e 'add Control = 0x1234'

# make a fake return key (so we can map it with xcape)
xmodmap -e 'keycode any = Return'
xcape -e '0x1234=Return'
