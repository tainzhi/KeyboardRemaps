;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;; ; AHK版本：		1.1.23.01
; 语言：		中文
; 作者：		lspcieee <lspcieee@gmail.com>
; 网站：		http://www.lspcieee.com/
; 脚本功能：	自动切换输入法(该方法废弃)
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; *CapsLock::
;     Send {Blind}{LCtrl Down}
;     cDown := A_TickCount
; Return

; *CapsLock up::
;     ; Modify the threshold time (in milliseconds) as necessary
;     If ((A_TickCount-cDown) < 200)
;         Send {Blind}{LCtrl Up}{Esc}
;     Else
;         Send {Blind}{LCtrl Up}
; Return

;; Enter => Esc / LCtrl (hold)
;SetKeyDelay, -1
; $*Enter::
;     Send {Blind}{RCtrl Down}
;     cDown := A_TickCount
;     Return

; $*Enter up::
;     ; Modify the threshold time (in milliseconds) as necessary
;     ; If ((A_TickCount-cDown) < 200 && (GetKeyState(Enter) = 1))
;     if ((A_TickCount - cDown) < 200)
;         Send {Blind}{Rctrl Up}{Enter}
;     Else
;         Send {Blind}{RCtrl Up}
;     Return
    
; #IfWinNotActive ahk_exe pwsh.exe,Codex.exe
;     ; remap <Ctrl> + p to Up
;     ^p::Up
;     ; remap <Ctrl> + n to Up
;     ^n::Down
; Return