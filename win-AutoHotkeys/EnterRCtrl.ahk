; 参考 https://vim.fandom.com/wiki/Map_caps_lock_to_escape_in_Windows#SharpKeys
; Enter单个按下，为Enter键
; 和其他按键一起按下，为右Ctrl键

#IfWinNotActive ahk_exe mstsc.exe

; Enter & a之类的remap，把Enter作为prefix后会失去本来的Enter键功能
; 即Enter键功能失效，需要重新发送 {Enter}
Enter:: Send {Enter}

Enter & a::Send ^a
Enter & b::Send ^b
Enter & c::Send ^c
Enter & d::Send ^d
Enter & e::Send ^e
Enter & g::Send ^g
Enter & h::Send ^h
Enter & i::Send ^i
Enter & j::Send ^j
Enter & k::Send ^k
Enter & l::Send ^l
Enter & m::Send ^m
Enter & n::Send ^n
Enter & o::Send ^o
Enter & p::Send ^p
Enter & q::Send ^q
Enter & r::Send ^r
Enter & s::Send ^s
Enter & t::Send ^t
Enter & u::Send ^u
Enter & v::Send ^v
Enter & w::Send ^w
Enter & x::Send ^x
Enter & y::Send ^y
Enter & z::Send ^z
Enter & 0::Send ^0
Enter & 1::Send ^1
Enter & 2::Send ^2
Enter & 3::Send ^3
Enter & 4::Send ^4
Enter & 5::Send ^5
Enter & 6::Send ^6
Enter & 7::Send ^7
Enter & 8::Send ^8
Enter & 9::Send ^9
Enter & '::Send ^'
Enter & ,::Send ^,
Enter & .::Send ^.
Enter & /::Send ^/
Enter & -::Send ^-
Enter & =::Send ^=
Enter & [::Send ^[
Enter & ]::Send ^]
Enter & F1::Send ^{F1}
Enter & F2::Send ^{F2}
Enter & F3::Send ^{F3}
Enter & F4::Send ^{F4}
Enter & F5::Send ^{F5}
Enter & F6::Send ^{F6}
Enter & F7::Send ^{F7}
Enter & F8::Send ^{F8}
Enter & F9::Send ^{F9}
Enter & F10::Send ^{F10}
Enter & F11::Send ^{F11}
Enter & F12::Send ^{F12}

Return