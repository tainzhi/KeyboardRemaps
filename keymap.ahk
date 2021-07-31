;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; AHK版本：		1.1.23.01
; 语言：		中文
; 作者：		lspcieee <lspcieee@gmail.com>
; 网站：		http://www.lspcieee.com/
; 脚本功能：	自动切换输入法
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
*CapsLock::
    Send {Blind}{LCtrl Down}
    cDown := A_TickCount
Return

*CapsLock up::
    ; Modify the threshold time (in milliseconds) as necessary
    If ((A_TickCount-cDown) < 200)
        Send {Blind}{LCtrl Up}{Esc}
    Else
        Send {Blind}{LCtrl Up}
Return

*Enter::
    cDown := A_TickCount
Return

*Enter up::
    ; Modify the threshold time (in milliseconds) as necessary
    If ((A_TickCount-cDown) < 200)
        Send {Enter}
    ; Else If((GetKeyState(LCtrl) = 1))
        ; Send {Blind}{RCtrl Up}{Enter}
    Else
        Send {Blind}{RCtrl Down}
        Send {Blind}{RCtrl Up}
Return
